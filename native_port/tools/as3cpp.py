# -*- coding: utf-8 -*-
"""
ActionScript 3 -> C++17 transpiler for the decompiled Paladog game classes.

The decompiled code (FFDec output) uses a very small, statically typed subset of
AS3, so a typed single-pass translator is enough:

  int/uint -> int          Number -> double       Boolean -> bool
  String   -> std::string  Array  -> as3::Array   (elements are as3::Value)
  game class -> Class*     Library -> Lib*

Untyped array elements are as3::Value; reading them as a typed value goes through
conv() (`.i32()`, `.num()`, `.as<T>()` ...). Arrays that only ever hold one game
class (ENEMY, UNIT, ...) are detected by scanning `X[i] = new T()` assignments.

Usage (from the repository root):
    python native_port/tools/as3cpp.py [--only Unit,Enemy] [--list-fail]

Outputs native_port/src/gen/classes.h, one .cpp per class and REPORT.txt with every
function that could not be translated (those get a TODO stub).
"""
import json
import os
import re
import sys

AS_DIR = 'extracted/scripts/scripts/com/fazecat/web/paladog'
OUT_DIR = 'native_port/src/gen'
CONST_JSON = 'native_port/src/generated/constants.json'

# Classes that already exist as hand-written C++ (lib.h) or are not needed.
HAND_CLASSES = {'ASEData', 'BmpImage', 'ImgData', 'FrameData', 'AniData', 'Animation'}
# Classes known by the model but implemented elsewhere (not generated here).
EXTERNAL = {'Library'}
CPP_NAME = {'Library': 'Lib'}

# Methods that are Flash glue and are implemented by hand (prototype only).
SKIP = {
    'Drawing': {'initApp', 'timerStop', 'sleep', 'touchDownAction', 'touchUpAction',
                'touchMoveAction', 'touchOutAction', 'touchOverAction', 'mouseOutAction',
                'sendServerLog', 'run', 'startTimer', 'keyDownAction', 'keyUpAction',
                'onKeyDown', 'onKeyUp', 'keyPress', 'keyRelease'},
}

# Fields declared with an explicit C++ type (instead of the AS one).
FIELD_CPP = {
    'Drawing.ASEANI': 'std::vector<ASEData>',
}
# Fields not emitted at all (declared by hand in EXTRA_MEMBERS).
FIELD_SKIP = set()
EXTRA_MEMBERS = {
    'Drawing': ['#include "../game/drawing_members.inc"'],
}

# Array field name -> element class (in addition to the `X[i] = new T()` scan).
ELEM_HINTS = {}

CPP_KEYWORDS = {
    'alignas', 'alignof', 'and', 'asm', 'auto', 'bool', 'break', 'case', 'catch', 'char',
    'class', 'const', 'continue', 'default', 'delete', 'do', 'double', 'else', 'enum',
    'explicit', 'export', 'extern', 'false', 'float', 'for', 'friend', 'goto', 'if',
    'inline', 'int', 'long', 'mutable', 'namespace', 'new', 'not', 'operator', 'or',
    'private', 'protected', 'public', 'register', 'return', 'short', 'signed', 'sizeof',
    'static', 'struct', 'switch', 'template', 'this', 'throw', 'true', 'try', 'typedef',
    'typename', 'union', 'unsigned', 'using', 'virtual', 'void', 'volatile', 'while', 'xor',
    'NAN', 'INFINITY', 'min', 'max', 'near', 'far', 'small', 'interface', 'main', 'errno',
    'stdin', 'stdout', 'stderr', 'signal', 'time', 'clock', 'log', 'exp', 'abs', 'rand',
    'index', 'remove', 'rename', 'y0', 'y1', 'j0', 'j1', 'random', 'link', 'free', 'select',
}


def mangle(name):
    return name + '_' if name in CPP_KEYWORDS else name


class Fail(Exception):
    pass


def fail(msg):
    raise Fail(msg)


# =============================================================================
# Lexer
# =============================================================================
TOKEN_RE = re.compile(r'''
 (?P<ws>\s+)
|(?P<lc>//[^\n]*)
|(?P<bc>/\*.*?\*/)
|(?P<num>0[xX][0-9a-fA-F]+|(?:\d+\.\d*|\.\d+|\d+)(?:[eE][+-]?\d+)?)
|(?P<id>[A-Za-z_$][\w$]*)
|(?P<str>"(?:[^"\\\n]|\\.)*"|'(?:[^'\\\n]|\\.)*')
|(?P<op>>>>=|<<=|>>=|>>>|===|!==|\.\.\.|\+\+|--|&&|\|\||==|!=|<=|>=|\+=|-=|\*=|/=|%=|&=|\|=|\^=|<<|>>|[{}()\[\];,.:?~!+\-*/%&|^<>=@])
''', re.X | re.S)


def tokenize(src):
    toks = []
    pos = 0
    line = 1
    n = len(src)
    while pos < n:
        m = TOKEN_RE.match(src, pos)
        if not m:
            raise SyntaxError(f'bad character {src[pos]!r} at line {line}')
        kind = m.lastgroup
        text = m.group()
        if kind in ('ws', 'lc', 'bc'):
            pass
        elif kind == 'str':
            toks.append(('str', unescape(text[1:-1]), line))
        else:
            toks.append((kind, text, line))
        line += text.count('\n')
        pos = m.end()
    return toks


def unescape(s):
    out = []
    i = 0
    while i < len(s):
        c = s[i]
        if c != '\\':
            out.append(c)
            i += 1
            continue
        i += 1
        c = s[i]
        if c == 'n': out.append('\n')
        elif c == 'r': out.append('\r')
        elif c == 't': out.append('\t')
        elif c == 'b': out.append('\b')
        elif c == 'f': out.append('\f')
        elif c == 'u':
            out.append(chr(int(s[i + 1:i + 5], 16)))
            i += 4
        elif c == 'x':
            out.append(chr(int(s[i + 1:i + 3], 16)))
            i += 2
        else:
            out.append(c)
        i += 1
    return ''.join(out)


def cpp_string(s):
    out = []
    for b in s.encode('utf-8'):
        if b == 0x22: out.append('\\"')
        elif b == 0x5C: out.append('\\\\')
        elif b == 0x0A: out.append('\\n')
        elif b == 0x0D: out.append('\\r')
        elif b == 0x09: out.append('\\t')
        elif b == 0x3F: out.append('\\077')
        elif 0x20 <= b < 0x7F: out.append(chr(b))
        else: out.append('\\%03o' % b)
    return '"' + ''.join(out) + '"'


# =============================================================================
# Parser
# =============================================================================
BINPREC = {
    '||': 1, '&&': 2, '|': 3, '^': 4, '&': 5,
    '==': 6, '!=': 6, '===': 6, '!==': 6,
    '<': 7, '>': 7, '<=': 7, '>=': 7, 'as': 7, 'is': 7, 'instanceof': 7, 'in': 7,
    '<<': 8, '>>': 8, '>>>': 8,
    '+': 9, '-': 9, '*': 10, '/': 10, '%': 10,
}
ASSIGN_OPS = {'=', '+=', '-=', '*=', '/=', '%=', '&=', '|=', '^=', '<<=', '>>=', '>>>='}
MODIFIERS = {'public', 'private', 'protected', 'internal', 'static', 'override', 'final', 'native', 'dynamic'}


class Parser:
    def __init__(self, toks, pos=0, end=None):
        self.t = toks
        self.p = pos
        self.end = len(toks) if end is None else end

    # -- helpers
    def peek(self, o=0):
        i = self.p + o
        return self.t[i] if i < self.end else ('eof', '', 0)

    def next(self):
        t = self.peek()
        self.p += 1
        return t

    def is_op(self, v, o=0):
        t = self.peek(o)
        return t[0] == 'op' and t[1] == v

    def is_id(self, v, o=0):
        t = self.peek(o)
        return t[0] == 'id' and t[1] == v

    def expect_op(self, v):
        t = self.next()
        if t[0] != 'op' or t[1] != v:
            raise SyntaxError(f'line {t[2]}: expected {v!r}, got {t[1]!r}')
        return t

    def expect_id(self):
        t = self.next()
        if t[0] != 'id':
            raise SyntaxError(f'line {t[2]}: expected identifier, got {t[1]!r}')
        return t[1]

    def accept_op(self, v):
        if self.is_op(v):
            self.p += 1
            return True
        return False

    # -- types
    def parse_type(self):
        if self.accept_op('*'):
            return '*'
        name = self.expect_id()
        while self.is_op('.') and self.peek(1)[0] == 'id':
            self.p += 1
            name = self.expect_id()
        if self.is_op('.') and self.is_op('<', 1):  # Vector.<T>
            fail('Vector type')
        return name

    def skip_balanced(self, open_, close):
        depth = 0
        while True:
            t = self.next()
            if t[0] == 'eof':
                raise SyntaxError('unbalanced ' + open_)
            if t[0] == 'op' and t[1] == open_:
                depth += 1
            elif t[0] == 'op' and t[1] == close:
                depth -= 1
                if depth == 0:
                    return

    # -- expressions
    def parse_expr(self):
        e = self.parse_assign()
        while self.is_op(','):
            self.p += 1
            e = ('comma', e, self.parse_assign())
        return e

    def parse_assign(self):
        left = self.parse_cond()
        t = self.peek()
        if t[0] == 'op' and t[1] in ASSIGN_OPS:
            self.p += 1
            right = self.parse_assign()
            return ('assign', t[1], left, right, t[2])
        return left

    def parse_cond(self):
        c = self.parse_bin(1)
        if self.is_op('?'):
            self.p += 1
            a = self.parse_assign()
            self.expect_op(':')
            b = self.parse_assign()
            return ('cond', c, a, b)
        return c

    def parse_bin(self, minp):
        left = self.parse_unary()
        while True:
            t = self.peek()
            if t[0] == 'op' or (t[0] == 'id' and t[1] in ('as', 'is', 'instanceof', 'in')):
                op = t[1]
            else:
                break
            p = BINPREC.get(op)
            if p is None or p < minp:
                break
            self.p += 1
            if op == 'as':
                right = ('type', self.parse_type())
            else:
                right = self.parse_bin(p + 1)
            left = ('bin', op, left, right, t[2])
        return left

    def parse_unary(self):
        t = self.peek()
        if t[0] == 'op' and t[1] in ('!', '~', '-', '+'):
            self.p += 1
            return ('un', t[1], self.parse_unary())
        if t[0] == 'op' and t[1] in ('++', '--'):
            self.p += 1
            return ('pre', t[1], self.parse_unary())
        if t[0] == 'id' and t[1] in ('typeof', 'delete', 'void'):
            fail(f'unsupported unary {t[1]}')
        return self.parse_postfix()

    def parse_args(self):
        args = []
        self.expect_op('(')
        if not self.is_op(')'):
            while True:
                args.append(self.parse_assign())
                if not self.accept_op(','):
                    break
        self.expect_op(')')
        return args

    def parse_postfix(self):
        e = self.parse_primary()
        while True:
            t = self.peek()
            if t[0] != 'op':
                break
            if t[1] == '.':
                self.p += 1
                e = ('mem', e, self.expect_id())
            elif t[1] == '[':
                self.p += 1
                i = self.parse_expr()
                self.expect_op(']')
                e = ('idx', e, i)
            elif t[1] == '(':
                e = ('call', e, self.parse_args(), t[2])
            elif t[1] in ('++', '--'):
                self.p += 1
                e = ('post', t[1], e)
            else:
                break
        return e

    def parse_primary(self):
        t = self.next()
        k, v, line = t
        if k == 'num':
            return ('num', v)
        if k == 'str':
            return ('str', v)
        if k == 'id':
            if v == 'new':
                callee = ('id', self.expect_id())
                while True:
                    if self.is_op('.'):
                        self.p += 1
                        callee = ('mem', callee, self.expect_id())
                    elif self.is_op('['):
                        self.p += 1
                        i = self.parse_expr()
                        self.expect_op(']')
                        callee = ('idx', callee, i)
                    else:
                        break
                args = self.parse_args() if self.is_op('(') else []
                return ('new', callee, args)
            if v == 'function':
                fail('function literal')
            return ('id', v)
        if k == 'op':
            if v == '(':
                e = self.parse_expr()
                self.expect_op(')')
                return ('paren', e)
            if v == '[':
                items = []
                if not self.is_op(']'):
                    while True:
                        items.append(self.parse_assign())
                        if not self.accept_op(','):
                            break
                self.expect_op(']')
                return ('arrlit', items)
            if v == '{':
                fail('object literal')
        raise SyntaxError(f'line {line}: unexpected token {v!r}')

    # -- statements
    def parse_block(self):
        self.expect_op('{')
        stmts = []
        while not self.is_op('}'):
            if self.peek()[0] == 'eof':
                raise SyntaxError('unterminated block')
            stmts.append(self.parse_stmt())
        self.expect_op('}')
        return stmts

    def parse_body(self):
        """Statements until the end of the token window (function body)."""
        stmts = []
        while self.peek()[0] != 'eof':
            stmts.append(self.parse_stmt())
        return stmts

    def parse_var(self):
        self.next()  # var
        decls = []
        while True:
            name = self.expect_id()
            typ = '*'
            if self.accept_op(':'):
                typ = self.parse_type()
            init = None
            if self.accept_op('='):
                init = self.parse_assign()
            decls.append((name, typ, init))
            if not self.accept_op(','):
                break
        return ('var', decls)

    def parse_stmt(self):
        t = self.peek()
        k, v, line = t
        if k == 'op':
            if v == '{':
                return ('block', self.parse_block())
            if v == ';':
                self.p += 1
                return ('empty',)
        if k == 'id':
            if v == 'var':
                s = self.parse_var()
                self.accept_op(';')
                return s
            if v == 'if':
                self.p += 1
                self.expect_op('(')
                c = self.parse_expr()
                self.expect_op(')')
                a = self.parse_stmt()
                b = None
                if self.is_id('else'):
                    self.p += 1
                    b = self.parse_stmt()
                return ('if', c, a, b)
            if v == 'while':
                self.p += 1
                self.expect_op('(')
                c = self.parse_expr()
                self.expect_op(')')
                return ('while', c, self.parse_stmt())
            if v == 'do':
                self.p += 1
                body = self.parse_stmt()
                if not self.is_id('while'):
                    raise SyntaxError(f'line {line}: do without while')
                self.p += 1
                self.expect_op('(')
                c = self.parse_expr()
                self.expect_op(')')
                self.accept_op(';')
                return ('dowhile', body, c)
            if v == 'for':
                self.p += 1
                if self.is_id('each'):
                    fail('for each')
                self.expect_op('(')
                init = None
                if self.is_id('var'):
                    init = self.parse_var()
                elif not self.is_op(';'):
                    init = ('expr', self.parse_expr(), line)
                if self.is_id('in'):
                    fail('for in')
                self.expect_op(';')
                cond = None if self.is_op(';') else self.parse_expr()
                self.expect_op(';')
                step = None if self.is_op(')') else self.parse_expr()
                self.expect_op(')')
                return ('for', init, cond, step, self.parse_stmt())
            if v == 'switch':
                self.p += 1
                self.expect_op('(')
                d = self.parse_expr()
                self.expect_op(')')
                self.expect_op('{')
                cases = []
                while not self.is_op('}'):
                    if self.is_id('case'):
                        self.p += 1
                        label = self.parse_expr()
                        self.expect_op(':')
                    elif self.is_id('default'):
                        self.p += 1
                        self.expect_op(':')
                        label = None
                    else:
                        raise SyntaxError(f'line {self.peek()[2]}: expected case')
                    body = []
                    while not (self.is_op('}') or self.is_id('case') or self.is_id('default')):
                        body.append(self.parse_stmt())
                    cases.append((label, body))
                self.expect_op('}')
                return ('switch', d, cases)
            if v == 'return':
                self.p += 1
                e = None
                if not self.is_op(';') and not self.is_op('}'):
                    e = self.parse_expr()
                self.accept_op(';')
                return ('return', e, line)
            if v == 'break':
                self.p += 1
                self.accept_op(';')
                return ('break',)
            if v == 'continue':
                self.p += 1
                self.accept_op(';')
                return ('continue',)
            if v in ('throw', 'try', 'with'):
                fail(f'statement {v}')
        e = self.parse_expr()
        self.accept_op(';')
        return ('expr', e, line)


# =============================================================================
# Class model
# =============================================================================
class Field:
    def __init__(self, name, typ, static, const, init):
        self.name, self.type, self.static, self.const, self.init = name, typ, static, const, init


class Method:
    def __init__(self, name, params, ret, static, body, kind, line):
        self.name, self.params, self.ret = name, params, ret
        self.static, self.body, self.kind, self.line = static, body, kind, line


class Cls:
    def __init__(self, name, sup, toks):
        self.name, self.sup, self.toks = name, sup, toks
        self.fields = {}
        self.methods = {}
        self.ctor = None


def norm_type(t):
    if t in ('uint', 'int'):
        return 'int'
    if t == '*' or t == 'Object':
        return 'Value'
    return t


def parse_class_file(path):
    src = open(path, encoding='utf-8').read()
    toks = tokenize(src)
    p = Parser(toks)
    while not p.is_id('class'):
        if p.peek()[0] == 'eof':
            return None
        p.next()
    p.next()
    name = p.expect_id()
    sup = None
    if p.is_id('extends'):
        p.next()
        sup = p.parse_type()
    if p.is_id('implements'):
        p.next()
        p.parse_type()
        while p.accept_op(','):
            p.parse_type()
    p.expect_op('{')
    cls = Cls(name, sup, toks)
    while not p.is_op('}'):
        if p.is_op('['):  # metadata
            p.skip_balanced('[', ']')
            continue
        mods = set()
        while p.peek()[0] == 'id' and p.peek()[1] in MODIFIERS:
            mods.add(p.next()[1])
        t = p.peek()
        if t[0] == 'id' and t[1] in ('var', 'const'):
            const = t[1] == 'const'
            p.next()
            fname = p.expect_id()
            ftype = 'Value'
            if p.accept_op(':'):
                ftype = norm_type(p.parse_type())
            init = None
            if p.accept_op('='):
                start = p.p
                depth = 0
                while True:
                    tt = p.peek()
                    if tt[0] == 'eof':
                        raise SyntaxError('unterminated field init')
                    if tt[0] == 'op':
                        if tt[1] in '([{':
                            depth += 1
                        elif tt[1] in ')]}':
                            depth -= 1
                        elif tt[1] == ';' and depth == 0:
                            break
                    p.p += 1
                init = (start, p.p)
            p.accept_op(';')
            cls.fields[fname] = Field(fname, ftype, 'static' in mods, const, init)
        elif t[0] == 'id' and t[1] == 'function':
            line = t[2]
            p.next()
            kind = 'normal'
            if p.peek()[0] == 'id' and p.peek()[1] in ('get', 'set') and p.peek(1)[0] == 'id':
                kind = p.next()[1]
            mname = p.expect_id()
            p.expect_op('(')
            params = []
            while not p.is_op(')'):
                if p.accept_op('...'):
                    pn = p.expect_id()
                    if p.accept_op(':'):
                        p.parse_type()
                    params.append((pn, 'rest', None))
                else:
                    pn = p.expect_id()
                    pt = 'Value'
                    if p.accept_op(':'):
                        pt = norm_type(p.parse_type())
                    default = None
                    if p.accept_op('='):
                        start = p.p
                        while not (p.is_op(',') or p.is_op(')')):
                            p.p += 1
                        default = (start, p.p)
                    params.append((pn, pt, default))
                if not p.accept_op(','):
                    break
            p.expect_op(')')
            ret = 'void'
            if p.accept_op(':'):
                ret = norm_type(p.parse_type())
            body = None
            if p.is_op('{'):
                start = p.p + 1
                p.skip_balanced('{', '}')
                body = (start, p.p - 1)
            else:
                p.accept_op(';')
            m = Method(mname, params, ret, 'static' in mods, body, kind, line)
            if mname == name:
                cls.ctor = m
            elif kind == 'normal':
                cls.methods[mname] = m
        else:
            raise SyntaxError(f'{path}: line {t[2]}: unexpected {t[1]!r} in class body')
    return cls


# =============================================================================
# Model: all classes, constants, array element classes
# =============================================================================
class Model:
    def __init__(self):
        self.classes = {}
        self.consts = {}
        self.tables = {}
        self.elem = dict(ELEM_HINTS)
        info = json.load(open(CONST_JSON, encoding='utf-8'))
        self.consts = info['consts']
        self.tables = {c: set(v) for c, v in info['tables'].items()}
        flat_all = []
        for fn in sorted(os.listdir(AS_DIR)):
            if not fn.endswith('.as') or fn.startswith(('Library_', 'Logo')):
                continue
            path = os.path.join(AS_DIR, fn)
            c = parse_class_file(path)
            if c:
                self.classes[c.name] = c
            flat_all.append(re.sub(r'(\w)\s*\n\s*\.(\w)', r'\1.\2',
                                   open(path, encoding='utf-8').read()))
        pat = re.compile(r'(\w+)\[[^\]]*\]\s*=\s*new (\w+)\(')
        conflicts = {}
        for src in flat_all:
            for arr, cname in pat.findall(src):
                if cname == 'Array' or cname not in self.classes:
                    continue
                if arr in self.elem and self.elem[arr] != cname:
                    conflicts.setdefault(arr, set()).update({self.elem[arr], cname})
                self.elem.setdefault(arr, cname)
        for arr in conflicts:
            self.elem.pop(arr, None)
        self.elem_conflicts = conflicts

    def field_of(self, cname, fname):
        c = self.classes.get(cname)
        while c:
            if fname in c.fields:
                return c.fields[fname]
            c = self.classes.get(c.sup) if c.sup else None
        return None

    def method_of(self, cname, mname):
        c = self.classes.get(cname)
        while c:
            if mname in c.methods:
                return c.methods[mname]
            c = self.classes.get(c.sup) if c.sup else None
        return None


NUMERIC = ('int', 'Number', 'Boolean')
SPECIAL_STATIC = {'Math', 'Keyboard', 'BlendMode', 'SharedObject'}

KEYCODES = {
    'ESCAPE': 27, 'ENTER': 13, 'SPACE': 32, 'LEFT': 37, 'UP': 38, 'RIGHT': 39, 'DOWN': 40,
    'BACKSPACE': 8, 'TAB': 9, 'SHIFT': 16, 'CONTROL': 17, 'DELETE': 46, 'HOME': 36, 'END': 35,
}
for _i in range(26):
    KEYCODES[chr(65 + _i)] = 65 + _i
for _i in range(10):
    KEYCODES['NUMBER_%d' % _i] = 48 + _i
    KEYCODES['NUMPAD_%d' % _i] = 96 + _i
for _i in range(1, 13):
    KEYCODES['F%d' % _i] = 111 + _i
BLENDMODES = {'ADD': 'add', 'NORMAL': 'normal', 'ALPHA': 'alpha', 'LAYER': 'layer', 'MULTIPLY': 'multiply'}


# =============================================================================
# Emitter
# =============================================================================
class Gen:
    def __init__(self, model, cls, locals_=None, ret='void'):
        self.m = model
        self.cls = cls          # Cls being generated (or None)
        self.locals = locals_ or {}
        self.ret = ret

    # ---------------------------------------------------------------- types
    def is_class(self, t):
        return t in self.m.classes

    def cpp(self, t):
        if t == 'int': return 'int'
        if t == 'Number': return 'double'
        if t == 'Boolean': return 'bool'
        if t == 'String': return 'std::string'
        if t == 'Array': return 'as3::Array'
        if t in ('Value', '*', 'Object'): return 'as3::Value'
        if t == 'void': return 'void'
        if t == 'URLRequest': return 'as3::URLRequest*'
        if t == 'ByteArray': return 'as3::ByteArray*'
        if t == 'SharedObject': return 'as3::SharedObject*'
        if t in self.m.classes and t not in HAND_CLASSES:
            return CPP_NAME.get(t, t) + '*'
        if t in ('ASEData', 'BmpImage'):
            return t + '*'
        return 'as3::Opaque*'

    def default(self, t):
        if t == 'int': return '0'
        if t == 'Number': return 'NAN'
        if t == 'Boolean': return 'false'
        if t == 'String': return 'std::string()'
        if t == 'Array': return 'as3::Array()'
        if t == 'Value': return 'as3::Value()'
        if t == 'void': return ''
        return 'nullptr'

    # ----------------------------------------------------------- conversion
    def to_bool(self, code, t):
        if t == 'Boolean': return code
        if t == 'int': return f'({code} != 0)'
        if t == 'Number': return f'as3::truthy({code})'
        if t == 'String': return f'(!({code}).empty())'
        if t == 'Array': return f'static_cast<bool>({code})'
        if t == 'Value': return f'({code}).b_()'
        if t == 'null': return 'false'
        return f'({code} != nullptr)'

    def conv(self, code, f, t):
        if f == t:
            return code
        if t in ('Value', '*'):
            if f == 'null': return 'as3::Value(nullptr)'
            if f == 'IntVec': fail('IntVec as value')
            return code
        if t == 'int':
            if f == 'Number': return f'flash::toInt({code})'
            if f == 'Boolean': return f'static_cast<int>({code})'
            if f == 'Value': return f'({code}).i32()'
            if f == 'String': return f'as3::strToInt({code})'
            if f == 'null': return '0'
        elif t == 'Number':
            if f in ('int', 'Boolean'): return f'static_cast<double>({code})'
            if f == 'Value': return f'({code}).num()'
            if f == 'String': return f'as3::strToNum({code})'
            if f == 'null': return '0.0'
        elif t == 'Boolean':
            return self.to_bool(code, f)
        elif t == 'String':
            if f == 'Value': return f'({code}).s()'
            if f == 'null': return 'std::string()'
            if f in ('int', 'Number', 'Boolean'): return f'as3::str({code})'
        elif t == 'Array':
            if f == 'Value': return f'({code}).arr()'
            if f == 'null': return 'as3::Array()'
        elif self.is_class(t) or t in ('ASEData', 'BmpImage', 'URLRequest', 'ByteArray') or t not in (
                'void', 'IntVec'):
            if f == 'null': return 'nullptr'
            if f == 'Value': return f'({code}).as<{self.cpp(t)[:-1]}>()'
            if f.startswith('@'): fail('class used as value')
            if self.is_class(f) and self.is_class(t):
                return code  # upcast / downcast between game classes
        fail(f'cannot convert {f} -> {t}')

    def num_operand(self, code, t):
        if t in ('int', 'Number'): return code, t
        if t == 'Boolean': return f'static_cast<int>({code})', 'int'
        if t == 'Value': return f'({code}).num()', 'Number'
        if t == 'String': return f'as3::strToNum({code})', 'Number'
        if t == 'null': return '0', 'int'
        fail(f'non-numeric operand of type {t}')

    # ---------------------------------------------------------- expressions
    def literal(self, text):
        if text.lower().startswith('0x'):
            v = int(text, 16)
            if v > 0x7FFFFFFF:
                if v > 0xFFFFFFFF:
                    return f'{float(v)!r}', 'Number'
                return f'static_cast<int>({text}u)', 'int'
            return text, 'int'
        if re.fullmatch(r'\d+', text):
            v = int(text)
            if v > 0x7FFFFFFF:
                return f'{float(v)!r}', 'Number'
            return text, 'int'
        v = float(text)
        r = repr(v)
        return r, 'Number'

    def expr(self, n):
        k = n[0]
        f = getattr(self, 'e_' + k, None)
        if f is None:
            fail(f'unsupported expression {k}')
        return f(n)

    def e_paren(self, n):
        return self.expr(n[1])

    def e_num(self, n):
        return self.literal(n[1])

    def e_str(self, n):
        return f'std::string({cpp_string(n[1])})', 'String'

    def e_comma(self, n):
        a, _ = self.expr(n[1])
        b, bt = self.expr(n[2])
        return f'({a}, {b})', bt

    def e_arrlit(self, n):
        items = []
        for it in n[1]:
            c, t = self.expr(it)
            items.append(self.conv(c, t, 'Value'))
        return 'as3::Array::of({' + ', '.join(items) + '})', 'Array'

    def e_type(self, n):
        fail('type used as value')

    def e_id(self, n):
        name = n[1]
        if name == 'this':
            return 'this', self.cls.name
        if name == 'null': return 'nullptr', 'null'
        if name == 'true': return 'true', 'Boolean'
        if name == 'false': return 'false', 'Boolean'
        if name == 'NaN': return 'NAN', 'Number'
        if name == 'undefined': return 'as3::Value()', 'Value'
        if name in self.locals:
            return mangle(name), self.locals[name]
        if self.cls:
            cn = self.cls.name
            ct = self.m.consts.get(cn, {}).get(name)
            if ct:
                return f'k{cn}::{name}', ct
            fld = self.m.field_of(cn, name)
            if fld:
                return f'this->{mangle(name)}', fld.type
        if name in self.m.classes or name in SPECIAL_STATIC:
            return name, '@' + name
        fail(f'unknown identifier {name}')

    def e_mem(self, n):
        obj, name = n[1], n[2]
        code, t = self.expr(obj)
        if t.startswith('@'):
            return self.static_member(t[1:], name)
        if name == 'length':
            if t == 'Array': return f'{code}.length()', 'int'
            if t == 'Value': return f'({code}).length()', 'int'
            if t == 'String': return f'as3::strLength({code})', 'int'
            if t == 'IntVec': return f'static_cast<int>({code}.size())', 'int'
        if t == 'SharedObject':
            if name == 'data': return f'{code}->data', 'Array'
            if name == 'size': return f'{code}->size()', 'int'
        if t == 'ByteArray' and name == 'length':
            return f'{code}->length()', 'int'
        if t == 'Library' and name in self.m.tables.get('Library', ()):
            return f'kLibrary::{name}', 'IntVec'
        if self.is_class(t):
            fld = self.m.field_of(t, name)
            if not fld:
                fail(f'{t} has no field {name}')
            if fld.static:
                return self.static_member(t, name)
            return f'{code}->{mangle(name)}', fld.type
        fail(f'member {name} on type {t}')

    def static_member(self, cname, name):
        if cname == 'Keyboard':
            if name not in KEYCODES:
                fail(f'Keyboard.{name}')
            return str(KEYCODES[name]), 'int'
        if cname == 'BlendMode':
            return f'std::string("{BLENDMODES[name]}")', 'String'
        if cname == 'Math':
            if name == 'PI':
                return '3.141592653589793', 'Number'
            fail(f'Math.{name} as value')
        ct = self.m.consts.get(cname, {}).get(name)
        if ct:
            return f'k{cname}::{name}', ct
        if name in self.m.tables.get(cname, ()):
            return f'k{cname}::{name}', 'IntVec'
        if cname == 'SharedObject':
            fail(f'SharedObject.{name} as value')
        fail(f'unknown static {cname}.{name}')

    def elem_class(self, base_node):
        if base_node[0] == 'paren':
            return self.elem_class(base_node[1])
        if base_node[0] == 'mem':
            return self.m.elem.get(base_node[2])
        if base_node[0] == 'id':
            return None
        return None

    def index_code(self, i):
        c, t = self.expr(i)
        return self.conv(c, t, 'int')

    def e_idx(self, n):
        base, i = n[1], n[2]
        bc, bt = self.expr(base)
        ic = self.index_code(i)
        if bt == 'Array':
            ec = self.elem_class(base)
            if ec:
                return f'{bc}.get({ic}).as<{CPP_NAME.get(ec, ec)}>()', ec
            return f'{bc}.get({ic})', 'Value'
        if bt == 'Value':
            return f'({bc}).get({ic})', 'Value'
        if bt == 'IntVec':
            return f'{bc}[{ic}]', 'int'
        if bt == 'ByteArray':
            return f'{bc}->at({ic})', 'int'
        fail(f'index on type {bt}')

    def lvalue(self, n):
        if n[0] == 'paren':
            return self.lvalue(n[1])
        if n[0] == 'idx':
            bc, bt = self.expr(n[1])
            ic = self.index_code(n[2])
            if bt == 'Array':
                return f'{bc}[{ic}]', 'Value'
            if bt == 'Value':
                return f'({bc})[{ic}]', 'Value'
            if bt == 'ByteArray':
                return f'{bc}->at({ic})', 'int'
            fail(f'index-assign on type {bt}')
        if n[0] in ('id', 'mem'):
            c, t = self.expr(n)
            if t.startswith('@') or t == 'IntVec':
                fail('assign to constant')
            return c, t
        fail('invalid assignment target')

    # -- unary / binary
    def e_un(self, n):
        op = n[1]
        c, t = self.expr(n[2])
        if op == '!':
            return f'(!{self.to_bool(c, t)})', 'Boolean'
        if op == '~':
            return f'(~{self.conv(c, t, "int")})', 'int'
        c, t = self.num_operand(c, t)
        return (f'(-{c})' if op == '-' else c), t

    def e_pre(self, n):
        c, t = self.lvalue(n[2])
        if t not in ('int', 'Number', 'Value'):
            fail(f'{n[1]} on {t}')
        return f'({n[1]}{c})', t

    def e_post(self, n):
        c, t = self.lvalue(n[2])
        if t not in ('int', 'Number', 'Value'):
            fail(f'{n[1]} on {t}')
        return f'({c}{n[1]})', t

    def arith(self, op, l, lt, r, rt):
        if op == '+' and (lt == 'String' or rt == 'String'):
            return f'(as3::str({l}) + as3::str({r}))', 'String'
        if op in ('<<', '>>', '>>>', '&', '|', '^'):
            li, ri = self.conv(l, lt, 'int'), self.conv(r, rt, 'int')
            if op == '<<': return f'as3::shl({li}, {ri})', 'int'
            if op == '>>': return f'as3::shr({li}, {ri})', 'int'
            if op == '>>>': return f'as3::ushr({li}, {ri})', 'int'
            return f'({li} {op} {ri})', 'int'
        l, lt = self.num_operand(l, lt)
        r, rt = self.num_operand(r, rt)
        both_int = lt == 'int' and rt == 'int'
        if op in ('+', '-', '*'):
            return f'({l} {op} {r})', ('int' if both_int else 'Number')
        if op == '/':
            return f'(static_cast<double>({l}) / {r})', 'Number'
        if op == '%':
            if both_int:
                return f'as3::imod({l}, {r})', 'int'
            return f'std::fmod({l}, {r})', 'Number'
        fail(f'operator {op}')

    def equality(self, l, lt, r, rt):
        if rt == 'null' or lt == 'null':
            if lt == 'null' and rt == 'null':
                return 'true'
            if lt == 'null':
                l, lt, r, rt = r, rt, l, lt
            if lt == 'String': return f'({l}).empty()'
            if lt == 'Value': return f'({l}).isNull()'
            if lt == 'Array': return f'({l} == nullptr)'
            if lt in NUMERIC: return 'false'
            return f'({l} == nullptr)'
        if lt in NUMERIC and rt in NUMERIC:
            return f'({l} == {r})'
        if lt == 'String' and rt == 'String':
            return f'({l} == {r})'
        if lt == 'Value' or rt == 'Value':
            return f'as3::eq({self.conv(l, lt, "Value")}, {self.conv(r, rt, "Value")})'
        if lt in NUMERIC and rt == 'String':
            return f'({l} == {self.conv(r, rt, "Number")})'
        if lt == 'String' and rt in NUMERIC:
            return f'({self.conv(l, lt, "Number")} == {r})'
        if lt == rt or (self.is_class(lt) and self.is_class(rt)):
            return f'({l} == {r})'
        fail(f'equality between {lt} and {rt}')

    def e_bin(self, n):
        op = n[1]
        if op == 'as':
            c, t = self.expr(n[2])
            to = norm_type(n[3][1])
            if to == 'Array': return self.conv(c, t, 'Array'), 'Array'
            return self.conv(c, t, to), to
        if op in ('is', 'instanceof', 'in'):
            fail(f'operator {op}')
        l, lt = self.expr(n[2])
        r, rt = self.expr(n[3])
        if op in ('&&', '||'):
            return f'({self.to_bool(l, lt)} {op} {self.to_bool(r, rt)})', 'Boolean'
        if op in ('==', '==='):
            return self.equality(l, lt, r, rt), 'Boolean'
        if op in ('!=', '!=='):
            return f'(!{self.equality(l, lt, r, rt)})', 'Boolean'
        if op in ('<', '>', '<=', '>='):
            if lt == 'String' and rt == 'String':
                return f'({l} {op} {r})', 'Boolean'
            l, _ = self.num_operand(l, lt)
            r, _ = self.num_operand(r, rt)
            return f'({l} {op} {r})', 'Boolean'
        return self.arith(op, l, lt, r, rt)

    def e_cond(self, n):
        c, ct = self.expr(n[1])
        a, at = self.expr(n[2])
        b, bt = self.expr(n[3])
        cc = self.to_bool(c, ct)
        if at == bt:
            return f'({cc} ? {a} : {b})', at
        if at in NUMERIC and bt in NUMERIC:
            t = 'Number' if 'Number' in (at, bt) else 'int'
            return f'({cc} ? {self.conv(a, at, t)} : {self.conv(b, bt, t)})', t
        if at == 'null' and self.is_class(bt):
            return f'({cc} ? nullptr : {b})', bt
        if bt == 'null' and self.is_class(at):
            return f'({cc} ? {a} : nullptr)', at
        return (f'({cc} ? {self.conv(a, at, "Value")} : {self.conv(b, bt, "Value")})', 'Value')

    # -- assignment
    def e_assign(self, n):
        op, lhs, rhs = n[1], n[2], n[3]
        if lhs[0] == 'mem' and lhs[2] == 'length':
            bc, bt = self.expr(lhs[1])
            if bt == 'Array':
                rc, rt = self.expr(rhs)
                return f'{bc}.setLength({self.conv(rc, rt, "int")})', 'void'
        lc, lt = self.lvalue(lhs)
        rc, rt = self.expr(rhs)
        if op == '=':
            return f'({lc} = {self.conv(rc, rt, lt)})', lt
        bop = op[:-1]
        if lt == 'String':
            if bop != '+':
                fail('string compound op')
            return f'({lc} += as3::str({rc}))', lt
        if lt == 'Value':
            if bop in ('+', '-', '*', '/'):
                return f'({lc} {op} {self.conv(rc, rt, "Number")})', lt
            code, _ = self.arith(bop, lc, lt, rc, rt)
            return f'({lc} = {code})', lt
        if lt not in ('int', 'Number'):
            fail(f'compound assign on {lt}')
        code, ty = self.arith(bop, lc, lt, rc, rt)
        if ty == 'String':
            fail('string result into number')
        if lt == 'int' and bop in ('+', '-', '*') and rt in ('int', 'Boolean'):
            return f'({lc} {op} {self.conv(rc, rt, "int")})', lt
        if lt == 'Number' and bop in ('+', '-', '*', '/') and rt != 'String':
            return f'({lc} {op} {self.conv(rc, rt, "Number")})', lt
        return f'({lc} = {self.conv(code, ty, lt)})', lt

    # -- new / call
    def args(self, argnodes, params, what):
        out = []
        fixed = [p for p in params if p[1] != 'rest']
        if len(argnodes) > len(fixed) and not any(p[1] == 'rest' for p in params):
            fail(f'too many arguments to {what}')
        for i, a in enumerate(argnodes):
            c, t = self.expr(a)
            pt = fixed[i][1] if i < len(fixed) else 'Value'
            out.append(self.conv(c, t, pt))
        return out

    def e_new(self, n):
        callee, argnodes = n[1], n[2]
        if callee[0] == 'idx' and callee[1][0] == 'mem' and callee[1][2] == 'EMBEDDB':
            # new this.EMBEDDB[x]() as ByteArray -> native loader for the exported DB file
            return f'this->newEmbedDB({self.index_code(callee[2])})', 'ByteArray'
        if callee[0] != 'id':
            fail('new on complex expression')
        name = callee[1]
        if name == 'Array':
            if not argnodes:
                return 'as3::Array::make()', 'Array'
            if len(argnodes) == 1:
                c, t = self.expr(argnodes[0])
                if t in ('int', 'Number', 'Boolean'):
                    return f'as3::Array::make({self.conv(c, t, "int")})', 'Array'
            items = []
            for a in argnodes:
                c, t = self.expr(a)
                items.append(self.conv(c, t, 'Value'))
            return 'as3::Array::of({' + ', '.join(items) + '})', 'Array'
        if name == 'URLRequest':
            c, t = self.expr(argnodes[0])
            return f'new as3::URLRequest({self.conv(c, t, "String")})', 'URLRequest'
        if name == 'ByteArray':
            return 'new as3::ByteArray()', 'ByteArray'
        if name in self.m.classes and name not in HAND_CLASSES:
            c = self.m.classes[name]
            params = c.ctor.params if c.ctor else []
            a = self.args(argnodes, params, name)
            return f'new {CPP_NAME.get(name, name)}({", ".join(a)})', name
        fail(f'new {name}')

    def e_call(self, n):
        fn, argnodes = n[1], n[2]
        if fn[0] == 'id':
            name = fn[1]
            if name == 'super':
                return '/*super*/0', 'void'
            if name in ('int', 'uint'):
                c, t = self.expr(argnodes[0])
                return self.conv(c, t, 'int'), 'int'
            if name == 'Number':
                c, t = self.expr(argnodes[0])
                return self.conv(c, t, 'Number'), 'Number'
            if name == 'Boolean':
                c, t = self.expr(argnodes[0])
                return self.to_bool(c, t), 'Boolean'
            if name == 'String':
                c, t = self.expr(argnodes[0])
                return self.conv(c, t, 'String') if t != 'String' else c, 'String'
            if name == 'getTimer':
                return 'as3::getTimer()', 'int'
            if name == 'isNaN':
                c, t = self.expr(argnodes[0])
                return f'std::isnan({self.conv(c, t, "Number")})', 'Boolean'
            if name == 'trace':
                return '0', 'void'
            if name == 'navigateToURL':
                c, t = self.expr(argnodes[0])
                return f'as3::navigateToURL({c})', 'void'
            if name == 'parseInt':
                c, t = self.expr(argnodes[0])
                return f'as3::strToInt({self.conv(c, t, "String")})', 'int'
            if name == 'parseFloat':
                c, t = self.expr(argnodes[0])
                return f'as3::strToNum({self.conv(c, t, "String")})', 'Number'
            if name == 'Array':
                return self.e_new(('new', fn, argnodes))
            if name in self.locals:
                fail(f'call of local {name}')
            if self.cls and self.m.method_of(self.cls.name, name):
                return self.method_call('this', self.cls.name, name, argnodes)
            fail(f'unknown function {name}')
        if fn[0] == 'mem':
            obj, name = fn[1], fn[2]
            if obj[0] == 'id' and obj[1] == 'super':
                fail('super.method()')
            oc, ot = self.expr(obj)
            if ot == '@Math':
                return self.math_call(name, argnodes)
            if ot == '@SharedObject' and name == 'getLocal':
                c, t = self.expr(argnodes[0])
                return f'as3::SharedObject::getLocal({self.conv(c, t, "String")})', 'SharedObject'
            if ot.startswith('@'):
                fail(f'static call {ot[1:]}.{name}')
            if ot == 'SharedObject' and name in ('flush', 'clear'):
                return f'{oc}->{name}()', 'void'
            if ot == 'ByteArray':
                if name == 'toString':
                    return f'{oc}->toString()', 'String'
                if name == 'uncompress':
                    return f'{oc}->uncompress()', 'void'
                fail(f'ByteArray.{name}')
            if ot == 'Value' and name in ('charCodeAt', 'substr', 'substring', 'toString'):
                return self.string_call(f'({oc}).s()', name, argnodes)
            if ot == 'String':
                return self.string_call(oc, name, argnodes)
            if ot == 'Array':
                return self.array_call(oc, name, argnodes)
            if self.is_class(ot):
                return self.method_call(oc, ot, name, argnodes)
            fail(f'call {name} on {ot}')
        fail('call of complex expression')

    def method_call(self, oc, cname, name, argnodes):
        m = self.m.method_of(cname, name)
        if not m:
            fail(f'{cname} has no method {name}')
        a = self.args(argnodes, m.params, f'{cname}.{name}')
        code = f'{oc}->{mangle(name)}({", ".join(a)})'
        return code, m.ret

    def math_call(self, name, argnodes):
        cs = []
        for a in argnodes:
            c, t = self.expr(a)
            cs.append(self.conv(c, t, 'Number'))
        simple = {'floor': 'std::floor', 'ceil': 'std::ceil', 'abs': 'std::fabs', 'sqrt': 'std::sqrt',
                  'sin': 'std::sin', 'cos': 'std::cos', 'tan': 'std::tan', 'atan': 'std::atan',
                  'atan2': 'std::atan2', 'pow': 'std::pow', 'asin': 'std::asin', 'acos': 'std::acos',
                  'exp': 'std::exp', 'log': 'std::log'}
        if name in simple:
            return f'{simple[name]}({", ".join(cs)})', 'Number'
        if name == 'round':
            return f'std::floor({cs[0]} + 0.5)', 'Number'
        if name in ('min', 'max'):
            return f'std::{name}<double>({cs[0]}, {cs[1]})', 'Number'
        if name == 'random':
            return '(std::rand() / (RAND_MAX + 1.0))', 'Number'
        fail(f'Math.{name}')

    def string_call(self, oc, name, argnodes):
        cs = []
        for a in argnodes:
            c, t = self.expr(a)
            cs.append(self.conv(c, t, 'int') if name in ('charCodeAt', 'substr', 'substring') else c)
        if name == 'charCodeAt':
            return f'as3::charCodeAt({oc}, {cs[0]})', 'Number'
        if name == 'substr':
            return f'as3::substr({oc}, {", ".join(cs)})', 'String'
        if name == 'substring':
            return f'as3::substring({oc}, {", ".join(cs)})', 'String'
        if name == 'toString':
            return oc, 'String'
        fail(f'String.{name}')

    def array_call(self, oc, name, argnodes):
        if name == 'push' and len(argnodes) == 1:
            c, t = self.expr(argnodes[0])
            return f'({oc}[{oc}.length()] = {self.conv(c, t, "Value")}, {oc}.length())', 'int'
        fail(f'Array.{name}')

    # ------------------------------------------------------------ statements
    def collect_vars(self, stmts, out):
        for s in stmts:
            k = s[0]
            if k == 'var':
                for name, typ, _ in s[1]:
                    t = norm_type(typ)
                    if name in out and out[name] != t:
                        fail(f'variable {name} declared with two types')
                    out[name] = t
            elif k == 'block':
                self.collect_vars(s[1], out)
            elif k == 'if':
                self.collect_vars([s[2]] + ([s[3]] if s[3] else []), out)
            elif k in ('while',):
                self.collect_vars([s[2]], out)
            elif k == 'dowhile':
                self.collect_vars([s[1]], out)
            elif k == 'for':
                self.collect_vars(([s[1]] if s[1] else []) + [s[4]], out)
            elif k == 'switch':
                for _, body in s[2]:
                    self.collect_vars(body, out)

    def stmts(self, stmts, ind):
        out = []
        for s in stmts:
            out.extend(self.stmt(s, ind))
        return out

    def body_of(self, s, ind):
        if s[0] == 'block':
            return self.stmts(s[1], ind)
        return self.stmt(s, ind)

    def stmt(self, s, ind):
        pad = '    ' * ind
        k = s[0]
        if k == 'empty':
            return []
        if k == 'block':
            return [pad + '{'] + self.stmts(s[1], ind + 1) + [pad + '}']
        if k == 'var':
            out = []
            for name, typ, init in s[1]:
                if init is not None:
                    t = norm_type(typ)
                    c, ct = self.expr(init)
                    out.append(f'{pad}{mangle(name)} = {self.conv(c, ct, t)};')
            return out
        if k == 'expr':
            if s[1][0] == 'id' and s[1][1] not in self.locals:
                return []  # decompiler artifact such as a stray `length;`
            try:
                c, _ = self.expr(s[1])
            except Fail as e:
                raise Fail(f'line {s[2]}: {e}')
            if c.startswith('/*super*/'):
                return []
            return [f'{pad}{c};']
        if k == 'if':
            c, ct = self.expr(s[1])
            out = [f'{pad}if ({self.to_bool(c, ct)}) {{'] + self.body_of(s[2], ind + 1)
            if s[3] is not None:
                out.append(pad + '} else {')
                out += self.body_of(s[3], ind + 1)
            out.append(pad + '}')
            return out
        if k == 'while':
            c, ct = self.expr(s[1])
            return ([f'{pad}while ({self.to_bool(c, ct)}) {{'] + self.body_of(s[2], ind + 1) + [pad + '}'])
        if k == 'dowhile':
            c, ct = self.expr(s[2])
            return ([pad + 'do {'] + self.body_of(s[1], ind + 1) + [f'{pad}}} while ({self.to_bool(c, ct)});'])
        if k == 'for':
            init = ''
            if s[1]:
                if s[1][0] == 'var':
                    parts = []
                    for name, typ, ini in s[1][1]:
                        if ini is not None:
                            c, ct = self.expr(ini)
                            parts.append(f'{mangle(name)} = {self.conv(c, ct, norm_type(typ))}')
                    init = ', '.join(parts)
                else:
                    init = self.expr(s[1][1])[0]
            cond = ''
            if s[2]:
                c, ct = self.expr(s[2])
                cond = self.to_bool(c, ct)
            step = self.expr(s[3])[0] if s[3] else ''
            return ([f'{pad}for ({init}; {cond}; {step}) {{'] + self.body_of(s[4], ind + 1) + [pad + '}'])
        if k == 'switch':
            d, dt = self.expr(s[1])
            out = [f'{pad}switch ({self.conv(d, dt, "int")}) {{']
            for label, body in s[2]:
                if label is None:
                    out.append(f'{pad}default: {{')
                else:
                    lc, lt = self.expr(label)
                    out.append(f'{pad}case {self.conv(lc, lt, "int")}: {{')
                out += self.stmts(body, ind + 1)
                out.append(pad + '}')
            out.append(pad + '}')
            return out
        if k == 'return':
            if s[1] is None:
                return [pad + 'return;']
            c, ct = self.expr(s[1])
            if self.ret == 'void':
                return [f'{pad}{c};', pad + 'return;']
            return [f'{pad}return {self.conv(c, ct, self.ret)};']
        if k == 'break':
            return [pad + 'break;']
        if k == 'continue':
            return [pad + 'continue;']
        fail(f'unsupported statement {k}')


# =============================================================================
# Driver
# =============================================================================
def sig(gen, m, with_defaults, qual=None):
    ps = []
    for pn, pt, default in m.params:
        if pt == 'rest':
            fail('rest parameters')
        s = f'{gen.cpp(pt)} {mangle(pn)}'
        if with_defaults and default:
            toks = m_toks[0]
            dp = Parser(toks, default[0], default[1])
            dc, dt = gen.expr(dp.parse_assign())
            s += f' = {gen.conv(dc, dt, pt)}'
        ps.append(s)
    return ', '.join(ps)


m_toks = [None]


def gen_function(model, cls, m, report, ctor_inits=None):
    """Returns (body_lines or None, failure message or None)."""
    toks = cls.toks
    locals_ = {pn: pt for pn, pt, _ in m.params}
    g = Gen(model, cls, dict(locals_), 'void' if m is cls.ctor else m.ret)
    try:
        body = Parser(toks, m.body[0], m.body[1]).parse_body() if m.body else []
        hoisted = {}
        g.collect_vars(body, hoisted)
        for name, t in hoisted.items():
            if name in locals_ and locals_[name] != t:
                fail(f'local {name} shadows parameter with a different type')
            if name not in locals_:
                g.locals[name] = t
        lines = []
        for name, t in hoisted.items():
            if name in locals_:
                continue
            lines.append(f'    {g.cpp(t)} {mangle(name)} = {g.default(t)};')
        if ctor_inits:
            lines += ctor_inits(g)
        lines += g.stmts(body, 1)
        if g.ret != 'void':
            lines.append(f'    return {g.default(g.ret)};')
        return lines, None
    except (Fail, SyntaxError) as e:
        return None, str(e)


def field_cpp_type(g, cls, f):
    key = f'{cls.name}.{f.name}'
    if key in FIELD_CPP:
        return FIELD_CPP[key]
    return g.cpp(f.type)


HAND_FIELDS = {
    'draw', 'IMAGE', 'bLoading', 'nRectX', 'nRectY', 'nRectW', 'nRectH', 'nMusicVolume',
    'nEffectVolume', 'nSaveMusicVolume', 'nSaveEffectVolume', 'nPlayingMusic', 'nMusicPosition',
    'nEffectChannelPos', 'bPlayingSndEff', 'nSndEffStartTime', 'MUSICCHANNEL', 'EFFECTCHANNEL',
    'nLoadImgCount',
}
# Flash loader plumbing that has no native meaning (assets are loaded by lib.cpp).
LIB_SKIP = {
    'aniLoadDone', 'aseAniLoadDone', 'byteLoadDone', 'datLoadDone', 'fbyteLoadDone', 'fdatLoadDone',
    'maxAniLoadDone', 'txtLoadDone', 'xmlLoadDone', 'loadAni', 'loadByteFlashImg', 'loadByteImg',
    'loadImgDat', 'loadTxt', 'loadXml', 'createBmpData', 'createFlashBmpData', 'load3DSMaxAni',
    'setAni', 'drawAni', 'drawAniFrame', 'loadGameAni', 'loadGameData', 'loadGameSnd', 'loadGameDB', 'drawBgBlur',
    'loadHeroDB', 'heroDBLoadDone', 'loadCardBookDB', 'cardBookDBLoadDone', 'loadQuestIconDB',
    'questIconDBLoadDone', 'loadQuestTypeDB', 'questTypeDBLoadDone', 'loadQuestDB', 'questDBLoadDone',
}


def gen_library(model, report, stats):
    cls = model.classes['Library']
    m_toks[0] = cls.toks
    g0 = Gen(model, cls)
    hand_methods = set(re.findall(r'\b([A-Za-z_]\w*)\s*\(', open('native_port/src/game/lib.h', encoding='utf-8').read()))
    inc = ['// GENERATED by native_port/tools/as3cpp.py - do not edit.',
           '// Members of class Lib that come straight from Library.as (included by game/lib.h).']
    gen_fields = []
    for fname, f in cls.fields.items():
        if f.static or fname in HAND_FIELDS or f.type == 'Class':
            continue
        t = g0.cpp(f.type)
        if t == 'as3::Opaque*':
            continue
        gen_fields.append(f)
        inc.append(f'    {t} {mangle(fname)} = {g0.default(f.type)};')
    inc.append('    void initGenFields();')
    methods = []
    for mname, m in cls.methods.items():
        if m.static or mname in hand_methods or mname in LIB_SKIP:
            continue
        try:
            inc.append(f'    {g0.cpp(m.ret)} {mangle(mname)}({sig(g0, m, True)});')
        except Fail as e:
            report.append(('Library', mname, 'signature: ' + str(e)))
            continue
        methods.append((mname, m))
    open(os.path.join(OUT_DIR, 'Lib_members.inc'), 'w', encoding='utf-8', newline='\n').write('\n'.join(inc) + '\n')

    cpp = ['// GENERATED by native_port/tools/as3cpp.py - do not edit.',
           '#include "classes.h"', '']
    cpp.append('void Lib::initGenFields() {')
    g = Gen(model, cls)
    for f in gen_fields:
        if f.init is None:
            continue
        try:
            e = Parser(cls.toks, f.init[0], f.init[1]).parse_assign()
            c, t = g.expr(e)
            cpp.append(f'    this->{mangle(f.name)} = {g.conv(c, t, f.type)};')
        except (Fail, SyntaxError) as ex:
            cpp.append(f'    // TODO field init {f.name}: {ex}')
            report.append(('Library', f'<field {f.name}>', str(ex)))
    cpp.append('}')
    cpp.append('')
    for mname, m in methods:
        rt = g0.cpp(m.ret)
        psig = sig(g0, m, False)
        lines, err = gen_function(model, cls, m, report)
        head = f'{rt} Lib::{mangle(mname)}({psig}) {{'
        cpp.append(head)
        if err:
            stats['fail'] += 1
            report.append(('Library', mname, err))
            cpp.append(f'    // TODO transpile failed: {err}')
            if rt != 'void':
                cpp.append(f'    return {g0.default(m.ret)};')
        else:
            stats['ok'] += 1
            cpp += lines
        cpp.append('}')
        cpp.append('')
    open(os.path.join(OUT_DIR, 'Lib_gen.cpp'), 'w', encoding='utf-8', newline='\n').write('\n'.join(cpp) + '\n')


def main():
    only = None
    args = sys.argv[1:]
    if '--only' in args:
        only = set(args[args.index('--only') + 1].split(','))
    model = Model()
    os.makedirs(OUT_DIR, exist_ok=True)
    gen_classes = [c for n, c in model.classes.items()
                   if n not in HAND_CLASSES and n not in EXTERNAL and (only is None or n in only)]
    all_gen = [n for n in model.classes if n not in HAND_CLASSES and n not in EXTERNAL]
    report = []
    stats = {'ok': 0, 'fail': 0, 'skip': 0}

    # ------------------------------------------------------------ classes.h
    h = ['// GENERATED by native_port/tools/as3cpp.py - do not edit.',
         '#pragma once', '', '#include <cmath>', '#include <string>', '#include <vector>', '',
         '#include "../runtime/as3.h"', '#include "../game/lib.h"',
         '#include "../generated/constants.h"', '']
    for n in all_gen:
        h.append(f'struct {CPP_NAME.get(n, n)};')
    h.append('')

    for cls in [model.classes[n] for n in all_gen]:
        g = Gen(model, cls)
        m_toks[0] = cls.toks
        h.append(f'struct {cls.name} {{')
        for fname, f in cls.fields.items():
            if f.static or f'{cls.name}.{fname}' in FIELD_SKIP:
                continue
            t = field_cpp_type(g, cls, f)
            d = g.default(f.type) if f'{cls.name}.{fname}' not in FIELD_CPP else '{}'
            h.append(f'    {t} {mangle(fname)} = {d};')
        for extra in EXTRA_MEMBERS.get(cls.name, []):
            h.append('    ' + extra)
        ctor = cls.ctor
        ctor_params = ''
        if ctor:
            ctor_params = sig(g, ctor, True)
        h.append(f'    {cls.name}({ctor_params});')
        for mname, m in cls.methods.items():
            if m.static:
                continue
            try:
                h.append(f'    {g.cpp(m.ret)} {mangle(mname)}({sig(g, m, True)});')
            except Fail as e:
                h.append(f'    // {mname}: signature failed: {e}')
                report.append((cls.name, mname, 'signature: ' + str(e)))
        h.append('};')
        h.append('')
    open(os.path.join(OUT_DIR, 'classes.h'), 'w', encoding='utf-8', newline='\n').write('\n'.join(h) + '\n')

    # ------------------------------------------------------------ class cpps
    for cls in gen_classes:
        m_toks[0] = cls.toks
        g0 = Gen(model, cls)
        cpp = ['// GENERATED by native_port/tools/as3cpp.py - do not edit.',
               '#include "classes.h"', '']
        # constructor
        ctor = cls.ctor
        params = ctor.params if ctor else []

        def field_inits(g, cls=cls):
            lines = []
            for fname, f in cls.fields.items():
                if f.static or f.init is None or f'{cls.name}.{fname}' in FIELD_SKIP or \
                        f'{cls.name}.{fname}' in FIELD_CPP:
                    continue
                try:
                    e = Parser(cls.toks, f.init[0], f.init[1]).parse_assign()
                    c, t = g.expr(e)
                    lines.append(f'    this->{mangle(fname)} = {g.conv(c, t, f.type)};')
                except (Fail, SyntaxError) as ex:
                    lines.append(f'    // TODO field init {fname}: {ex}')
                    report.append((cls.name, f'<field {fname}>', str(ex)))
            return lines

        class _M:  # synthetic ctor method
            pass
        cm = ctor if ctor else Method(cls.name, [], 'void', False, None, 'normal', 0)
        lines, err = gen_function(model, cls, cm, report, ctor_inits=field_inits)
        try:
            psig = sig(g0, cm, False)
        except Fail as e:
            psig, err = '', str(e)
        if err:
            report.append((cls.name, cls.name + ' (ctor)', err))
            stats['fail'] += 1
            cpp.append(f'{cls.name}::{cls.name}({psig}) {{ /* TODO ctor: {err} */ }}')
        else:
            stats['ok'] += 1
            cpp.append(f'{cls.name}::{cls.name}({psig}) {{')
            cpp += lines
            cpp.append('}')
        cpp.append('')
        # methods
        for mname, m in cls.methods.items():
            if m.static:
                continue
            if mname in SKIP.get(cls.name, ()):
                stats['skip'] += 1
                continue
            try:
                psig = sig(g0, m, False)
                rt = g0.cpp(m.ret)
            except Fail as e:
                continue
            lines, err = gen_function(model, cls, m, report)
            head = f'{rt} {cls.name}::{mangle(mname)}({psig}) {{'
            if err:
                stats['fail'] += 1
                report.append((cls.name, mname, err))
                cpp.append(head)
                cpp.append(f'    // TODO transpile failed: {err}')
                if rt != 'void':
                    cpp.append(f'    return {g0.default(m.ret)};')
                cpp.append('}')
            else:
                stats['ok'] += 1
                cpp.append(head)
                cpp += lines
                cpp.append('}')
            cpp.append('')
        open(os.path.join(OUT_DIR, cls.name + '.cpp'), 'w', encoding='utf-8', newline='\n').write(
            '\n'.join(cpp) + '\n')

    if only is None or 'Library' in only:
        gen_library(model, report, stats)

    with open(os.path.join(OUT_DIR, 'REPORT.txt'), 'w', encoding='utf-8') as f:
        f.write(f"ok={stats['ok']} failed={stats['fail']} skipped={stats['skip']}\n")
        if model.elem_conflicts:
            f.write(f'element-class conflicts: {model.elem_conflicts}\n')
        for c, mname, e in report:
            f.write(f'{c}.{mname}: {e}\n')
    print(f"ok={stats['ok']} failed={stats['fail']} skipped={stats['skip']}")
    if '--list-fail' in args:
        for c, mname, e in report:
            print(f'{c}.{mname}: {e}')


if __name__ == '__main__':
    main()
