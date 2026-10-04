"""Fetch aarch64 SDL2 headers + shared libs (Ubuntu 22.04 arm64) for cross-linking.

The R36S/ArkOS runtime provides the real SDL2 libraries; these are only used
at link time (headers + symbol stubs) when cross-compiling from Windows with zig.

Usage (repo root):  python native_port/tools/fetch_arm64_sdl.py
Output:             native_port/toolchain/arm64-sdk/{include,lib}
"""
import gzip
import io
import os
import shutil
import sys
import tarfile
import urllib.request

BASE = "http://ports.ubuntu.com/ubuntu-ports/"
SUITE = "jammy"
WANT = [
    "libsdl2-dev", "libsdl2-2.0-0",
    "libsdl2-image-dev", "libsdl2-image-2.0-0",
    "libsdl2-mixer-dev", "libsdl2-mixer-2.0-0",
    "libsdl2-ttf-dev", "libsdl2-ttf-2.0-0",
]
OUT = os.path.join(os.path.dirname(__file__), "..", "toolchain", "arm64-sdk")


def fetch(url):
    with urllib.request.urlopen(url, timeout=120) as r:
        return r.read()


def load_index():
    index = {}
    for comp in ("main", "universe"):
        url = f"{BASE}dists/{SUITE}/{comp}/binary-arm64/Packages.gz"
        for suite in (SUITE, SUITE + "-updates"):
            url = f"{BASE}dists/{suite}/{comp}/binary-arm64/Packages.gz"
            try:
                data = gzip.decompress(fetch(url)).decode("utf-8", "replace")
            except Exception as e:  # noqa: BLE001
                print("skip", url, e)
                continue
            for block in data.split("\n\n"):
                name = filename = None
                for line in block.splitlines():
                    if line.startswith("Package: "):
                        name = line[9:].strip()
                    elif line.startswith("Filename: "):
                        filename = line[10:].strip()
                if name and filename and name in WANT:
                    index[name] = filename  # later (updates) overrides
    return index


def extract_deb(data, dest):
    # .deb = ar archive containing data.tar.*
    pos = 8
    while pos < len(data):
        hdr = data[pos:pos + 60]
        name = hdr[:16].decode().strip()
        size = int(hdr[48:58].decode().strip())
        body = data[pos + 60:pos + 60 + size]
        pos += 60 + size + (size & 1)
        if name.startswith("data.tar"):
            if name.endswith(".xz"):
                import lzma
                body = lzma.decompress(body)
            elif name.endswith(".gz"):
                body = gzip.decompress(body)
            elif name.endswith(".zst"):
                import zstandard
                body = zstandard.ZstdDecompressor().stream_reader(io.BytesIO(body)).read()
            with tarfile.open(fileobj=io.BytesIO(body)) as tf:
                for m in tf.getmembers():
                    if m.issym() or m.islnk():
                        continue
                    if m.isfile() and ("/include/" in m.name or ".so" in m.name):
                        tf.extract(m, dest)
            return


def main():
    shutil.rmtree(OUT, ignore_errors=True)
    os.makedirs(OUT)
    index = load_index()
    missing = [w for w in WANT if w not in index]
    if missing:
        print("missing packages:", missing)
        sys.exit(1)
    for pkg in WANT:
        print("fetching", pkg, index[pkg])
        extract_deb(fetch(BASE + index[pkg]), OUT)
    print("done ->", os.path.abspath(OUT))


if __name__ == "__main__":
    main()

