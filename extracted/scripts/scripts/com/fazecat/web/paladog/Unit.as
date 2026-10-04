package com.fazecat.web.paladog
{
   public class Unit
   {
      
      public static const MAX_DMG:int = 15;
      
      public static const MAX_UNITATTACK:int = 15;
      
      public static const SKILL_ATTACK:int = 0;
      
      public static const NORMAL_ATTACK:int = 1;
      
      public static const MAX_ATTACKENEMY:int = 5;
      
      private var draw:Drawing;
      
      public var nType:int;
      
      public var nPosX:Number;
      
      public var nPosY:int;
      
      public var _nPosY:int;
      
      public var nMaxHp:int;
      
      public var nHp:int;
      
      public var nHpRegenTime:int;
      
      public var bWarningHp:Boolean;
      
      public var bAppear:Boolean;
      
      public var bAlive:Boolean;
      
      public var bMove:Boolean;
      
      public var bFrog:Boolean;
      
      public var bReturnFromFrog:Boolean;
      
      public var nFrogStartTime:int;
      
      public var nFrogTime:int;
      
      public var nFrogAniFrame:int;
      
      public var DMGKIND:Array = new Array(MAX_DMG);
      
      public var DMGPOSX:Array = new Array(MAX_DMG);
      
      public var DMGPOSY:Array = new Array(MAX_DMG);
      
      public var DMGANIFRAME:Array = new Array(MAX_DMG);
      
      public var DMGFROMENEMY:Array = new Array(MAX_DMG);
      
      public var bHealing:Boolean;
      
      public var nHealingFrame:int;
      
      public var bWagon:Boolean;
      
      public var nAttack:int;
      
      public var nSkillAttack:Number;
      
      public var nAttackDelay:int;
      
      public var nAttackDelayStartTime:int;
      
      public var nAttackLen:int;
      
      public var nSkillAttackLen:int;
      
      public var nAttackNum:int;
      
      public var nSkillAttackNum:int;
      
      public var nAttackedLen:int;
      
      public var nBattleLen:int;
      
      public var nAtkFrame:int;
      
      public var nAtk1TotalFrame:int;
      
      public var nAtk2TotalFrame:int;
      
      public var nSkillChance:int;
      
      public var nSkillKnockDownChance:int;
      
      public var bSkillAtk:Boolean;
      
      public var bInAura:Boolean;
      
      public var bDefense:Boolean;
      
      public var bIce:Boolean;
      
      public var nIceStartTime:int;
      
      public var nIceTime:int;
      
      public var nIceAniFrame:int;
      
      public var bPoison:Boolean;
      
      public var nPoisonStartTime:int;
      
      public var nPoisonTime:int;
      
      public var nPoisonDps:int;
      
      public var nPoisonDpsTime:int;
      
      public var nStep:int;
      
      public var nMaxStep:int = 12;
      
      public var nDps:int;
      
      public var nPps:Number;
      
      public var nArmsPosX:int;
      
      public var nArmsPosY:int;
      
      public var nSetSndStartTime:int;
      
      public var nTargetW:int;
      
      public var nTargetH:int;
      
      public var bAttack:Boolean;
      
      public var bAttacked:Boolean;
      
      public var bLastAttackFrame:Boolean;
      
      public var bAttackReady:Boolean;
      
      public var bAttackedStop:Boolean;
      
      public var nAttackedFrame:int;
      
      public var nAttackedTime:int;
      
      public var bDrawAttackedEff:Boolean;
      
      public var nDrawAttackedEffFrame:int;
      
      public var nDrawAttackedEffKind:int;
      
      public var nDrawAttackedEffPosX:int;
      
      public var nDrawAttackedEffPosY:int;
      
      public var nAttackEnemy:int;
      
      public var nAttackedEnemy:int;
      
      public var nDieFrame:int;
      
      public var nDiePos:int;
      
      public var bDieAni:Boolean;
      
      public var bBombDie:Boolean;
      
      public var bKnockDown:Boolean;
      
      public var bArrive:Boolean;
      
      public var nKnockDownDistance:Number;
      
      public var nKnockDownTime:int;
      
      public var nKnockDownAniFrame:int;
      
      public var ATTACKANI:Array = new Array(MAX_UNITATTACK << 1);
      
      public var ATTACKPOSX:Array = new Array(MAX_UNITATTACK);
      
      public var ATTACKPOSY:Array = new Array(MAX_UNITATTACK);
      
      public var ATTACKARMSPOSX:Array = new Array(MAX_UNITATTACK);
      
      public var SUBATTACKARMSPOSX:Array = new Array(MAX_UNITATTACK);
      
      public var ATTACKARMSPOSY:Array = new Array(MAX_UNITATTACK);
      
      public var ATTACKARRIVEPOS:Array = new Array(MAX_UNITATTACK);
      
      public var ATTACKARMSNUM:Array = new Array(MAX_UNITATTACK);
      
      public var ATTACKENEMY:Array = new Array(MAX_UNITATTACK * MAX_ATTACKENEMY);
      
      public var nAttackEnemyPos:Array = new Array(MAX_UNITATTACK);
      
      public var n3DMaxAniFrame:int = 0;
      
      public function Unit(param1:Drawing)
      {
         super();
         this.draw = param1;
      }
   }
}

