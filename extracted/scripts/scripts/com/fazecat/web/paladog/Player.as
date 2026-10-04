package com.fazecat.web.paladog
{
   import flash.display.*;
   import flash.events.*;
   import flash.media.*;
   import flash.text.*;
   import flash.utils.*;
   
   public class Player
   {
      
      public static const WEB_SCALE:Number = 1.58;
      
      public static const BG_W:int = 1622;
      
      public static const BG2_MOVE:int = 50;
      
      public static const RABBIT_ARMSPOSX:int = 32 * WEB_SCALE;
      
      public static const RABBIT_ARMSPOSY:int = 23 * WEB_SCALE - 1;
      
      public static const KANGAROO_ARMSPOSX:int = 33 * WEB_SCALE;
      
      public static const KANGAROO_ARMSPOSY:int = 35 * WEB_SCALE - 32;
      
      public static const KANGAROO_ARMSRANDPOSY:int = 30 * WEB_SCALE;
      
      public static const PENGUIN_ARMSPOSX:int = 46 * WEB_SCALE;
      
      public static const PENGUIN_ARMSPOSY:int = 14 * WEB_SCALE + 4;
      
      public static const ANI_ATT:int = 0;
      
      public static const ANI_DEAD:int = 1;
      
      public static const ANI_WAIT:int = 2;
      
      public static const ANI_WALK:int = 3;
      
      public static const STOREANI_TALK:int = 0;
      
      public static const STOREANI_WAIT:int = 1;
      
      public static const DESTINYICON_MOVEWIDTH:int = 6;
      
      public static const UNIT_COOLFRAME:int = 60;
      
      public static const WAGON_GOALPOS:int = 170;
      
      public static const WOMANSKELETON_ARMSPOSX:int = 62 * WEB_SCALE;
      
      public static const WOMANSKELETON_ARMSPOSY:int = 33 * WEB_SCALE - 4;
      
      public static const MANSKELETON_ARMSPOSX:int = 62 * WEB_SCALE - 50;
      
      public static const MANSKELETON_ARMSPOSY:int = 33 * WEB_SCALE + 6;
      
      public static const ONEEYEDMONSTER_ARMSPOSX:int = 53 * WEB_SCALE - 40;
      
      public static const ONEEYEDMONSTER_ARMSPOSY:int = 49 * WEB_SCALE + 2;
      
      public static const BOSSWOMANDEVIL_ARMSPOSX:int = 30 * WEB_SCALE;
      
      public static const BOSSWOMANDEVIL_ARMSPOSY:int = 50 * WEB_SCALE - 48;
      
      public static const PALADOG_GODPUNCHPOSX:int = 70 * WEB_SCALE;
      
      public static const PALADOG_GODPUNCHPOSY:int = 55 * WEB_SCALE - 33;
      
      public static const PALADOG_ICEPOSX:int = 70 * WEB_SCALE;
      
      public static const PALADOG_ICEPOSY:int = 55 * WEB_SCALE - 29;
      
      public static const PALADOG_POISONPOSX:int = 50 * WEB_SCALE;
      
      public static const PALADOG_POISONPOSY:int = 50 * WEB_SCALE - 48;
      
      public static const MAX_HEROLEVEL:int = 200;
      
      public static const MAX_SURVIVALHEROLEVEL:int = 999;
      
      public static const BG_BASEPOSY:int = 0;
      
      public static const PLAYER_BASEPOSX:int = 125;
      
      public static const PLAYER_BASEPOSY:int = 260 + 40;
      
      public static const WAGON_BASEPOSY:int = 210 + 40;
      
      public static const WAGON_GOALLINE:int = 140 + 40;
      
      public static const DESTINYFENCE_BASEPOSY:int = 230 + 40;
      
      public static const OBJ_BASEPOSY:int = 230 + 40;
      
      public static const OBJ_BASE_RANGE:int = 60;
      
      public static const MACE_GODPUNCH_PPS:int = 250 * WEB_SCALE;
      
      public static const MACE_HEAL_AREA:int = 150 * WEB_SCALE;
      
      public static const MACE_TURNUNDEAD_AREA:int = 300 * WEB_SCALE;
      
      public static const MACE_ICE_PPS:int = 250 * WEB_SCALE;
      
      public static const MACE_LIGHT_AREA:int = 250 * WEB_SCALE;
      
      public static const MACE_LIGHT_DMGAREA:int = 40 * WEB_SCALE;
      
      public static const MACE_FIRE_AREA:int = 180 * WEB_SCALE;
      
      public static const MACE_METEO_AREA:int = 300 * WEB_SCALE;
      
      public static const MACE_METEO_DMGAREA:int = 80 * WEB_SCALE;
      
      public static const MACE_WIND_AREA:int = 150 * WEB_SCALE;
      
      public static const MACE_WIND_DMGAREA:int = 150 * WEB_SCALE;
      
      public static const MACE_POISON_PPS:int = 250 * WEB_SCALE;
      
      public static const MACE_TURNUNDEAD_EFFCPOS:int = 150 * WEB_SCALE;
      
      public static const UNIT_SCALE_NORMAL:int = 100;
      
      public static const UNIT_SCALE_WARROAD:int = 50;
      
      public static const ENEMY_SCALE_NORMAL:int = 100;
      
      public static const ENEMY_SCALE_UP:int = 120;
      
      public static const ENEMY_SCALE_WARROAD:int = 50;
      
      public static const CHAIMG_HEIGHT:int = 269;
      
      public static const SHADOWIMG_POS:int = 120;
      
      public static const WAGON_MOVEPPS:int = 8;
      
      public static const ENEMY_KNOCKDOWNDISTANCE:Number = 3 * WEB_SCALE;
      
      public static const BOSS_KNOCKDOWNDISTANCE:Number = 9.375 * WEB_SCALE;
      
      public static const UNIT_KNOCKDOWNDISTANCE:Number = 3 * WEB_SCALE;
      
      public static const ENEMYSTATIONATKPOS:int = 160 * WEB_SCALE;
      
      public static const PLAYER_MAXLEFTPOS:int = -40 * WEB_SCALE;
      
      public static const PLAYER_MAXRIGHTPOS:int = BG_W - ENEMYSTATIONATKPOS;
      
      public static const EQUIPINVEN_LEVELPOS:int = 6;
      
      public static const EQUIPINVEN_RINGPOS:int = 3;
      
      public static const PALADOG_DIEKNOCKDOWNDISTANCE:Number = 100 * WEB_SCALE;
      
      public static const PALADOG_DIEANITOTALFRAME:int = 20;
      
      public static const PALADOGDIETOTALFRAME:int = Drawing.FPS * 6;
      
      public static const PALADOGDIESCENE:int = 100;
      
      public static const PALADOGDMGWIDTH:int = 50 * WEB_SCALE;
      
      public static const WAGONDMGWIDTH:int = 80 * WEB_SCALE;
      
      public static const WAGON_STARTPOS:int = 120 * WEB_SCALE;
      
      public static const INVENDATA_LEVELPOS:int = 100;
      
      public static const MAX_BAGNUM:int = 10;
      
      public static const ONEBAG_MAXNUM:int = 10;
      
      public static const KNOCKBACKWIDTH:int = 3 * WEB_SCALE;
      
      public static const WAGONPOS:int = 99;
      
      public static const WAGON_ATTACKEDSTOPTIME:int = 400;
      
      public static const DB_BOSSINDEX:int = 80;
      
      public static const TYPE_SETBOSSINDEX:int = 20;
      
      public static const TYPE_BOSS:int = 40;
      
      public static const SCALEMOBNUM:int = 5;
      
      public static const SCALEPOS:int = 2;
      
      public static const INVEN_STARTPOS:int = 0;
      
      public static const INVEN_ENDPOS:int = INVENDATA_LEVELPOS * 74 - 74 * 9;
      
      public static const BGMOVE_WIDTH:int = 10;
      
      public static const nWarRoadEnemyMaxHp:int = 30;
      
      public static const nBgEffTotalFrame:int = 5;
      
      public static const nArrowPosX:int = 0;
      
      public static const nArrowPosY:int = 0;
      
      public static const MAX_ARMSFRAME:int = 20;
      
      public static const MAX_ATTACK:int = 40;
      
      public static const MAX_ENEMYATTACK:int = 5;
      
      public static const ATTACKEDTOTALFRAME:int = 8;
      
      public static const PALADOGATTACKED:int = 0;
      
      public static const UNITATTACKED:int = 1;
      
      public static const ENEMYATTACKED:int = 2;
      
      public static const DRAWATTACKEDEFFTOTALFRAME:int = 10;
      
      public static const MAX_CHAPTER:int = 5;
      
      public static const MAX_STAGE:int = 24;
      
      public static const MAX_TOTALSTAGE:int = 120;
      
      public static const HPREGENTIME:int = 5000;
      
      public static const MANAREGENTIME:int = 500;
      
      public static const FOODREGENTIME:int = 500;
      
      public static const MAX_DMG:int = 15;
      
      public static const BOSSPALADOGNUM:int = 10;
      
      public static const ENEMYDIEPOSY:int = 1000;
      
      public static const UNITDIEPOSY:int = 1000;
      
      public static const ENEMYSTATIONDISAPPEARTIME:int = 3000;
      
      public static const EATITEM_DRAWTIME:int = 2000;
      
      public static const MAX_ITEMNUM:int = 21;
      
      public static const MAX_DRAWDROPITEM:int = 5;
      
      public static const SURVIVAL_MOBROTATION:int = 2;
      
      public static const SURVIVAL_MAXSTAGE:int = 50;
      
      public static const SURVIVAL_ROTATIONSTAGE:int = 31;
      
      public static const EQUIPARMS_NUM:int = 3;
      
      public static const EQUIPRINGS_NUM:int = 2;
      
      public static const NUM_WARROAD:int = 5;
      
      public static const WARROAD_BASEY:int = 22;
      
      public static const WARROAD_UNITBASEY:int = 150;
      
      public static const WARROAD_UNITBASEYGAGAP:int = 54;
      
      public static const WARROAD_ROADTOUCHBASEY:int = 123;
      
      public static const WARROAD_PALADOGPOSX:int = 90;
      
      public static const WARROAD_PALADOGPOSY:int = 125;
      
      public static const WARROAD_BOSSPOSX:int = 670;
      
      public static const WARROAD_BOSSPOSY:int = 125;
      
      public static const MAX_SKILL:int = 23;
      
      public static const VIEW_SKILLNUM:int = 3;
      
      public static const MAX_UNITSKILL:int = 20;
      
      public static const SKILL_SEELEARN:int = 0;
      
      public static const SKILL_BUSINESS:int = 1;
      
      public static const SKILL_TREASURESEARCH:int = 2;
      
      public static const SKILL_HP:int = 3;
      
      public static const SKILL_HPREGEN:int = 4;
      
      public static const SKILL_DEF:int = 5;
      
      public static const SKILL_RIDING:int = 6;
      
      public static const SKILL_GODLINESS:int = 7;
      
      public static const SKILL_WISH:int = 8;
      
      public static const SKILL_MAGICMASTER:int = 9;
      
      public static const SKILL_FOOD:int = 10;
      
      public static const SKILL_GRANARY:int = 11;
      
      public static const SKILL_LEADERSHIP:int = 12;
      
      public static const SKILL_MOVEAURA:int = 13;
      
      public static const SKILL_ATKAURA:int = 14;
      
      public static const SKILL_DEFAURA:int = 15;
      
      public static const SKILL_DELAYAURA:int = 16;
      
      public static const SKILL_SKILLAURA:int = 17;
      
      public static const SKILL_AREAAURA:int = 18;
      
      public static const SKILL_REGENAURA:int = 19;
      
      public static const SKILL_BERSERKERAURA:int = 20;
      
      public static const SKILL_MACEMASTER:int = 21;
      
      public static const SKILL_RINGMASTER:int = 22;
      
      public static const SKILL_MOUSE:int = 23;
      
      public static const SKILL_RABBIT:int = 24;
      
      public static const SKILL_BEAR:int = 25;
      
      public static const SKILL_KANGAROO:int = 26;
      
      public static const SKILL_TURTLE:int = 27;
      
      public static const SKILL_MONKEY:int = 28;
      
      public static const SKILL_RHINO:int = 29;
      
      public static const SKILL_PENGUIN:int = 30;
      
      public static const SKILL_DRAGON:int = 31;
      
      public static const nClearTimeDepth:int = 120;
      
      public static const STOREDATA_LEVELPOS:int = 10;
      
      public static const SORTING_MACE:int = 0;
      
      public static const SORTING_RING:int = 1;
      
      public static const PALADOG_ATT:int = 0;
      
      public static const PALADOG_DEAD:int = 1;
      
      public static const PALADOG_WAIT:int = 2;
      
      public static const PALADOG_WALK:int = 3;
      
      public static const PALADOGACT_NUM:int = 3;
      
      public static const PALADOGACTANI_NUM:int = 4;
      
      public static const MACEACT_NUM:int = 3;
      
      public static const MACEACTANI_NUM:int = 4;
      
      public static const MACEACT_EFFA:int = 0;
      
      public static const MACEACT_EFFB:int = 1;
      
      public static const MACEACT_EFFC:int = 2;
      
      public static const MAX_ATTACKENEMY:int = 11;
      
      public static const DESTINYTOTALENEMYNUM:int = 60;
      
      public static const MAX_QUEST:int = 3;
      
      public static const MAX_STRQUESTLINE:int = 3;
      
      public static const MAX_QUESTREWARD:int = 2;
      
      public static const QUEST_MAIN:int = 0;
      
      public static const QUEST_COMPLETE:int = 0;
      
      public static const QUEST_WARNING:int = 1;
      
      public static const QUEST_FAIL:int = 2;
      
      public static const QUEST_NONE:int = 3;
      
      public static const MAX_CARDNUM:int = 50;
      
      public static const CARDINDEX_BOSS:int = 100;
      
      public static const CARDBOOK_PAGE:int = 24;
      
      private var draw:Drawing;
      
      public var nGameSpeed:Number = 0;
      
      public var nEnemyStationPosX:int;
      
      public var nEnemyStationPosY:int;
      
      public var nGameMode:int;
      
      public var nSetSndStartTime:int;
      
      public var bSetSndStartTime:Boolean;
      
      public var nPlayerDieWidth:Number;
      
      public var nBgDieWidth:Number;
      
      public var nPaladogDieFrame:int;
      
      public var nScaleMobNum:Array = new Array(2);
      
      public var bScaleMob:Boolean;
      
      public var nBgLeftX:int;
      
      public var nBgRightX:int;
      
      public var nInvenPosX:int;
      
      public var nInvenMovePosX:int;
      
      public var bInvenMouseMove:Boolean;
      
      public var bInvenLeftArrowBtn:Boolean;
      
      public var bInvenRightArrowBtn:Boolean;
      
      public var bDarkBg:Boolean;
      
      public var nDarkBgFrame:int;
      
      public var nMoveWidth:Number;
      
      public var nMoveBg:int;
      
      public var nPosX:Number;
      
      public var nPosY:Number;
      
      public var _nPosY:int;
      
      public var nSubPosX:Number;
      
      public var nBossPosX:int;
      
      public var nBossPosY:int;
      
      public var nWarRoadEnemyHp:int;
      
      public var nSetWarRoadUnit:int;
      
      public var bWarRoadSelectUnit:Boolean;
      
      public var nAttackHorizonPosX:int;
      
      public var nBgPosX:Number;
      
      public var nBg2PosX:Number;
      
      public var nBgPosY:int;
      
      public var nSubBgPosX:Number;
      
      public var nSubBg2PosX:Number;
      
      public var nMoveBgPosX:Number;
      
      public var bBgEff:Boolean;
      
      public var nBgEffFrame:int;
      
      public var nBgEffPosY:int;
      
      public var BGEFFPOS:Array = new Array(2,0,-2,1,0);
      
      public var bDrawLevelUp:Boolean;
      
      public var FIREBTN:Array = new Array(false,false,false);
      
      public var FIREBTNFRAME:Array = new Array(0,0,0);
      
      public var UNITBTN:Array = new Array(false,false,false,false,false,false,false,false,false);
      
      public var UNITBTNFRAME:Array = new Array(0,0,0,0,0,0,0,0,0);
      
      public var bVerticalAppear:Boolean;
      
      public var bHorizonAppear:Boolean;
      
      public var nWarRoadGroupPosY:int;
      
      public var bAttack:Boolean;
      
      public var bAttacked:Boolean;
      
      public var nAttackedFrame:int;
      
      public var bDrawAttackedEff:Boolean;
      
      public var nDrawAttackedEffFrame:int;
      
      public var nDrawAttackedEffKind:int;
      
      public var nDrawAttackedEffPosX:int;
      
      public var nDrawAttackedEffPosY:int;
      
      public var nNowArms:int;
      
      public var nArmsAniFrame:int;
      
      public var nArrowPosX:int;
      
      public var nArrowPosY:int;
      
      public var bMoveLeft:Boolean;
      
      public var bMoveRight:Boolean;
      
      public var nMoveDirection:int;
      
      public var bBgLeft:Boolean;
      
      public var bBgRight:Boolean;
      
      public var bStageClear:Boolean;
      
      public var bDestinyCrash:Boolean;
      
      public var nTouchStage:int;
      
      public var nChapter:int;
      
      public var nStage:int;
      
      public var nClearChapter:int;
      
      public var nClearStage:int;
      
      public var nNowPlayChapter:int;
      
      public var nRealClearStage:int;
      
      public var nEnemySetTime:int;
      
      public var nNowTime:int;
      
      public var nStartTime:int;
      
      public var nPlayTime:int;
      
      public var nPauseTime:int;
      
      public var nHpRegenTime:int;
      
      public var nManaRegenTime:int;
      
      public var nFoodRegenTime:int;
      
      public var nAppearEnemy:int;
      
      public var nAppearTotalEnemy:int;
      
      public var nAppearTime:int;
      
      public var nAppearUnit:int;
      
      public var DMGKIND:Array = new Array(MAX_DMG);
      
      public var DMGPOSX:Array = new Array(MAX_DMG);
      
      public var DMGPOSY:Array = new Array(MAX_DMG);
      
      public var DMGANIFRAME:Array = new Array(MAX_DMG);
      
      public var DMGFROMENEMY:Array = new Array(MAX_DMG);
      
      public var bPoison:Boolean;
      
      public var nPoisonStartTime:int;
      
      public var nPoisonTime:int;
      
      public var nPoisonDps:int;
      
      public var nPoisonDpsTime:int;
      
      public var BOSSPALADOGPOS:Array = new Array(BOSSPALADOGNUM);
      
      public var nAuraAttackDelay:Number;
      
      public var nAuraSkillChance:Number;
      
      public var bEnemyStationDisAppear:Boolean;
      
      public var nEnemyStationDisAppearTime:int;
      
      public var nEnemyStationHp:int;
      
      public var nEnemyStationMaxHp:int;
      
      public var nEnemyStationAttackedFrame:int;
      
      public var nEnemyStationBadEnergyFrame:int;
      
      public var bEnemyStationAttacked:Boolean;
      
      public var bEnemyStationCrashed:Boolean;
      
      public var bEnemyStationBadEnergy:Boolean;
      
      public var bBossEnemyAppear:Boolean;
      
      public var nBossEnemyIndex:int;
      
      public var nGamePlayTime:int;
      
      public var nGamePlayStartTime:int;
      
      public var nLevel:int;
      
      public var nLevelUpFrame:int;
      
      public var nLevelUpSkill:int;
      
      public var nHp:int;
      
      public var nExp:int;
      
      public var nMoney:int;
      
      public var nGem:int;
      
      public var bLevelUp:Boolean;
      
      public var bDrawLevelUpTurn:Boolean;
      
      public var bDrawEatItem:Boolean;
      
      public var nDrawEatItemTime:int;
      
      public var nEatItem:int;
      
      public var nEatItemLevel:int;
      
      public var nEatCard:int;
      
      public var DRAWDROPITEM:Array = new Array(MAX_DRAWDROPITEM);
      
      public var DRAWDROPITEMTIME:Array = new Array(MAX_DRAWDROPITEM);
      
      public var DRAWDROPITEMBAG:Array = new Array(MAX_DRAWDROPITEM * 2);
      
      public var nMana:Number;
      
      public var nFood:Number;
      
      public var SURVIVALDATA:Array = new Array(110,7,27);
      
      public var nSurvivalMobMaxNum:int;
      
      public var nSurvivalDieMob:int;
      
      public var nSurvivalWave:int;
      
      public var nSurvivalRotation:int;
      
      public var UNITOPEN:Array = new Array();
      
      public var UNITEQUIP:Array = new Array();
      
      public var UNITCHARGED:Array = new Array();
      
      public var UNITCOOLING:Array = new Array();
      
      public var UNITCOOLINGFRAME:Array = new Array(0,0,0,0,0,0,0,0,0);
      
      public var UNITCOOLINGTIME:Array = new Array(0,0,0,0,0,0,0,0,0);
      
      public var UNITCHARGEFOOD:Array = new Array(10,20,30,40,50,70,100,150,200);
      
      public var UNITUPGRADE:Array = new Array(1,0,0,0,0,0,0,0,0);
      
      public var ARMSCHARGED:Array = new Array();
      
      public var SKILLINDEX:Array = new Array(3);
      
      public var MAXUNITDATA:Array = new Array(14000,400,30,6000);
      
      public var nWarRoadAppearPosY:Array = new Array(BG_BASEPOSY + WARROAD_UNITBASEY,BG_BASEPOSY + (WARROAD_UNITBASEY + WARROAD_UNITBASEYGAGAP),BG_BASEPOSY + (WARROAD_UNITBASEY + WARROAD_UNITBASEYGAGAP * 2),BG_BASEPOSY + (WARROAD_UNITBASEY + WARROAD_UNITBASEYGAGAP * 3),BG_BASEPOSY + (WARROAD_UNITBASEY + WARROAD_UNITBASEYGAGAP * 4));
      
      public var nWarRoadPosX:Array = new Array(0,0,0,0,0,0,0,0,0,0);
      
      public var nWarRoadUnitPos:int;
      
      public var UNITUPGRADEMONEY:Array = new Array(0,250,500,750,1000,1250,1500,1750,2000,2500,3000,3500,4000,4500,5000,5500,6000,6500,7000,7500,2000,500,1000,1500,2000,2500,3000,3500,4000,5000,6000,7000,8000,9000,10000,11000,12000,13000,14000,15000,10000,1000,2000,3000,4000,5000,6000,7000,8000,10000,12000,14000,16000,18000,20000,22000,24000,26000,28000,30000,20000,1500,3000,4500,6000,7500,9000,10500,12000,15000,18000,21000,24000,27000,30000,33000,36000,39000,42000,45000,40000,2500,5000,7500,10000,12500,15000,17500,20000,25000,30000,35000,40000,45000,50000,55000,60000,65000,70000,75000,70000,5000,10000,15000,20000,25000,30000,35000,40000,50000,60000,70000,80000,90000,100000,110000,120000,130000,140000,150000,130000,10000,20000,30000,40000,50000,60000,70000,80000,100000,120000,140000,160000,180000,200000,220000,240000,260000,280000,300000,210000,20000,40000,60000,80000,100000,120000,140000,160000,200000,240000,280000,320000,360000,400000,440000,480000,520000,560000,600000,300000,40000,80000,120000
      ,160000,200000,240000,280000,320000,400000,480000,560000,640000,720000,800000,880000,960000,1040000,1120000,1200000);
      
      public var UNITUPGRADEHP:Array = new Array(300,315,330,345,360,375,390,405,420,435,450,465,480,495,510,525,540,555,570,600,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,200,1200,1260,1320,1380,1440,1500,1560,1620,1680,1740,1800,1860,1920,1980,2040,2100,2160,2220,2280,2400,1600,1680,1760,1840,1920,2000,2080,2160,2240,2320,2400,2480,2560,2640,2720,2800,2880,2960,3040,3200,4000,4200,4400,4600,4800,5000,5200,5400,5600,5800,6000,6200,6400,6600,6800,7000,7200,7400,7600,8000,320,336,352,368,384,400,416,432,448,464,480,496,512,528,544,560,576,592,608,640,7000,7350,7700,8050,8400,8750,9100,9450,9800,10150,10500,10850,11200,11550,11900,12250,12600,12950,13300,14000,1000,1050,1100,1150,1200,1250,1300,1350,1400,1450,1500,1550,1600,1650,1700,1750,1800,1850,1900,2000,5700,5985,6270,6555,6840,7125,7410,7695,7980,8265,8550,8835,9120,9405,9690,9975,10260,10545,10830,11400);
      
      public var UNITUPGRADEATTACK:Array = new Array(20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,40,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,80,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,80,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,63,66,69,72,75,78,81,84,87,90,93,96,99,102,105,108,111,114,120,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,216,222,228,240,150,158,165,173,180,188,195,203,210,218,225,233,240,248,255,263,270,278,285,300,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360,370,380,400);
      
      public var HEROMAXSKILL:Array = new Array(9,9,5,20,20,5,5,10,20,5,20,10,3,5,20,5,3,5,3,5,2,5,5);
      
      public var HEROSURVIVALMAXSKILL:Array = new Array(99,99,5,99,99,5,5,99,99,5,99,99,3,5,99,5,3,5,3,5,2,5,5);
      
      public var GAME_SLOT:Array = new Array(Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA);
      
      public var HEROSKILL:Array = new Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
      
      public var HEROAURAWIDTH:Array = new Array(75 * WEB_SCALE,100 * WEB_SCALE,125 * WEB_SCALE,150 * WEB_SCALE);
      
      public var HEROSTATUS:Array = new Array(2000,100,40,60);
      
      public var UNITATTACKNUM:Array = new Array(1,1,1,1,0,1000,1,1,1000);
      
      public var UNITSKILLATTACKNUM:Array = new Array(1,5,1000,1,0,1000,1,1,1000);
      
      public var UNITATTACKFRAME:Array = new Array(6,36,16,12,Drawing.INITDATA,10,14,26,12,12,36,24,8,Drawing.INITDATA,10,20,26,12);
      
      public var KANGAROOATTACKFRAME:Array = new Array(8,12,16,20,24);
      
      public var UNITATKTOTALFRAME:Array = new Array(20,40,20,20,40,40,20,40,20,32,40,32,32,40,40,32,40,20);
      
      public var UNITSHADOWWIDTH:Array = new Array(12,14,16,18,16,12,18,12,24,100);
      
      public var UNITHPGAGEPOS:Array = new Array(50 * WEB_SCALE,67 * WEB_SCALE,72 * WEB_SCALE,72 * WEB_SCALE,75 * WEB_SCALE,55 * WEB_SCALE,95 * WEB_SCALE,60 * WEB_SCALE,110 * WEB_SCALE,110 * WEB_SCALE);
      
      public var UNITKNOCKDOWNTOTALFRAME:Array = new Array(32,32,32,32,32,32,32,32,32,40);
      
      public var UNITGHOSTUPTOTALFRAME:Array = new Array(100,100,100,100,100,100,100,100,100,70);
      
      public var UNITDIETOTALFRAME:Array = new Array(150,150,150,150,150,150,150,150,150,120);
      
      public var ENEMYATTACKNUM:Array = new Array(1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1000,1,1,0,0,1,1,0,1,1,3,3,1,1000);
      
      public var ENEMYDIESOUND:Array = new Array(104,105,105,58,105,58,104,104,58,104,58,104,104,105,104,58,58,105,58,104,28,40,28,28,27,0,27,29,40,28);
      
      public var ENEMYATTACKFRAME:Array = new Array(15,25,15,15,21,35,21,17,19,15,15,Drawing.INITDATA,15,13,7,9,149,25,21,Drawing.INITDATA,51,21,43,51,19,23,1,17,29,39);
      
      public var ENEMYATKTOTALFRAME:Array = new Array(20,32,20,20,30,40,30,30,30,30,20,2,30,40,20,20,150,40,30,2,60,30,60,60,30,180,20,32,60,60);
      
      public var ENEMYSHADOWWIDTH:Array = new Array(12,12,14,10,16,14,12,18,12,12,14,40,12,12,12,12,12,12,12,12,28,28,28,28,28,28,28,28,28,28);
      
      public var ENEMYHPGAGEPOS:Array = new Array(68 * WEB_SCALE,70 * WEB_SCALE,70 * WEB_SCALE,57 * WEB_SCALE,75 * WEB_SCALE,75 * WEB_SCALE,70 * WEB_SCALE,101 * WEB_SCALE,88 * WEB_SCALE,68 * WEB_SCALE,80 * WEB_SCALE,111 * WEB_SCALE,57 * WEB_SCALE,85 * WEB_SCALE,106 * WEB_SCALE,80 * WEB_SCALE,70 * WEB_SCALE,101 * WEB_SCALE,80 * WEB_SCALE,82 * WEB_SCALE,129 * WEB_SCALE,105 * WEB_SCALE,158 * WEB_SCALE,122 * WEB_SCALE,114 * WEB_SCALE,54 * WEB_SCALE,95 * WEB_SCALE,113 * WEB_SCALE,104 * WEB_SCALE,133 * WEB_SCALE);
      
      public var ENEMYKNOCKDOWNTOTALFRAME:Array = new Array(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,40,32,32,32);
      
      public var ENEMYGHOSTUPTOTALFRAME:Array = new Array(100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100);
      
      public var ENEMYDAMAGETOTALFRAME:Array = new Array(30,Drawing.INITDATA,38,20,40,20,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA,56);
      
      public var nClearTime:int;
      
      public var nClearH:int;
      
      public var nClearM:int;
      
      public var nClearS:int;
      
      public var nEnemyTurningPoint:int;
      
      public var nCreateTime:Array = new Array(4);
      
      public var nClearMoney:int;
      
      public var STOREDATA:Array = new Array(0,1,2,3,5,14,15,16,17,20,0,0,0,0,0,0,0,0,0,0);
      
      public var ARMSANIIMG:Array = new Array(Drawing.imgMace01_Effa,Drawing.imgMace01_Effb,Drawing.imgMace01_Effb,Drawing.imgMace02_Effa,Drawing.imgMace02_Effb,Drawing.imgMace02_Effc,Drawing.imgMace03_Effa,Drawing.imgMace03_Effb,Drawing.imgMace03_Effc,Drawing.imgMace04_Effa,Drawing.imgMace04_Effb,Drawing.imgMace04_Effb,Drawing.imgMace05_Effa,Drawing.imgMace05_Effb,Drawing.imgMace05_Effb,Drawing.imgMace06_Effa,Drawing.imgMace06_Effa,Drawing.imgMace06_Effa,Drawing.imgMace07_Effa,Drawing.imgMace07_Effa,Drawing.imgMace07_Effa,Drawing.imgMace08_Effa,Drawing.imgMace08_Effa,Drawing.imgMace08_Effa,Drawing.imgMace09_Effa,Drawing.imgMace09_Effa,Drawing.imgMace09_Effa,Drawing.imgMace10_Effa,Drawing.imgMace10_Effb,Drawing.imgMace10_Effc,Drawing.imgMace11_Effa,Drawing.imgMace11_Effa,Drawing.imgMace11_Effa);
      
      public var ATTACKANI:Array = new Array(MAX_ATTACK << 1);
      
      public var ATTACKPOSX:Array = new Array(MAX_ATTACK);
      
      public var ATTACKPOSY:Array = new Array(MAX_ATTACK);
      
      public var ATTACKARMSEQUIPPOS:Array = new Array(MAX_ATTACK);
      
      public var ATTACKARMSPOSX:Array = new Array(MAX_ATTACK);
      
      public var SUBATTACKARMSPOSX:Array = new Array(MAX_ATTACK);
      
      public var ATTACKARMSPOSY:Array = new Array(MAX_ATTACK);
      
      public var ATTACKARMSNUM:Array = new Array(MAX_ATTACK);
      
      public var ATTACKENEMY:Array = new Array(MAX_ATTACK * MAX_ATTACKENEMY);
      
      public var nAttackEnemyPos:Array = new Array(MAX_ATTACK);
      
      public var MACEATTACKTOTALFRAME:Array = new Array(Drawing.INITDATA,40,80,Drawing.INITDATA,40,28,48,60,80,Drawing.INITDATA);
      
      public var EQUIPINVEN:Array = new Array(EQUIPINVEN_LEVELPOS << 1);
      
      public var INVENDATA:Array = new Array(INVENDATA_LEVELPOS << 1);
      
      public var SAVEEQUIPINVEN:Array = new Array(EQUIPINVEN_LEVELPOS << 1);
      
      public var STAGECLEARRESULTSTAR:Array = new Array(MAX_STAGE * MAX_CHAPTER);
      
      public var STAGECLEARRESULTTIME:Array = new Array(MAX_STAGE * MAX_CHAPTER * 3);
      
      public var bNewRecord:Boolean;
      
      public var HERO:Animation;
      
      public var DESTINYENEMYAPPEARSTATE:Array = new Array(10,10,10,30);
      
      public var nDestinyIconSetTime:int;
      
      public var _nDestinyIconSetTime:int;
      
      public var nDestinyTotalDieEnemy:int;
      
      public var nDestinyIconAppear:int;
      
      public var nDestinyTotalMaceIconAppear:int;
      
      public var nDestinyTotalUnitIconAppear:int;
      
      public var STRQUEST:Array = new Array(MAX_QUEST * MAX_STRQUESTLINE);
      
      public var STRQUESTLINE:Array = new Array(MAX_QUEST);
      
      public var QUESTICON:Array = new Array(MAX_QUEST);
      
      public var QUESTTYPE:Array = new Array(MAX_QUEST);
      
      public var QUESTPROCESS:Array = new Array(MAX_QUEST * MAX_STRQUESTLINE);
      
      public var QUESTREWARD:Array = new Array(MAX_QUEST * MAX_QUESTREWARD);
      
      public var QUESTCOMPLETE:Array = new Array(MAX_QUEST);
      
      public var nStrValuePos:int;
      
      public var nWarRoadArriveEnemy:int;
      
      public var nStageEatMoney:int;
      
      public var nStageDieEnemy:int;
      
      public var nNotUseUnitIndex:int;
      
      public var nNotUseUnitNum:int;
      
      public var nUseUnitIndex:int;
      
      public var nUseUnitNum:int;
      
      public var nUnitDieNum:int;
      
      public var nNotUseMaceIndex:int;
      
      public var nNotUseMace:int;
      
      public var nUseMaceIndex:int;
      
      public var nUseMaceNum:int;
      
      public var bQuestSnd_paladogHp:Boolean;
      
      public var bQuestSnd_wagonHp:Boolean;
      
      public var bQuestSnd_arriveMob:Boolean;
      
      public var bQuestSnd_clearTime:Boolean;
      
      public var bQuestSnd_notUseUnit:Boolean;
      
      public var bQuestSnd_notUseMace:Boolean;
      
      public var bQuestSnd_destinyIcon:Boolean;
      
      public var bQuestSnd_unitDie:Boolean;
      
      public var CARDBAG:Array = new Array(MAX_CARDNUM);
      
      public var nCardBookPage:int;
      
      public var bDrawKeyBoardInfor:Boolean = true;
      
      public function Player(param1:Drawing)
      {
         var _loc2_:int = 0;
         super();
         this.draw = param1;
         this.nBgLeftX = 0;
         this.nBgRightX = BG_W - param1.nLcdW;
         this.nSubBgPosX = Drawing.BGINITX;
         this.nSubBg2PosX = Drawing.BGINITX;
         this.nSubPosX = Drawing.BGINITX;
         this.nMoveBgPosX = Drawing.INITDATA;
         this.nMoveBg = 120 * WEB_SCALE;
         this.nMoveWidth = 60 / Drawing.FPS * WEB_SCALE;
         this.nGem = 18790324;
         _loc2_ = 0;
         while(_loc2_ < MAX_CARDNUM)
         {
            if(Drawing.GAME_RELEASE)
            {
               this.CARDBAG[_loc2_] = 0;
            }
            else
            {
               this.CARDBAG[_loc2_] = 2;
            }
            _loc2_++;
         }
      }
   }
}

