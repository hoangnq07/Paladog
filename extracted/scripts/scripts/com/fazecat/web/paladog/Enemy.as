package com.fazecat.web.paladog
{
   public class Enemy
   {
      
      public static const MAX_DMG:int = 15;
      
      public static const MAX_ENEMYATTACK:int = 15;
      
      public static const SKILL_ATTACK:int = 0;
      
      public static const NORMAL_ATTACK:int = 1;
      
      public static const MAX_ATTACKUNIT:int = 3;
      
      private var draw:Drawing;
      
      public var nType:int;
      
      public var nBaseType:int;
      
      public var nSizeScale:Number;
      
      public var nPosX:Number;
      
      public var nPosY:int;
      
      public var _nPosY:int;
      
      public var nMaxHp:int;
      
      public var nHp:int;
      
      public var nMoney:int;
      
      public var nExp:int;
      
      public var DMGKIND:Array = new Array(MAX_DMG);
      
      public var DMGPOSX:Array = new Array(MAX_DMG);
      
      public var DMGPOSY:Array = new Array(MAX_DMG);
      
      public var DMGANIFRAME:Array = new Array(MAX_DMG);
      
      public var DMGFROMUNIT:Array = new Array(MAX_DMG);
      
      public var bAppear:Boolean;
      
      public var bAlive:Boolean;
      
      public var bMove:Boolean;
      
      public var bBoss:Boolean;
      
      public var bStageBoss:Boolean;
      
      public var bDefense:Boolean;
      
      public var nBossPaladogEffectPos:int;
      
      public var bFence:Boolean;
      
      public var bBomb:Boolean;
      
      public var bGhostMove:Boolean;
      
      public var bInvisible:Boolean;
      
      public var bVisible:Boolean;
      
      public var nGhostStartTime:int;
      
      public var nGhostTime:int;
      
      public var bBaby:Boolean;
      
      public var bBabyGhostMove:Boolean;
      
      public var bBabyInvisible:Boolean;
      
      public var bBabyVisible:Boolean;
      
      public var bBabyGhostMoving:Boolean;
      
      public var bBabyGhostMoveOk:Boolean;
      
      public var nBabyGhostStartTime:int;
      
      public var nBabyGhostTime:int;
      
      public var nBabyGhostMoveDistance:Number;
      
      public var nLoopEffSnd:int;
      
      public var bPoison:Boolean;
      
      public var nPoisonStartTime:int;
      
      public var nPoisonTime:int;
      
      public var nPoisonDps:int;
      
      public var nPoisonDpsTime:int;
      
      public var bIce:Boolean;
      
      public var nIceStartTime:int;
      
      public var nIceTime:int;
      
      public var nIceAniFrame:int;
      
      public var nAttack:int;
      
      public var nAttackDelay:int;
      
      public var nAttackDelayStartTime:int;
      
      public var nAttackLen:int;
      
      public var nAttackNum:int;
      
      public var nAttackedLen:int;
      
      public var nBattleLen:int;
      
      public var nStep:int;
      
      public var nMaxStep:int = 12;
      
      public var nAtkFrame:int;
      
      public var nAtkTotalFrame:int;
      
      public var nDieFrame:int;
      
      public var bArrive:Boolean;
      
      public var nPps:Number;
      
      public var nArmsPosX:int;
      
      public var nArmsPosY:int;
      
      public var nTargetW:int;
      
      public var nTargetH:int;
      
      public var bAttack:Boolean;
      
      public var bAttacked:Boolean;
      
      public var bLastAttackFrame:Boolean;
      
      public var bAttackReady:Boolean;
      
      public var nAttackedFrame:int;
      
      public var bDrawAttackedEff:Boolean;
      
      public var nDrawAttackedEffFrame:int;
      
      public var nDrawAttackedEffKind:int;
      
      public var nDrawAttackedEffPosX:int;
      
      public var nDrawAttackedEffPosY:int;
      
      public var nAttackUnit:int;
      
      public var nAttackedUnit:int;
      
      public var bDieAni:Boolean;
      
      public var bBombDie:Boolean;
      
      public var bKnockDown:Boolean;
      
      public var nKnockDownDistance:Number;
      
      public var nKnockDownTime:int;
      
      public var nKnockDownAniFrame:int;
      
      public var BASEPOSY:int = Player.BG_BASEPOSY + Player.OBJ_BASEPOSY;
      
      public var nArrivePos:int = 100;
      
      public var ATTACKANI:Array = new Array(MAX_ENEMYATTACK << 1);
      
      public var ATTACKPOSX:Array = new Array(MAX_ENEMYATTACK);
      
      public var ATTACKPOSY:Array = new Array(MAX_ENEMYATTACK);
      
      public var ATTACKARMSPOSX:Array = new Array(MAX_ENEMYATTACK);
      
      public var SUBATTACKARMSPOSX:Array = new Array(MAX_ENEMYATTACK);
      
      public var ATTACKARMSPOSY:Array = new Array(MAX_ENEMYATTACK);
      
      public var ATTACKARRIVEPOS:Array = new Array(MAX_ENEMYATTACK);
      
      public var ATTACKARMSNUM:Array = new Array(MAX_ENEMYATTACK);
      
      public var ATTACKENEMY:Array = new Array(MAX_ENEMYATTACK);
      
      public var ATTACKUNIT:Array = new Array(MAX_ENEMYATTACK * MAX_ATTACKUNIT);
      
      public var nAttackUnitPos:Array = new Array(MAX_ENEMYATTACK);
      
      public var n3DMaxAniFrame:int = 0;
      
      public var ATTANI:MaxAni = new MaxAni();
      
      public var DOWNANI:MaxAni = new MaxAni();
      
      public var WALKANI:MaxAni = new MaxAni();
      
      public function Enemy(param1:Drawing)
      {
         super();
         this.draw = param1;
      }
   }
}

