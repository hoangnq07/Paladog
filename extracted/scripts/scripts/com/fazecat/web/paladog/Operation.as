package com.fazecat.web.paladog
{
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   
   public class Operation
   {
      
      private var draw:Drawing;
      
      public function Operation(param1:Drawing)
      {
         super();
         this.draw = param1;
      }
      
      public function initGame() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this.draw.player.nGamePlayTime = 0;
         this.draw.player.nGameMode = Drawing.MODE_NORMAL;
         this.draw.nRingEquipLock = Drawing.LOCK;
         _loc1_ = 0;
         while(_loc1_ < 7)
         {
            this.draw.nTutorial[_loc1_] = Drawing.INITDATA;
            _loc1_++;
         }
         this.draw.player.nChapter = 0;
         this.draw.player.nStage = 0;
         if(Drawing.GAME_RELEASE)
         {
            if(Drawing.STAGE_ALLOPEN)
            {
               this.draw.player.nClearChapter = Player.MAX_CHAPTER - 1;
               this.draw.player.nClearStage = this.draw.player.nClearChapter * Player.MAX_STAGE + (Player.MAX_STAGE - 1);
            }
            else
            {
               this.draw.player.nClearChapter = 0;
               this.draw.player.nClearStage = 0;
            }
            this.draw.player.nRealClearStage = 0;
         }
         else
         {
            if(Drawing.STAGE_ALLOPEN)
            {
               this.draw.player.nClearChapter = Player.MAX_CHAPTER - 1;
               this.draw.player.nClearStage = this.draw.player.nClearChapter * Player.MAX_STAGE + (Player.MAX_STAGE - 1);
            }
            else
            {
               this.draw.player.nClearChapter = 0;
               this.draw.player.nClearStage = 0;
            }
            this.draw.player.nRealClearStage = 0;
         }
         this.draw.bKeyPressed = false;
         this.draw.player.bNewRecord = false;
         this.draw.player.bLevelUp = false;
         this.draw.player.bDrawLevelUpTurn = false;
         this.draw.player.nLevelUpFrame = 0;
         this.draw.player.nLevel = 1;
         this.draw.player.nHp = this.playerHp();
         this.draw.player.nExp = 0;
         if(Drawing.GAME_RELEASE)
         {
            this.draw.player.nMoney = 0;
         }
         else
         {
            this.draw.player.nMoney = 9000000;
         }
         this.draw.player.nMana = 0;
         this.draw.player.nFood = 0;
         this.paladogSpeedUp();
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_STAGE * Player.MAX_CHAPTER)
         {
            this.draw.player.STAGECLEARRESULTSTAR[_loc1_] = 0;
            _loc1_++;
         }
         this.draw.nTotalStarNum = 0;
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_STAGE * Player.MAX_CHAPTER)
         {
            this.draw.nTotalStarNum += this.draw.player.STAGECLEARRESULTSTAR[_loc1_];
            _loc2_ = 0;
            while(_loc2_ < 3)
            {
               this.draw.player.STAGECLEARRESULTTIME[_loc1_ * 3 + _loc2_] = 0;
               _loc2_++;
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < Drawing.MAX_UNITKIND)
         {
            this.draw.player.UNITOPEN[_loc1_] = false;
            this.draw.player.UNITEQUIP[_loc1_] = false;
            this.draw.player.UNITUPGRADE[_loc1_] = 0;
            this.draw.player.UNITCHARGED[_loc1_] = false;
            this.draw.player.UNITCOOLING[_loc1_] = false;
            this.draw.player.UNITCOOLINGFRAME[_loc1_] = 0;
            _loc1_++;
         }
         this.draw.player.UNITOPEN[0] = true;
         this.draw.player.UNITOPEN[1] = true;
         this.draw.player.UNITEQUIP[0] = true;
         this.draw.player.UNITUPGRADE[0] = 1;
         _loc1_ = 0;
         while(_loc1_ < Player.EQUIPARMS_NUM)
         {
            this.draw.player.ARMSCHARGED[_loc1_] = false;
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 200)
         {
            this.draw.player.INVENDATA[_loc1_] = Drawing.INITDATA;
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 10)
         {
            this.draw.player.EQUIPINVEN[_loc1_] = Drawing.INITDATA;
            this.draw.player.SAVEEQUIPINVEN[_loc1_] = Drawing.INITDATA;
            _loc1_++;
         }
         this.draw.player.nNowArms = this.draw.player.EQUIPINVEN[0] = Drawing.MACE_GODPUNCH;
         this.draw.player.EQUIPINVEN[0 + Player.EQUIPINVEN_LEVELPOS] = 0;
         if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
         {
            this.draw.player.nNowArms = this.draw.player.EQUIPINVEN[0] = Drawing.MACE_METEO;
            this.draw.player.EQUIPINVEN[0 + Player.EQUIPINVEN_LEVELPOS] = 30;
         }
         this.draw.player.SAVEEQUIPINVEN[0] = this.draw.player.EQUIPINVEN[0];
         this.draw.player.SAVEEQUIPINVEN[0 + Player.EQUIPINVEN_LEVELPOS] = this.draw.player.EQUIPINVEN[0 + Player.EQUIPINVEN_LEVELPOS];
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_SKILL)
         {
            this.draw.player.HEROSKILL[_loc1_] = 0;
            _loc1_++;
         }
         this.draw.player.STOREDATA[0] = 0;
         this.draw.player.STOREDATA[1] = 1;
         this.draw.player.STOREDATA[2] = 2;
         this.draw.player.STOREDATA[3] = 3;
         this.draw.player.STOREDATA[4] = 5;
         this.draw.player.STOREDATA[5] = 14;
         this.draw.player.STOREDATA[6] = 15;
         this.draw.player.STOREDATA[7] = 16;
         this.draw.player.STOREDATA[8] = 17;
         this.draw.player.STOREDATA[9] = 20;
         this.draw.player.STOREDATA[10] = 0;
         this.draw.player.STOREDATA[11] = 0;
         this.draw.player.STOREDATA[12] = 0;
         this.draw.player.STOREDATA[13] = 0;
         this.draw.player.STOREDATA[14] = 0;
         this.draw.player.STOREDATA[15] = 0;
         this.draw.player.STOREDATA[16] = 0;
         this.draw.player.STOREDATA[17] = 0;
         this.draw.player.STOREDATA[18] = 0;
         this.draw.player.STOREDATA[19] = 0;
      }
      
      public function initStage(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.draw.player.nGameMode != Drawing.MODE_SURVIVAL)
         {
            this.draw.lib.saveFile(Drawing.DB_SLOT,"paladog_slot" + this.draw.nGameSlot);
            this.draw.lib.saveFile(Drawing.DB_GAME,"paladog_game" + this.draw.nGameSlot);
         }
         this.draw.player.nPlayTime = 0;
         this.draw.player.nStage = param1 - 1;
         this.draw.player.nNowPlayChapter = this.draw.player.nChapter;
         if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
         {
            this.draw.player.nChapter = 0;
            this.draw.player.nStage += Player.MAX_TOTALSTAGE;
            this.draw.player.nSurvivalDieMob = 0;
            this.draw.player.nSurvivalMobMaxNum = this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].nTurningPoint * Player.SURVIVAL_MOBROTATION;
         }
         this.draw.nAniBossDieFrame = 0;
         this.draw.bStageClearSnd = false;
         this.draw.player.nStageEatMoney = 0;
         this.draw.player.nStageDieEnemy = 0;
         this.draw.player.nNotUseUnitNum = 0;
         this.draw.player.nUseUnitNum = 0;
         this.draw.player.nUnitDieNum = 0;
         this.draw.player.nNotUseMace = 0;
         this.draw.player.bQuestSnd_paladogHp = false;
         this.draw.player.bQuestSnd_wagonHp = false;
         this.draw.player.bQuestSnd_arriveMob = false;
         this.draw.player.bQuestSnd_clearTime = false;
         this.draw.player.bQuestSnd_notUseUnit = false;
         this.draw.player.bQuestSnd_notUseMace = false;
         this.draw.player.bQuestSnd_destinyIcon = false;
         this.draw.player.bQuestSnd_unitDie = false;
         this.draw.bBossDiaEvent = false;
         this.draw.bBossDialog = false;
         this.draw.player.bEnemyStationDisAppear = false;
         this.draw.player.nEnemyStationDisAppearTime = 0;
         this.draw.player.nSetSndStartTime = Drawing.INITDATA;
         this.draw.player.bSetSndStartTime = false;
         this.draw.player.bDestinyCrash = false;
         if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
         {
            this.draw.player.nPosX = Player.PLAYER_BASEPOSX;
            this.draw.player.nPosY = Player.BG_BASEPOSY + Player.PLAYER_BASEPOSY;
            _loc2_ = 0;
            while(_loc2_ < 10)
            {
               this.draw.player.EQUIPINVEN[_loc2_] = this.draw.player.SAVEEQUIPINVEN[_loc2_];
               _loc2_++;
            }
         }
         else
         {
            switch(this.draw.player.nStage)
            {
               case 2:
               case 14:
                  this.draw.player.nGameMode = Drawing.MODE_DESTINY;
                  this.draw.player.nPosX = Player.PLAYER_BASEPOSX >> 1;
                  this.draw.player.nPosY = Player.BG_BASEPOSY + Player.PLAYER_BASEPOSY;
                  _loc2_ = 0;
                  while(_loc2_ < 10)
                  {
                     this.draw.player.EQUIPINVEN[_loc2_] = Drawing.INITDATA;
                     _loc2_++;
                  }
                  _loc2_ = 0;
                  while(_loc2_ < Drawing.MAX_DESTINYICONNUM)
                  {
                     this.initDestinyIcon(_loc2_);
                     _loc2_++;
                  }
                  break;
               case 5:
               case 17:
                  this.draw.player.nGameMode = Drawing.MODE_WAGON;
                  this.draw.player.nPosX = Player.PLAYER_BASEPOSX;
                  this.draw.player.nPosY = Player.BG_BASEPOSY + Player.PLAYER_BASEPOSY;
                  _loc2_ = 0;
                  while(_loc2_ < 10)
                  {
                     this.draw.player.EQUIPINVEN[_loc2_] = this.draw.player.SAVEEQUIPINVEN[_loc2_];
                     _loc2_++;
                  }
                  break;
               case 8:
               case 20:
                  this.draw.player.nGameMode = Drawing.MODE_WARROAD;
                  this.draw.player.nWarRoadArriveEnemy = 0;
                  this.draw.player.bVerticalAppear = false;
                  this.draw.player.bHorizonAppear = false;
                  this.draw.player.nAttackHorizonPosX = Drawing.INITDATA;
                  this.resetWarRoadUnitIcon();
                  this.draw.player.nPosX = Player.WARROAD_PALADOGPOSX;
                  this.draw.player.nPosY = Player.BG_BASEPOSY + Player.WARROAD_PALADOGPOSY;
                  this.draw.player.nBossPosX = Player.WARROAD_BOSSPOSX;
                  this.draw.player.nBossPosY = Player.BG_BASEPOSY + Player.WARROAD_BOSSPOSY;
                  this.draw.player.nWarRoadEnemyHp = Player.nWarRoadEnemyMaxHp >> 1;
                  _loc2_ = 0;
                  while(_loc2_ < Player.EQUIPARMS_NUM)
                  {
                     this.draw.player.EQUIPINVEN[_loc2_] = Drawing.ATTACK_VERTICAL + _loc2_;
                     this.draw.player.EQUIPINVEN[_loc2_ + Player.EQUIPINVEN_LEVELPOS] = 0;
                     _loc2_++;
                  }
                  break;
               case 11:
               case 23:
                  this.draw.player.nGameMode = Drawing.MODE_BOSS;
                  this.draw.player.nPosX = Player.PLAYER_BASEPOSX;
                  this.draw.player.nPosY = Player.BG_BASEPOSY + Player.PLAYER_BASEPOSY;
                  _loc2_ = 0;
                  while(_loc2_ < 10)
                  {
                     this.draw.player.EQUIPINVEN[_loc2_] = this.draw.player.SAVEEQUIPINVEN[_loc2_];
                     _loc2_++;
                  }
                  break;
               default:
                  this.draw.player.nGameMode = Drawing.MODE_NORMAL;
                  this.draw.player.nPosX = Player.PLAYER_BASEPOSX;
                  this.draw.player.nPosY = Player.BG_BASEPOSY + Player.PLAYER_BASEPOSY;
                  _loc2_ = 0;
                  while(_loc2_ < 10)
                  {
                     this.draw.player.EQUIPINVEN[_loc2_] = this.draw.player.SAVEEQUIPINVEN[_loc2_];
                     _loc2_++;
                  }
            }
         }
         this.draw.bGameMenu = false;
         this.draw.bPauseBtn = false;
         this.draw.player.bNewRecord = false;
         this.draw.player.bStageClear = false;
         this.draw.player.bDrawLevelUp = false;
         this.draw.player.bDarkBg = false;
         this.draw.player.nDarkBgFrame = 0;
         this.draw.player.bAttack = false;
         this.draw.player.bAttacked = false;
         this.draw.player.nAttackedFrame = 0;
         this.draw.player.bDrawAttackedEff = false;
         this.draw.player.nDrawAttackedEffFrame = 0;
         this.draw.player.nHp = this.playerHp();
         this.draw.player.nMana = 0;
         this.draw.player.nFood = 0;
         _loc2_ = 0;
         while(_loc2_ < Player.MAX_DMG)
         {
            this.draw.player.DMGKIND[_loc2_] = Drawing.INITDATA;
            this.draw.player.DMGPOSX[_loc2_] = Drawing.INITDATA;
            this.draw.player.DMGPOSY[_loc2_] = Drawing.INITDATA;
            this.draw.player.DMGANIFRAME[_loc2_] = 0;
            this.draw.player.DMGFROMENEMY[_loc2_] = Drawing.INITDATA;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < Player.BOSSPALADOGNUM)
         {
            this.draw.player.BOSSPALADOGPOS[_loc2_] = Drawing.INITDATA;
            _loc2_++;
         }
         this.draw.player.bPoison = false;
         this.draw.player.nPoisonStartTime = Drawing.INITDATA;
         this.draw.player.nPoisonTime = Drawing.INITDATA;
         this.draw.player.nPoisonDpsTime = Drawing.INITDATA;
         this.draw.player.nPoisonDps = Drawing.INITDATA;
         this.paladogSpeedUp();
         _loc2_ = 0;
         while(_loc2_ < Player.EQUIPARMS_NUM)
         {
            this.draw.player.FIREBTN[_loc2_] = false;
            this.draw.player.FIREBTNFRAME[_loc2_] = 0;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < Drawing.MAX_UNITKIND)
         {
            this.draw.player.UNITBTN[_loc2_] = false;
            this.draw.player.UNITBTNFRAME[_loc2_] = 0;
            _loc2_++;
         }
         this.setArms(true,Drawing.INITDATA);
         _loc2_ = 0;
         while(_loc2_ < Player.MAX_ATTACK)
         {
            this.initPlayerAttackObj(_loc2_);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < Player.EQUIPARMS_NUM)
         {
            this.draw.player.ARMSCHARGED[_loc2_] = false;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < Drawing.MAX_UNITKIND)
         {
            this.draw.player.UNITCHARGED[_loc2_] = false;
            this.draw.player.UNITCOOLING[_loc2_] = false;
            this.draw.player.UNITCOOLINGFRAME[_loc2_] = 0;
            _loc2_++;
         }
         this.draw.player.bDrawEatItem = false;
         this.draw.player.nDrawEatItemTime = Drawing.INITDATA;
         this.draw.player.nEatItem = Drawing.INITDATA;
         this.draw.player.nEatItemLevel = Drawing.INITDATA;
         this.draw.player.nEatCard = Drawing.INITDATA;
         _loc2_ = 0;
         while(_loc2_ < Player.MAX_DRAWDROPITEM)
         {
            this.draw.player.DRAWDROPITEMBAG[_loc2_] = Drawing.INITDATA;
            this.draw.player.DRAWDROPITEMBAG[_loc2_ + Player.MAX_DRAWDROPITEM] = Drawing.INITDATA;
            this.draw.player.DRAWDROPITEM[_loc2_] = false;
            this.draw.player.DRAWDROPITEMTIME[_loc2_] = Drawing.INITDATA;
            _loc2_++;
         }
         this.draw.player.nEnemyStationMaxHp = this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].nEnemyStationHp;
         if(this.draw.nGameLevel == Drawing.LEVEL_EASY)
         {
            this.draw.player.nEnemyStationMaxHp = this.draw.player.nEnemyStationMaxHp * 75 / 100;
         }
         else if(this.draw.nGameLevel == Drawing.LEVEL_HARD)
         {
            this.draw.player.nEnemyStationMaxHp = this.draw.player.nEnemyStationMaxHp * 150 / 100;
         }
         else if(this.draw.nGameLevel == Drawing.LEVEL_HELL)
         {
            this.draw.player.nEnemyStationMaxHp = this.draw.player.nEnemyStationMaxHp * 200 / 100;
         }
         this.draw.player.nEnemyStationHp = this.draw.player.nEnemyStationMaxHp;
         if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
         {
            this.draw.player.nEnemyStationHp = 0;
         }
         this.draw.player.bEnemyStationAttacked = false;
         this.draw.player.nEnemyStationAttackedFrame = 0;
         this.draw.player.bEnemyStationCrashed = false;
         this.draw.player.nEnemyStationBadEnergyFrame = 0;
         this.draw.player.bEnemyStationBadEnergy = false;
         this.draw.player.nEnemyStationPosX = Player.BG_W;
         this.draw.player.nEnemyStationPosY = Player.BG_BASEPOSY;
         this.draw.player.bBossEnemyAppear = false;
         this.draw.player.nBossEnemyIndex = Drawing.INITDATA;
         this.draw.player.nBgPosX = 0;
         this.draw.player.nBg2PosX = 0;
         this.draw.player.nBgPosY = Player.BG_BASEPOSY;
         this.draw.player.bBgEff = false;
         this.draw.player.nBgEffFrame = 0;
         this.draw.player.nBgEffPosY = 0;
         this.draw.player.bMoveLeft = false;
         this.draw.player.bMoveRight = false;
         this.draw.player.nMoveDirection = Drawing.INITDATA;
         this.draw.player.bBgLeft = false;
         this.draw.player.bBgRight = false;
         this.draw.player.nMoveBgPosX = Drawing.INITDATA;
         this.draw.player.nSubBgPosX = Drawing.BGINITX;
         this.draw.player.nSubBg2PosX = Drawing.BGINITX;
         this.draw.player.nSubPosX = Drawing.BGINITX;
         this.draw.nAniX = 0;
         this.draw.nSubAniX = -230;
         this.draw.nSubAniX2 = -460;
         this.draw.player.nEnemyTurningPoint = this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].nTurningPoint;
         this.draw.player.nCreateTime[0] = this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].nMobCreateMinTime_First;
         this.draw.player.nCreateTime[1] = this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].nMobCreateMaxTime_First;
         this.draw.player.nCreateTime[2] = this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].nMobCreateMinTime_Last;
         this.draw.player.nCreateTime[3] = this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].nMobCreateMaxTime_Last;
         this.draw.player.nClearMoney = this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].nStageClearMoney;
         if(this.draw.nGameLevel == Drawing.LEVEL_EASY)
         {
            this.draw.player.nClearMoney *= 2;
         }
         else if(this.draw.nGameLevel == Drawing.LEVEL_HARD)
         {
            this.draw.player.nClearMoney = this.draw.player.nClearMoney * 75 / 100;
         }
         else if(this.draw.nGameLevel == Drawing.LEVEL_HELL)
         {
            this.draw.player.nClearMoney /= 2;
         }
         this.draw.player.nClearTime = this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].nStageClearLimitTime;
         if(this.draw.nGameLevel == Drawing.LEVEL_HARD)
         {
            this.draw.player.nClearTime += 60;
         }
         else if(this.draw.nGameLevel == Drawing.LEVEL_HELL)
         {
            this.draw.player.nClearTime += 60;
         }
         this.draw.player.nAppearEnemy = 0;
         this.draw.player.nDestinyIconAppear = 0;
         this.draw.player.nDestinyTotalMaceIconAppear = 0;
         this.draw.player.nDestinyTotalUnitIconAppear = 0;
         this.draw.player.nAppearTotalEnemy = 0;
         this.draw.player.nDestinyTotalDieEnemy = 0;
         this.draw.player.bScaleMob = false;
         _loc2_ = 0;
         while(_loc2_ < 2)
         {
            this.draw.player.nScaleMobNum[_loc2_] = 0;
            _loc2_++;
         }
         if(this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].APPEARMOBKIND[1] > 0)
         {
            this.draw.player.nScaleMobNum[0] = Player.SCALEMOBNUM;
         }
         if(this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].APPEARMOBKIND[2] > 0)
         {
            this.draw.player.nScaleMobNum[1] = Player.SCALEMOBNUM;
         }
         this.draw.player.nAppearUnit = 0;
         _loc2_ = 0;
         while(_loc2_ < Drawing.MAX_ENEMYNUM)
         {
            this.initEnemy(_loc2_);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < Drawing.MAX_UNITNUM)
         {
            this.initUnit(_loc2_);
            _loc2_++;
         }
      }
      
      public function startStage() : void
      {
         this.sortObjPos();
         this.draw.nGameState = Drawing.GAME_START;
         this.draw.nMainState = Drawing.MAIN_GAME;
         this.draw.bKeyPressed = false;
         this.draw.bKeyAni = false;
         this.setGamePlayTime(true);
         this.draw.lib.playMusic(Library.MUSIC_BATTLE,false);
      }
      
      public function setArms(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1)
         {
            this.draw.player.nNowArms = Drawing.INITDATA;
            _loc3_ = 0;
            while(_loc3_ < Player.EQUIPARMS_NUM)
            {
               if(this.draw.player.EQUIPINVEN[_loc3_] > Drawing.INITDATA)
               {
                  this.draw.player.nNowArms = this.draw.player.EQUIPINVEN[_loc3_];
                  break;
               }
               _loc3_++;
            }
         }
         else
         {
            this.draw.player.nNowArms = this.draw.player.EQUIPINVEN[param2];
         }
         this.draw.player.nArmsAniFrame = 0;
      }
      
      public function initPlayerAttackObj(param1:int) : void
      {
         var _loc2_:int = 0;
         this.draw.player.ATTACKANI[param1 + Player.MAX_ATTACK] = 0;
         this.draw.player.ATTACKANI[param1] = Drawing.INITDATA;
         this.draw.player.ATTACKPOSX[param1] = Drawing.INITDATA;
         this.draw.player.ATTACKPOSY[param1] = Drawing.INITDATA;
         this.draw.player.ATTACKARMSPOSX[param1] = Drawing.INITDATA;
         this.draw.player.ATTACKARMSPOSY[param1] = Drawing.INITDATA;
         this.draw.player.SUBATTACKARMSPOSX[param1] = Drawing.INITDATA;
         this.draw.player.ATTACKARMSNUM[param1] = Drawing.INITDATA;
         _loc2_ = 0;
         while(_loc2_ < Player.MAX_ATTACKENEMY)
         {
            this.draw.player.ATTACKENEMY[param1 * Player.MAX_ATTACKENEMY + _loc2_] = Drawing.INITDATA;
            _loc2_++;
         }
         this.draw.player.nAttackEnemyPos[param1] = 0;
      }
      
      public function initDestinyIcon(param1:int) : void
      {
         this.draw.DESTINYICON[param1].nType = Drawing.INITDATA;
         this.draw.DESTINYICON[param1].nKind = Drawing.INITDATA;
         this.draw.DESTINYICON[param1].nPosX = this.draw.nLcdW;
         this.draw.DESTINYICON[param1].nPosY = 431;
         this.draw.DESTINYICON[param1].bAppear = false;
         this.draw.DESTINYICON[param1].bMove = false;
      }
      
      public function initEnemy(param1:int) : void
      {
         this.draw.ENEMY[param1].nLoopEffSnd = Drawing.INITDATA;
         this.draw.ENEMY[param1].n3DMaxAniFrame = 0;
         this.draw.ENEMY[param1].bFence = false;
         this.draw.ENEMY[param1].bAppear = false;
         this.draw.ENEMY[param1].bAlive = false;
         this.draw.ENEMY[param1].bMove = false;
         this.draw.ENEMY[param1].bArrive = false;
         this.draw.ENEMY[param1].bBomb = false;
         this.draw.ENEMY[param1].nBossPaladogEffectPos = Drawing.INITDATA;
         this.draw.ENEMY[param1].bBaby = false;
         this.draw.ENEMY[param1].bGhostMove = false;
         this.draw.ENEMY[param1].bInvisible = false;
         this.draw.ENEMY[param1].bVisible = false;
         this.draw.ENEMY[param1].nGhostStartTime = Drawing.INITDATA;
         this.draw.ENEMY[param1].nGhostTime = Drawing.INITDATA;
         this.draw.ENEMY[param1].bBabyGhostMove = false;
         this.draw.ENEMY[param1].bBabyGhostMoving = false;
         this.draw.ENEMY[param1].bBabyInvisible = false;
         this.draw.ENEMY[param1].bBabyVisible = false;
         this.draw.ENEMY[param1].bBabyGhostMoveOk = false;
         this.draw.ENEMY[param1].nBabyGhostStartTime = Drawing.INITDATA;
         this.draw.ENEMY[param1].nBabyGhostTime = Drawing.INITDATA;
         this.draw.ENEMY[param1].nBabyGhostMoveDistance = Drawing.INITDATA;
         this.draw.ENEMY[param1].bBoss = false;
         this.draw.ENEMY[param1].bStageBoss = false;
         this.draw.ENEMY[param1].bDefense = false;
         this.draw.ENEMY[param1].bPoison = false;
         this.draw.ENEMY[param1].bIce = false;
         this.draw.ENEMY[param1].bAttack = false;
         this.draw.ENEMY[param1].bAttacked = false;
         this.draw.ENEMY[param1].bLastAttackFrame = false;
         this.draw.ENEMY[param1].bAttackReady = false;
         this.draw.ENEMY[param1].bDieAni = false;
         this.draw.ENEMY[param1].bBombDie = false;
         this.draw.ENEMY[param1].bKnockDown = false;
         this.draw.ENEMY[param1].nPosY = Player.ENEMYDIEPOSY;
         if(this.draw.player.nGameMode == Drawing.MODE_DESTINY)
         {
            if(param1 >= Player.DESTINYTOTALENEMYNUM && param1 < Player.DESTINYTOTALENEMYNUM + 3)
            {
               this.draw.ENEMY[param1].bFence = true;
               this.draw.ENEMY[param1].nPosX = this.draw.nLcdW - 32;
               this.draw.ENEMY[param1].nPosY = Player.BG_BASEPOSY + Player.DESTINYFENCE_BASEPOSY + (param1 - Player.DESTINYTOTALENEMYNUM) * 34;
            }
         }
      }
      
      public function initUnit(param1:int) : void
      {
         var _loc2_:int = 0;
         this.draw.UNIT[param1].n3DMaxAniFrame = 0;
         this.draw.UNIT[param1].bWagon = false;
         this.draw.UNIT[param1].bAppear = false;
         this.draw.UNIT[param1].bAlive = false;
         this.draw.UNIT[param1].bMove = false;
         this.draw.UNIT[param1].bArrive = false;
         this.draw.UNIT[param1].nSetSndStartTime = Drawing.INITDATA;
         this.draw.UNIT[param1].bFrog = false;
         this.draw.UNIT[param1].bReturnFromFrog = false;
         this.draw.UNIT[param1].nFrogStartTime = Drawing.INITDATA;
         this.draw.UNIT[param1].nFrogTime = Drawing.INITDATA;
         this.draw.UNIT[param1].nFrogAniFrame = 0;
         this.draw.UNIT[param1].bWarningHp = false;
         this.draw.UNIT[param1].bHealing = false;
         this.draw.UNIT[param1].nHealingFrame = 0;
         this.draw.UNIT[param1].bSkillAtk = false;
         this.draw.UNIT[param1].bInAura = false;
         this.draw.UNIT[param1].bDefense = false;
         this.draw.UNIT[param1].bIce = false;
         this.draw.UNIT[param1].nIceStartTime = Drawing.INITDATA;
         this.draw.UNIT[param1].nIceTime = Drawing.INITDATA;
         this.draw.UNIT[param1].nIceAniFrame = 0;
         this.draw.UNIT[param1].bPoison = false;
         this.draw.UNIT[param1].bPoison = false;
         this.draw.UNIT[param1].nPoisonStartTime = Drawing.INITDATA;
         this.draw.UNIT[param1].nPoisonTime = Drawing.INITDATA;
         this.draw.UNIT[param1].nPoisonDps = Drawing.INITDATA;
         this.draw.UNIT[param1].nPoisonDpsTime = Drawing.INITDATA;
         this.draw.UNIT[param1].bAttack = false;
         this.draw.UNIT[param1].bAttacked = false;
         this.draw.UNIT[param1].bLastAttackFrame = false;
         this.draw.UNIT[param1].bAttackReady = false;
         this.draw.UNIT[param1].bAttackedStop = false;
         this.draw.UNIT[param1].nAttackedTime = Drawing.INITDATA;
         this.draw.UNIT[param1].nDiePos = Drawing.INITDATA;
         this.draw.UNIT[param1].bDieAni = false;
         this.draw.UNIT[param1].bBombDie = false;
         this.draw.UNIT[param1].bKnockDown = false;
         this.draw.UNIT[param1].nPosY = Player.UNITDIEPOSY;
         if(this.draw.player.nGameMode == Drawing.MODE_WAGON)
         {
            if(param1 == Player.WAGONPOS)
            {
               this.draw.UNIT[param1].nType = Drawing.UNIT_WAGON;
               this.draw.UNIT[param1].bWagon = true;
               this.draw.UNIT[param1].bAppear = true;
               this.draw.UNIT[param1].bAlive = true;
               this.draw.UNIT[param1].bMove = true;
               this.draw.UNIT[param1].nSetSndStartTime = getTimer();
               _loc2_ = 0;
               while(_loc2_ < Unit.MAX_DMG)
               {
                  this.draw.UNIT[param1].DMGKIND[_loc2_] = Drawing.INITDATA;
                  this.draw.UNIT[param1].DMGPOSX[_loc2_] = Drawing.INITDATA;
                  this.draw.UNIT[param1].DMGPOSY[_loc2_] = Drawing.INITDATA;
                  this.draw.UNIT[param1].DMGANIFRAME[_loc2_] = 0;
                  this.draw.UNIT[param1].DMGFROMENEMY[_loc2_] = Drawing.INITDATA;
                  _loc2_++;
               }
               this.draw.UNIT[param1].nPosX = this.draw.player.nBgPosX - Player.WAGON_STARTPOS;
               this.draw.UNIT[param1].nPosY = Player.BG_BASEPOSY + Player.WAGON_BASEPOSY;
               this.draw.UNIT[param1].nMaxHp = this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].nEnemyStationHp;
               this.draw.UNIT[param1].nHp = this.draw.UNIT[param1].nMaxHp;
               this.draw.UNIT[param1].nHpRegenTime = getTimer();
               this.draw.UNIT[param1].nAttackedFrame = 0;
               this.draw.UNIT[param1].nPps = Player.WAGON_MOVEPPS;
               this.draw.UNIT[param1].nStep = 0;
               this.draw.UNIT[param1].nDieFrame = 0;
               this.draw.UNIT[param1].nAttackedEnemy = Drawing.INITDATA;
               this.draw.UNIT[param1].nAttackDelayStartTime = Drawing.INITDATA;
            }
         }
      }
      
      public function sortDrawDropItem(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.draw.player.DRAWDROPITEM[param1] = false;
         this.draw.player.DRAWDROPITEMTIME[param1] = Drawing.INITDATA;
         this.draw.player.DRAWDROPITEMBAG[param1] = Drawing.INITDATA;
         this.draw.player.DRAWDROPITEMBAG[param1 + Player.MAX_DRAWDROPITEM] = Drawing.INITDATA;
         _loc2_ = 1;
         while(_loc2_ < Player.MAX_DRAWDROPITEM)
         {
            if(this.draw.player.DRAWDROPITEM[_loc2_])
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  if(!this.draw.player.DRAWDROPITEM[_loc3_])
                  {
                     this.draw.player.DRAWDROPITEM[_loc3_] = this.draw.player.DRAWDROPITEM[_loc2_];
                     this.draw.player.DRAWDROPITEM[_loc2_] = false;
                     this.draw.player.DRAWDROPITEMTIME[_loc3_] = this.draw.player.DRAWDROPITEMTIME[_loc2_];
                     this.draw.player.DRAWDROPITEMTIME[_loc2_] = Drawing.INITDATA;
                     this.draw.player.DRAWDROPITEMBAG[_loc3_] = this.draw.player.DRAWDROPITEMBAG[_loc2_];
                     this.draw.player.DRAWDROPITEMBAG[_loc2_] = Drawing.INITDATA;
                     this.draw.player.DRAWDROPITEMBAG[_loc3_ + Player.MAX_DRAWDROPITEM] = this.draw.player.DRAWDROPITEMBAG[_loc2_ + Player.MAX_DRAWDROPITEM];
                     this.draw.player.DRAWDROPITEMBAG[_loc2_ + Player.MAX_DRAWDROPITEM] = Drawing.INITDATA;
                     break;
                  }
                  _loc3_++;
               }
            }
            _loc2_++;
         }
      }
      
      public function sortDestinyIcon(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.initDestinyIcon(param1);
         --this.draw.player.nDestinyIconAppear;
         _loc2_ = 1;
         while(_loc2_ < Drawing.MAX_DESTINYICONNUM)
         {
            if(this.draw.DESTINYICON[_loc2_].nType > Drawing.INITDATA)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  if(this.draw.DESTINYICON[_loc3_].nType == Drawing.INITDATA)
                  {
                     this.draw.DESTINYICON[_loc3_].nType = this.draw.DESTINYICON[_loc2_].nType;
                     this.draw.DESTINYICON[_loc2_].nType = Drawing.INITDATA;
                     this.draw.DESTINYICON[_loc3_].nKind = this.draw.DESTINYICON[_loc2_].nKind;
                     this.draw.DESTINYICON[_loc2_].nKind = Drawing.INITDATA;
                     this.draw.DESTINYICON[_loc3_].nPosX = this.draw.DESTINYICON[_loc2_].nPosX;
                     this.draw.DESTINYICON[_loc2_].nPosX = this.draw.nLcdW;
                     this.draw.DESTINYICON[_loc3_].nPosY = this.draw.DESTINYICON[_loc2_].nPosY;
                     this.draw.DESTINYICON[_loc2_].nPosY = 431;
                     this.draw.DESTINYICON[_loc3_].bAppear = this.draw.DESTINYICON[_loc2_].bAppear;
                     this.draw.DESTINYICON[_loc2_].bAppear = false;
                     this.draw.DESTINYICON[_loc3_].bMove = this.draw.DESTINYICON[_loc2_].bMove;
                     this.draw.DESTINYICON[_loc2_].bMove = false;
                     break;
                  }
                  _loc3_++;
               }
            }
            _loc2_++;
         }
      }
      
      public function movePlayer() : void
      {
         var _loc1_:Number = NaN;
         if(this.draw.nGameState == Drawing.GAME_PLAY)
         {
            if(this.draw.nGameScene < Player.PALADOGDIESCENE)
            {
               _loc1_ = this.draw.player.nMoveWidth;
               this.draw.player.nMoveWidth += this.draw.player.nMoveWidth * this.draw.nLeakFrame;
               if(this.draw.player.bMoveLeft)
               {
                  if(!this.draw.player.bBgLeft)
                  {
                     if(!this.draw.player.bSetSndStartTime)
                     {
                        this.draw.lib.playEffect(61);
                        this.draw.player.nSetSndStartTime = getTimer();
                        this.draw.player.bSetSndStartTime = true;
                     }
                     else
                     {
                        this.draw.player.nNowTime = getTimer();
                        if(this.draw.player.nNowTime - this.draw.player.nSetSndStartTime >= 400)
                        {
                           this.draw.lib.playEffect(61);
                           this.draw.player.nSetSndStartTime = getTimer();
                        }
                     }
                     this.draw.player.nPosX -= this.draw.player.nMoveWidth;
                  }
                  if(this.draw.player.nPosX <= Player.PLAYER_MAXLEFTPOS)
                  {
                     this.draw.player.nPosX = Player.PLAYER_MAXLEFTPOS;
                  }
                  if(this.draw.player.bMoveLeft)
                  {
                     if(this.draw.player.nPosX <= this.draw.player.nMoveBg)
                     {
                        this.draw.player.bBgLeft = true;
                     }
                     if(this.draw.player.nBgPosX >= this.draw.player.nBgLeftX)
                     {
                        this.draw.player.bBgLeft = false;
                     }
                  }
               }
               else if(this.draw.player.bMoveRight)
               {
                  if(!this.draw.player.bBgRight)
                  {
                     if(!this.draw.player.bSetSndStartTime)
                     {
                        this.draw.lib.playEffect(61);
                        this.draw.player.nSetSndStartTime = getTimer();
                        this.draw.player.bSetSndStartTime = true;
                     }
                     else
                     {
                        this.draw.player.nNowTime = getTimer();
                        if(this.draw.player.nNowTime - this.draw.player.nSetSndStartTime >= 400)
                        {
                           this.draw.lib.playEffect(61);
                           this.draw.player.nSetSndStartTime = getTimer();
                        }
                     }
                     this.draw.player.nPosX += this.draw.player.nMoveWidth;
                  }
                  if(this.draw.player.nGameMode == Drawing.MODE_WAGON)
                  {
                     if(this.draw.player.nPosX >= this.draw.player.nBgPosX + Player.BG_W)
                     {
                        this.draw.player.nPosX = this.draw.player.nBgPosX + Player.BG_W;
                     }
                  }
                  else if(this.draw.player.nGameMode == Drawing.MODE_BOSS)
                  {
                     if(this.draw.player.bEnemyStationCrashed || this.draw.player.bBossEnemyAppear)
                     {
                        if(this.draw.player.nPosX >= this.draw.player.nBgPosX + Player.BG_W)
                        {
                           this.draw.player.nPosX = this.draw.player.nBgPosX + Player.BG_W;
                        }
                     }
                     else if(this.draw.player.nPosX >= this.draw.player.nBgPosX + Player.PLAYER_MAXRIGHTPOS)
                     {
                        this.draw.player.nPosX = this.draw.player.nBgPosX + Player.PLAYER_MAXRIGHTPOS;
                     }
                  }
                  else if(this.draw.player.nPosX >= this.draw.player.nBgPosX + Player.PLAYER_MAXRIGHTPOS)
                  {
                     this.draw.player.nPosX = this.draw.player.nBgPosX + Player.PLAYER_MAXRIGHTPOS;
                  }
                  if(this.draw.player.bMoveRight)
                  {
                     if(this.draw.player.nPosX >= this.draw.player.nMoveBg)
                     {
                        this.draw.player.bBgRight = true;
                     }
                     if(this.draw.player.nBgPosX <= -this.draw.player.nBgRightX)
                     {
                        this.draw.player.bBgRight = false;
                     }
                  }
               }
               if(this.draw.player.bBgLeft)
               {
                  if(!this.draw.player.bSetSndStartTime)
                  {
                     this.draw.lib.playEffect(61);
                     this.draw.player.nSetSndStartTime = getTimer();
                     this.draw.player.bSetSndStartTime = true;
                  }
                  else
                  {
                     this.draw.player.nNowTime = getTimer();
                     if(this.draw.player.nNowTime - this.draw.player.nSetSndStartTime >= 400)
                     {
                        this.draw.lib.playEffect(61);
                        this.draw.player.nSetSndStartTime = getTimer();
                     }
                  }
                  this.draw.player.nBgPosX += this.draw.player.nMoveWidth;
                  this.draw.player.nBg2PosX += this.draw.player.nMoveWidth / 100 * Player.BG2_MOVE;
                  if(this.draw.player.nBgPosX >= this.draw.player.nBgLeftX)
                  {
                     this.draw.player.nBgPosX = this.draw.player.nBgLeftX;
                     this.draw.player.nBg2PosX = this.draw.player.nBgLeftX;
                     this.draw.player.bBgLeft = false;
                  }
                  this.playerControlMove(this.draw.player.nMoveWidth);
               }
               else if(this.draw.player.bBgRight)
               {
                  if(!this.draw.player.bSetSndStartTime)
                  {
                     this.draw.lib.playEffect(61);
                     this.draw.player.nSetSndStartTime = getTimer();
                     this.draw.player.bSetSndStartTime = true;
                  }
                  else
                  {
                     this.draw.player.nNowTime = getTimer();
                     if(this.draw.player.nNowTime - this.draw.player.nSetSndStartTime >= 400)
                     {
                        this.draw.lib.playEffect(61);
                        this.draw.player.nSetSndStartTime = getTimer();
                     }
                  }
                  this.draw.player.nBgPosX -= this.draw.player.nMoveWidth;
                  this.draw.player.nBg2PosX -= this.draw.player.nMoveWidth / 100 * Player.BG2_MOVE;
                  if(this.draw.player.nBgPosX <= -this.draw.player.nBgRightX)
                  {
                     this.draw.player.nBgPosX = -this.draw.player.nBgRightX;
                     this.draw.player.nBg2PosX = -(this.draw.player.nBgRightX / 100 * Player.BG2_MOVE);
                     this.draw.player.bBgRight = false;
                  }
                  this.playerControlMove(-this.draw.player.nMoveWidth);
               }
               this.draw.player.nMoveWidth = _loc1_;
            }
            else
            {
               this.draw.player.nPosX += this.draw.player.nPlayerDieWidth * (1 + this.draw.nLeakFrame);
               if(this.draw.player.nGameMode != Drawing.MODE_WARROAD)
               {
                  if(this.draw.player.nBgPosX < 0)
                  {
                     this.draw.player.nBgPosX += this.draw.player.nBgDieWidth * (1 + this.draw.nLeakFrame);
                     this.draw.player.nBg2PosX += this.draw.player.nBgDieWidth * (1 + this.draw.nLeakFrame) / 100 * Player.BG2_MOVE;
                     this.playerControlMove(this.draw.player.nBgDieWidth * (1 + this.draw.nLeakFrame));
                  }
               }
            }
         }
      }
      
      public function playerControlMove(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < Drawing.MAX_ENEMYNUM)
         {
            if(Boolean(this.draw.ENEMY[_loc2_].bAppear) || Boolean(this.draw.ENEMY[_loc2_].bFence))
            {
               this.draw.ENEMY[_loc2_].nPosX += param1;
               _loc3_ = 0;
               while(_loc3_ < Enemy.MAX_DMG)
               {
                  if(this.draw.ENEMY[_loc2_].DMGKIND[_loc3_] > Drawing.INITDATA)
                  {
                     this.draw.ENEMY[_loc2_].DMGPOSX[_loc3_] += param1;
                  }
                  _loc3_++;
               }
            }
            _loc3_ = 0;
            while(_loc3_ < Enemy.MAX_ENEMYATTACK)
            {
               if(this.draw.ENEMY[_loc2_].ATTACKANI[_loc3_] > Drawing.INITDATA)
               {
                  if(this.draw.ENEMY[_loc2_].ATTACKPOSX[_loc3_] > Drawing.INITDATA)
                  {
                     this.draw.ENEMY[_loc2_].ATTACKPOSX[_loc3_] += param1;
                  }
                  if(this.draw.ENEMY[_loc2_].ATTACKARMSPOSX[_loc3_] > Drawing.INITDATA)
                  {
                     this.draw.ENEMY[_loc2_].ATTACKARMSPOSX[_loc3_] += param1;
                  }
                  if(this.draw.ENEMY[_loc2_].SUBATTACKARMSPOSX[_loc3_] > Drawing.INITDATA)
                  {
                     this.draw.ENEMY[_loc2_].SUBATTACKARMSPOSX[_loc3_] += param1;
                  }
               }
               _loc3_++;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < Drawing.MAX_UNITNUM)
         {
            if(this.draw.UNIT[_loc2_].bAppear)
            {
               this.draw.UNIT[_loc2_].nPosX += param1;
               _loc3_ = 0;
               while(_loc3_ < Unit.MAX_DMG)
               {
                  if(this.draw.UNIT[_loc2_].DMGKIND[_loc3_] > Drawing.INITDATA)
                  {
                     this.draw.UNIT[_loc2_].DMGPOSX[_loc3_] += param1;
                  }
                  _loc3_++;
               }
            }
            _loc3_ = 0;
            while(_loc3_ < Unit.MAX_UNITATTACK)
            {
               if(this.draw.UNIT[_loc2_].ATTACKANI[_loc3_] > Drawing.INITDATA)
               {
                  if(this.draw.UNIT[_loc2_].ATTACKPOSX[_loc3_] > Drawing.INITDATA)
                  {
                     this.draw.UNIT[_loc2_].ATTACKPOSX[_loc3_] += param1;
                  }
                  if(this.draw.UNIT[_loc2_].ATTACKARMSPOSX[_loc3_] > Drawing.INITDATA)
                  {
                     this.draw.UNIT[_loc2_].ATTACKARMSPOSX[_loc3_] += param1;
                  }
                  if(this.draw.UNIT[_loc2_].SUBATTACKARMSPOSX[_loc3_] > Drawing.INITDATA)
                  {
                     this.draw.UNIT[_loc2_].SUBATTACKARMSPOSX[_loc3_] += param1;
                  }
               }
               _loc3_++;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < Player.MAX_DMG)
         {
            if(this.draw.player.DMGKIND[_loc2_] > Drawing.INITDATA)
            {
               this.draw.player.DMGPOSX[_loc2_] += param1;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < Player.MAX_ATTACK)
         {
            if(this.draw.player.ATTACKANI[_loc2_] > Drawing.INITDATA)
            {
               if(this.draw.player.ATTACKPOSX[_loc2_] > Drawing.INITDATA)
               {
                  this.draw.player.ATTACKPOSX[_loc2_] += param1;
               }
               if(this.draw.player.ATTACKARMSPOSX[_loc2_] > Drawing.INITDATA)
               {
                  this.draw.player.ATTACKARMSPOSX[_loc2_] += param1;
               }
               if(this.draw.player.SUBATTACKARMSPOSX[_loc2_] > Drawing.INITDATA)
               {
                  this.draw.player.SUBATTACKARMSPOSX[_loc2_] += param1;
               }
            }
            _loc2_++;
         }
      }
      
      public function moveDestinyIcon(param1:int) : void
      {
         if(this.draw.DESTINYICON[param1].bAppear)
         {
            if(this.draw.DESTINYICON[param1].bMove)
            {
               this.draw.DESTINYICON[param1].nPosX -= Player.DESTINYICON_MOVEWIDTH * (1 + this.draw.nLeakFrame);
               if(this.draw.DESTINYICON[param1].nPosX <= DestinyIcon.ARRIVE_POS + param1 * DestinyIcon.ICON_WIDTH)
               {
                  this.draw.DESTINYICON[param1].nPosX = DestinyIcon.ARRIVE_POS + param1 * DestinyIcon.ICON_WIDTH;
                  this.draw.DESTINYICON[param1].bMove = false;
               }
            }
            else if(this.draw.DESTINYICON[param1].nPosX > DestinyIcon.ARRIVE_POS + param1 * DestinyIcon.ICON_WIDTH)
            {
               this.draw.DESTINYICON[param1].bMove = true;
            }
         }
      }
      
      public function fireDestinyIcon(param1:int) : void
      {
         switch(this.draw.DESTINYICON[param1].nType)
         {
            case DestinyIcon.ICON_MACE:
               this.fireDestinyArms(this.draw.DESTINYICON[param1].nKind);
               this.draw.player.UNITBTN[param1] = true;
               break;
            case DestinyIcon.ICON_UNIT:
               this.draw.lib.playEffect(98);
               this.appearNextUnit(this.draw.DESTINYICON[param1].nKind,true,true);
               this.draw.player.UNITBTN[param1] = true;
         }
      }
      
      public function moveEnemy(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         if(this.draw.ENEMY[param1].bAppear)
         {
            if(this.draw.ENEMY[param1].bAlive)
            {
               _loc4_ = false;
               if(this.draw.ENEMY[param1].bMove)
               {
                  if(this.draw.player.nGameMode == Drawing.MODE_DESTINY || this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                  {
                     _loc3_ = this.draw.nLcdW + 10;
                     if(this.draw.ENEMY[param1].nPosX > _loc3_)
                     {
                        this.draw.ENEMY[param1].bMove = true;
                        this.draw.ENEMY[param1].nAttackUnit = Drawing.INITDATA;
                        this.draw.ENEMY[param1].bAttack = false;
                        this.draw.ENEMY[param1].nAtkFrame = 0;
                        this.draw.ENEMY[param1].bAttackReady = false;
                     }
                  }
                  else
                  {
                     _loc3_ = this.draw.player.nBgPosX + Player.BG_W;
                  }
                  if(!this.draw.bBossDiaEvent && this.draw.ENEMY[param1].nPosX <= _loc3_ && !this.draw.ENEMY[param1].bIce && !this.draw.ENEMY[param1].bGhostMove && !this.draw.ENEMY[param1].bBabyGhostMove)
                  {
                     if(this.draw.ENEMY[param1].nAttackUnit > Drawing.INITDATA)
                     {
                        _loc4_ = false;
                        _loc2_ = int(this.draw.ENEMY[param1].nAttackUnit);
                        if(_loc2_ == Drawing.HEROPOS)
                        {
                           if(this.draw.player.nGameMode != Drawing.MODE_WARROAD && this.draw.ENEMY[param1].nBaseType != Drawing.ENEMY_BOSSWITCH)
                           {
                              if(this.draw.player.nHp > 0)
                              {
                                 if(this.draw.player.nPosX >= this.draw.ENEMY[param1].nPosX - this.draw.ENEMY[param1].nBattleLen - Player.PALADOGDMGWIDTH && this.draw.player.nPosX <= this.draw.ENEMY[param1].nPosX)
                                 {
                                    this.draw.ENEMY[param1].bMove = false;
                                    this.draw.ENEMY[param1].nAttackUnit = Drawing.HEROPOS;
                                    this.draw.ENEMY[param1].bAttack = true;
                                    this.draw.ENEMY[param1].nAtkFrame = 0;
                                    _loc4_ = true;
                                 }
                              }
                           }
                        }
                        else if(this.draw.UNIT[_loc2_].bAlive)
                        {
                           if(this.draw.UNIT[_loc2_].bWagon)
                           {
                              if(this.draw.ENEMY[param1].nPosX - this.draw.ENEMY[param1].nBattleLen >= this.draw.UNIT[_loc2_].nPosX - 50 && this.draw.ENEMY[param1].nPosX - this.draw.ENEMY[param1].nBattleLen <= this.draw.UNIT[_loc2_].nPosX + Player.WAGONDMGWIDTH || this.draw.ENEMY[param1].nPosX >= this.draw.UNIT[_loc2_].nPosX - 50 && this.draw.ENEMY[param1].nPosX <= this.draw.UNIT[_loc2_].nPosX + Player.WAGONDMGWIDTH)
                              {
                                 this.draw.ENEMY[param1].bMove = false;
                                 this.draw.ENEMY[param1].nAttackUnit = _loc2_;
                                 this.draw.ENEMY[param1].bAttack = true;
                                 this.draw.ENEMY[param1].nAtkFrame = 0;
                                 _loc4_ = true;
                              }
                           }
                           else if(this.draw.UNIT[_loc2_].nPosX >= this.draw.ENEMY[param1].nPosX - this.draw.ENEMY[param1].nBattleLen - this.draw.UNIT[_loc2_].nAttackedLen && this.draw.UNIT[_loc2_].nPosX <= this.draw.ENEMY[param1].nPosX + this.draw.UNIT[_loc2_].nAttackedLen)
                           {
                              if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                              {
                                 if(this.draw.UNIT[_loc2_].nPosY == this.draw.ENEMY[param1].nPosY)
                                 {
                                    this.draw.ENEMY[param1].bMove = false;
                                    this.draw.ENEMY[param1].nAttackUnit = _loc2_;
                                    this.draw.ENEMY[param1].bAttack = true;
                                    this.draw.ENEMY[param1].nAtkFrame = 0;
                                    _loc4_ = true;
                                 }
                              }
                              else
                              {
                                 this.draw.ENEMY[param1].bMove = false;
                                 this.draw.ENEMY[param1].nAttackUnit = _loc2_;
                                 this.draw.ENEMY[param1].bAttack = true;
                                 this.draw.ENEMY[param1].nAtkFrame = 0;
                                 _loc4_ = true;
                              }
                           }
                        }
                        if(!_loc4_)
                        {
                           this.draw.ENEMY[param1].nAttackUnit = Drawing.INITDATA;
                        }
                     }
                     if(this.draw.ENEMY[param1].nAttackUnit <= Drawing.INITDATA)
                     {
                        _loc2_ = 0;
                        while(_loc2_ < Drawing.MAX_UNITNUM)
                        {
                           if(this.draw.UNIT[_loc2_].bAlive)
                           {
                              if(this.draw.UNIT[_loc2_].bWagon)
                              {
                                 if(this.draw.ENEMY[param1].nBaseType != Drawing.ENEMY_BOSSWITCH)
                                 {
                                    if(this.draw.ENEMY[param1].nPosX - this.draw.ENEMY[param1].nBattleLen >= this.draw.UNIT[_loc2_].nPosX - 50 && this.draw.ENEMY[param1].nPosX - this.draw.ENEMY[param1].nBattleLen <= this.draw.UNIT[_loc2_].nPosX + Player.WAGONDMGWIDTH || this.draw.ENEMY[param1].nPosX >= this.draw.UNIT[_loc2_].nPosX - 50 && this.draw.ENEMY[param1].nPosX <= this.draw.UNIT[_loc2_].nPosX + Player.WAGONDMGWIDTH)
                                    {
                                       this.draw.ENEMY[param1].bMove = false;
                                       this.draw.ENEMY[param1].nAttackUnit = _loc2_;
                                       this.draw.ENEMY[param1].bAttack = true;
                                       this.draw.ENEMY[param1].nAtkFrame = 0;
                                       break;
                                    }
                                 }
                              }
                              else if(this.draw.UNIT[_loc2_].nPosX >= this.draw.ENEMY[param1].nPosX - this.draw.ENEMY[param1].nBattleLen - this.draw.UNIT[_loc2_].nAttackedLen && this.draw.UNIT[_loc2_].nPosX <= this.draw.ENEMY[param1].nPosX + this.draw.UNIT[_loc2_].nAttackedLen)
                              {
                                 if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                                 {
                                    if(this.draw.UNIT[_loc2_].nPosY == this.draw.ENEMY[param1].nPosY)
                                    {
                                       if(this.draw.ENEMY[param1].nAttackUnit <= Drawing.INITDATA)
                                       {
                                          this.draw.ENEMY[param1].nAttackUnit = _loc2_;
                                       }
                                       else if(this.draw.UNIT[_loc2_].nPosX > this.draw.UNIT[this.draw.ENEMY[param1].nAttackUnit].nPosX)
                                       {
                                          this.draw.ENEMY[param1].nAttackUnit = _loc2_;
                                       }
                                       this.draw.ENEMY[param1].bMove = false;
                                       this.draw.ENEMY[param1].bAttack = true;
                                       this.draw.ENEMY[param1].nAtkFrame = 0;
                                    }
                                 }
                                 else
                                 {
                                    if(this.draw.ENEMY[param1].nAttackUnit <= Drawing.INITDATA)
                                    {
                                       this.draw.ENEMY[param1].nAttackUnit = _loc2_;
                                    }
                                    else if(this.draw.UNIT[_loc2_].nPosX > this.draw.UNIT[this.draw.ENEMY[param1].nAttackUnit].nPosX)
                                    {
                                       this.draw.ENEMY[param1].nAttackUnit = _loc2_;
                                    }
                                    this.draw.ENEMY[param1].bMove = false;
                                    this.draw.ENEMY[param1].bAttack = true;
                                    this.draw.ENEMY[param1].nAtkFrame = 0;
                                 }
                              }
                           }
                           _loc2_++;
                        }
                        if(this.draw.ENEMY[param1].nAttackUnit <= Drawing.INITDATA)
                        {
                           if(this.draw.player.nGameMode != Drawing.MODE_WARROAD && this.draw.ENEMY[param1].nBaseType != Drawing.ENEMY_BOSSWITCH)
                           {
                              if(this.draw.player.nHp > 0)
                              {
                                 if(this.draw.player.nPosX >= this.draw.ENEMY[param1].nPosX - this.draw.ENEMY[param1].nBattleLen - Player.PALADOGDMGWIDTH && this.draw.player.nPosX <= this.draw.ENEMY[param1].nPosX)
                                 {
                                    this.draw.ENEMY[param1].bMove = false;
                                    this.draw.ENEMY[param1].nAttackUnit = Drawing.HEROPOS;
                                    this.draw.ENEMY[param1].bAttack = true;
                                    this.draw.ENEMY[param1].nAtkFrame = 0;
                                 }
                              }
                           }
                        }
                     }
                     if(this.draw.ENEMY[param1].nAttackDelayStartTime > Drawing.INITDATA)
                     {
                        if(this.draw.ENEMY[param1].bAttack)
                        {
                           this.draw.ENEMY[param1].bMove = true;
                           this.draw.ENEMY[param1].bAttack = false;
                           this.draw.ENEMY[param1].nAtkFrame = 0;
                           this.draw.ENEMY[param1].bAttackReady = true;
                        }
                        else if(this.draw.ENEMY[param1].nBaseType == Drawing.ENEMY_STONE || this.draw.ENEMY[param1].nBaseType == Drawing.ENEMY_ARMORSHIELD)
                        {
                           this.draw.ENEMY[param1].bAttackReady = true;
                        }
                        else
                        {
                           this.draw.ENEMY[param1].bAttackReady = false;
                        }
                     }
                     else
                     {
                        this.draw.ENEMY[param1].bAttackReady = false;
                     }
                     if(this.draw.ENEMY[param1].bAttack)
                     {
                        if(this.draw.ENEMY[param1].nBaseType == Drawing.ENEMY_BOSSGHOST)
                        {
                           if(!this.draw.ENEMY[param1].bGhostMove)
                           {
                              if(this.draw.lib.getRand(100) < 20)
                              {
                                 this.draw.ENEMY[param1].bGhostMove = true;
                                 this.draw.ENEMY[param1].bInvisible = false;
                                 this.draw.ENEMY[param1].bVisible = false;
                                 this.draw.ENEMY[param1].nGhostStartTime = getTimer();
                                 this.draw.ENEMY[param1].nGhostTime = 1000;
                                 this.draw.ENEMY[param1].bMove = true;
                                 this.draw.ENEMY[param1].nAttackUnit = Drawing.INITDATA;
                                 this.draw.ENEMY[param1].bAttack = false;
                                 this.draw.ENEMY[param1].nAtkFrame = 0;
                                 this.draw.lib.playEffect(6);
                              }
                           }
                        }
                        else if(this.draw.ENEMY[param1].nBaseType == Drawing.ENEMY_GHOST)
                        {
                           if(!this.draw.ENEMY[param1].bBabyGhostMoveOk)
                           {
                              if(!this.draw.ENEMY[param1].bBabyGhostMove)
                              {
                                 this.draw.ENEMY[param1].bBabyGhostMove = true;
                                 this.draw.ENEMY[param1].bBabyGhostMoving = false;
                                 this.draw.ENEMY[param1].bBabyInvisible = false;
                                 this.draw.ENEMY[param1].bBabyVisible = false;
                                 this.draw.ENEMY[param1].nBabyGhostStartTime = getTimer();
                                 this.draw.ENEMY[param1].nBabyGhostTime = 1000;
                                 this.draw.ENEMY[param1].nBabyGhostMoveDistance = 0;
                                 this.draw.ENEMY[param1].bMove = true;
                                 this.draw.ENEMY[param1].nAttackUnit = Drawing.INITDATA;
                                 this.draw.ENEMY[param1].bAttack = false;
                                 this.draw.ENEMY[param1].nAtkFrame = 0;
                                 this.draw.lib.playEffect(23);
                              }
                           }
                        }
                     }
                  }
                  if(!this.draw.ENEMY[param1].bAttack && !this.draw.ENEMY[param1].bIce && !this.draw.ENEMY[param1].bAttackReady && !this.draw.ENEMY[param1].bGhostMove && !this.draw.ENEMY[param1].bBabyGhostMove || Boolean(this.draw.ENEMY[param1].bBabyGhostMove) && Boolean(this.draw.ENEMY[param1].bBabyGhostMoving))
                  {
                     this.draw.ENEMY[param1].bLastAttackFrame = false;
                     switch(this.draw.ENEMY[param1].nBaseType)
                     {
                        case Drawing.ENEMY_ZOMBIE:
                        case Drawing.ENEMY_MUMMY:
                        case Drawing.ENEMY_FRANKEN:
                        case Drawing.ENEMY_DARKZOMBIE:
                        case Drawing.ENEMY_STONE:
                        case Drawing.ENEMY_MINERZOMBIE:
                           this.draw.ENEMY[param1].nMaxStep = 12;
                           this.draw.ENEMY[param1].nStep = int(this.draw.nGameFrame % (this.draw.ENEMY[param1].nMaxStep * 4) / 4);
                           this.draw.ENEMY[param1].nPosX -= (1 + this.draw.nLeakFrame) / (Drawing.FPS / this.draw.ENEMY[param1].nPps);
                           break;
                        case Drawing.ENEMY_BOSSZOMBIE:
                        case Drawing.ENEMY_BOSSWITCH:
                        case Drawing.ENEMY_BOSSSOCCER:
                        case Drawing.ENEMY_BOSSMUMMY:
                        case Drawing.ENEMY_BOSSGHOST:
                        case Drawing.ENEMY_BOSSBIGMOUTH:
                        case Drawing.ENEMY_BOSSPALADOG:
                        case Drawing.ENEMY_BOSSDRAGON:
                        case Drawing.ENEMY_BOSSWOMANDEVIL:
                        case Drawing.ENEMY_BOSSMANDEVIL:
                           this.draw.ENEMY[param1].nMaxStep = 24;
                           this.draw.ENEMY[param1].nStep = int(this.draw.nGameFrame % this.draw.ENEMY[param1].nMaxStep);
                           if(this.draw.bBossDiaEvent)
                           {
                              this.draw.ENEMY[param1].nPosX -= (1 + this.draw.nLeakFrame) / (Drawing.FPS / Drawing.BOSSPPS_EVENT);
                              if(this.draw.ENEMY[param1].nPosX <= this.draw.player.nBgPosX + Player.BG_W - Drawing.BOSSDIALOGPOS_EVENT)
                              {
                                 this.draw.bBossDiaEvent = false;
                                 this.draw.bBossDialog = true;
                              }
                           }
                           else
                           {
                              this.draw.ENEMY[param1].nPosX -= (1 + this.draw.nLeakFrame) / (Drawing.FPS / this.draw.ENEMY[param1].nPps);
                           }
                           break;
                        default:
                           this.draw.ENEMY[param1].nMaxStep = 12;
                           this.draw.ENEMY[param1].nStep = int(this.draw.nGameFrame % (this.draw.ENEMY[param1].nMaxStep * 2) / 2);
                           this.draw.ENEMY[param1].nPosX -= (1 + this.draw.nLeakFrame) / (Drawing.FPS / this.draw.ENEMY[param1].nPps);
                     }
                     if(Boolean(this.draw.ENEMY[param1].bBabyGhostMove) && Boolean(this.draw.ENEMY[param1].bBabyGhostMoving))
                     {
                        this.draw.ENEMY[param1].nBabyGhostMoveDistance += (1 + this.draw.nLeakFrame) / (Drawing.FPS / this.draw.ENEMY[param1].nPps);
                     }
                     switch(this.draw.player.nGameMode)
                     {
                        case Drawing.MODE_NORMAL:
                        case Drawing.MODE_WAGON:
                        case Drawing.MODE_BOSS:
                        case Drawing.MODE_SURVIVAL:
                        case Drawing.MODE_DESTINY:
                           if(this.draw.ENEMY[param1].nPosX < this.draw.player.nBgPosX - this.draw.ENEMY[param1].nArrivePos)
                           {
                              this.draw.ENEMY[param1].nPosX = this.draw.player.nBgPosX + Player.BG_W;
                           }
                           break;
                        case Drawing.MODE_WARROAD:
                           if(this.draw.ENEMY[param1].nPosX < 0)
                           {
                              this.draw.ENEMY[param1].bAppear = false;
                              this.draw.ENEMY[param1].bAlive = false;
                              this.draw.ENEMY[param1].bMove = false;
                              this.draw.ENEMY[param1].bArrive = true;
                           }
                     }
                  }
               }
            }
         }
      }
      
      public function setBossDialogPos() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         if(this.draw.player.nSubBgPosX >= Drawing.BGINITX)
         {
            this.draw.player.nSubBgPosX = this.draw.player.nBgPosX;
            this.draw.player.nSubBg2PosX = this.draw.player.nBg2PosX;
            this.draw.player.nSubPosX = this.draw.player.nPosX;
         }
         _loc2_ = this.draw.player.nBgPosX;
         _loc3_ = -(this.draw.player.nBgRightX + this.draw.player.nBgPosX);
         if(this.draw.player.nBgPosX + _loc3_ >= this.draw.player.nBgLeftX)
         {
            _loc3_ -= this.draw.player.nBgPosX + _loc3_ - this.draw.player.nBgLeftX;
         }
         else if(this.draw.player.nBgPosX + _loc3_ <= -this.draw.player.nBgRightX)
         {
            _loc3_ -= this.draw.player.nBgPosX + _loc3_ + this.draw.player.nBgRightX;
         }
         this.draw.player.nBgPosX += _loc3_;
         this.draw.player.nBg2PosX += _loc3_ / 100 * Player.BG2_MOVE;
         this.draw.player.nPosX += _loc3_;
         _loc2_ = this.draw.player.nBgPosX - _loc2_;
         this.playerControlMove(_loc2_);
      }
      
      public function resetBossDialogPos() : void
      {
         this.draw.player.bMoveLeft = false;
         this.draw.player.bBgLeft = false;
         this.draw.player.bMoveRight = false;
         this.draw.player.bBgRight = false;
         this.draw.player.nMoveDirection = Drawing.INITDATA;
         this.resetMouseDrag();
      }
      
      public function moveUnit(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:Number = NaN;
         if(this.draw.UNIT[param1].bAppear)
         {
            if(this.draw.UNIT[param1].bAlive)
            {
               _loc3_ = false;
               if(this.draw.UNIT[param1].bMove)
               {
                  if(!this.draw.UNIT[param1].bWagon)
                  {
                     if(!this.draw.UNIT[param1].bFrog && !this.draw.UNIT[param1].bIce)
                     {
                        if(this.draw.UNIT[param1].nAttackEnemy > Drawing.INITDATA)
                        {
                           _loc3_ = false;
                           _loc2_ = int(this.draw.UNIT[param1].nAttackEnemy);
                           if(_loc2_ == Drawing.ENEMYSTATIONPOS)
                           {
                              if(!this.draw.player.bStageClear)
                              {
                                 if(this.draw.player.nGameMode != Drawing.MODE_WAGON && this.draw.player.nEnemyStationHp > 0)
                                 {
                                    if(this.draw.UNIT[param1].nPosX + this.draw.UNIT[param1].nBattleLen >= this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS)
                                    {
                                       this.draw.UNIT[param1].bMove = false;
                                       this.draw.UNIT[param1].nAttackEnemy = Drawing.ENEMYSTATIONPOS;
                                       this.draw.UNIT[param1].bAttack = true;
                                       this.draw.UNIT[param1].nAtkFrame = 0;
                                       _loc3_ = true;
                                    }
                                 }
                              }
                           }
                           else if(Boolean(this.draw.ENEMY[_loc2_].bAlive && !this.draw.ENEMY[_loc2_].bGhostMove) && Boolean(!this.draw.ENEMY[_loc2_].bBabyGhostMove) && this.draw.ENEMY[_loc2_].nBaseType != Drawing.ENEMY_BOSSPALADOG)
                           {
                              if(this.draw.ENEMY[_loc2_].nPosX >= this.draw.UNIT[param1].nPosX - this.draw.ENEMY[_loc2_].nAttackedLen && this.draw.ENEMY[_loc2_].nPosX <= this.draw.UNIT[param1].nPosX + this.draw.UNIT[param1].nBattleLen + this.draw.ENEMY[_loc2_].nAttackedLen)
                              {
                                 if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                                 {
                                    if(this.draw.ENEMY[_loc2_].nPosY == this.draw.UNIT[param1].nPosY)
                                    {
                                       this.draw.UNIT[param1].bMove = false;
                                       this.draw.UNIT[param1].nAttackEnemy = _loc2_;
                                       this.draw.UNIT[param1].bAttack = true;
                                       this.draw.UNIT[param1].nAtkFrame = 0;
                                       _loc3_ = true;
                                    }
                                 }
                                 else
                                 {
                                    this.draw.UNIT[param1].bMove = false;
                                    this.draw.UNIT[param1].nAttackEnemy = _loc2_;
                                    this.draw.UNIT[param1].bAttack = true;
                                    this.draw.UNIT[param1].nAtkFrame = 0;
                                    _loc3_ = true;
                                 }
                              }
                           }
                           if(!_loc3_)
                           {
                              this.draw.UNIT[param1].nAttackEnemy = Drawing.INITDATA;
                           }
                        }
                        if(this.draw.UNIT[param1].nAttackEnemy <= Drawing.INITDATA)
                        {
                           _loc2_ = 0;
                           while(_loc2_ < Drawing.MAX_ENEMYNUM)
                           {
                              if(Boolean(this.draw.ENEMY[_loc2_].bAlive && !this.draw.ENEMY[_loc2_].bGhostMove) && Boolean(!this.draw.ENEMY[_loc2_].bBabyGhostMove) && this.draw.ENEMY[_loc2_].nBaseType != Drawing.ENEMY_BOSSPALADOG)
                              {
                                 if(this.draw.ENEMY[_loc2_].nPosX >= this.draw.UNIT[param1].nPosX - this.draw.ENEMY[_loc2_].nAttackedLen && this.draw.ENEMY[_loc2_].nPosX <= this.draw.UNIT[param1].nPosX + this.draw.UNIT[param1].nBattleLen + this.draw.ENEMY[_loc2_].nAttackedLen)
                                 {
                                    if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                                    {
                                       if(this.draw.ENEMY[_loc2_].nPosY == this.draw.UNIT[param1].nPosY)
                                       {
                                          if(this.draw.UNIT[param1].nAttackEnemy <= Drawing.INITDATA)
                                          {
                                             this.draw.UNIT[param1].nAttackEnemy = _loc2_;
                                          }
                                          else if(this.draw.ENEMY[_loc2_].nPosX < this.draw.ENEMY[this.draw.UNIT[param1].nAttackEnemy].nPosX)
                                          {
                                             this.draw.UNIT[param1].nAttackEnemy = _loc2_;
                                          }
                                          this.draw.UNIT[param1].bMove = false;
                                          this.draw.UNIT[param1].bAttack = true;
                                          this.draw.UNIT[param1].nAtkFrame = 0;
                                       }
                                    }
                                    else
                                    {
                                       if(this.draw.UNIT[param1].nAttackEnemy <= Drawing.INITDATA)
                                       {
                                          this.draw.UNIT[param1].nAttackEnemy = _loc2_;
                                       }
                                       else if(this.draw.ENEMY[_loc2_].nPosX < this.draw.ENEMY[this.draw.UNIT[param1].nAttackEnemy].nPosX)
                                       {
                                          this.draw.UNIT[param1].nAttackEnemy = _loc2_;
                                       }
                                       this.draw.UNIT[param1].bMove = false;
                                       this.draw.UNIT[param1].bAttack = true;
                                       this.draw.UNIT[param1].nAtkFrame = 0;
                                    }
                                 }
                              }
                              _loc2_++;
                           }
                           if(this.draw.UNIT[param1].nAttackEnemy <= Drawing.INITDATA)
                           {
                              if(!this.draw.player.bStageClear)
                              {
                                 if(this.draw.player.nGameMode != Drawing.MODE_WAGON && this.draw.player.nEnemyStationHp > 0)
                                 {
                                    if(this.draw.UNIT[param1].nPosX + this.draw.UNIT[param1].nBattleLen >= this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS)
                                    {
                                       this.draw.UNIT[param1].bMove = false;
                                       this.draw.UNIT[param1].nAttackEnemy = Drawing.ENEMYSTATIONPOS;
                                       this.draw.UNIT[param1].bAttack = true;
                                       this.draw.UNIT[param1].nAtkFrame = 0;
                                    }
                                 }
                              }
                           }
                        }
                        if(this.draw.UNIT[param1].nAttackDelayStartTime > Drawing.INITDATA)
                        {
                           if(this.draw.UNIT[param1].bAttack)
                           {
                              this.draw.UNIT[param1].bMove = true;
                              this.draw.UNIT[param1].bAttack = false;
                              this.draw.UNIT[param1].nAtkFrame = 0;
                              this.draw.UNIT[param1].bAttackReady = true;
                           }
                           else if(this.draw.UNIT[param1].nType == Drawing.UNIT_TURTLE)
                           {
                              this.draw.UNIT[param1].bAttackReady = true;
                           }
                           else
                           {
                              this.draw.UNIT[param1].bAttackReady = false;
                           }
                        }
                        else
                        {
                           this.draw.UNIT[param1].bAttackReady = false;
                           if(this.draw.UNIT[param1].bAttack)
                           {
                              if(this.draw.UNIT[param1].bInAura)
                              {
                                 this.draw.player.nAuraSkillChance = this.draw.UNIT[param1].nSkillChance * (1 + this.draw.player.HEROSKILL[Player.SKILL_SKILLAURA] * 0.4);
                                 if(this.draw.lib.getRand(100) < this.draw.player.nAuraSkillChance)
                                 {
                                    this.draw.UNIT[param1].bSkillAtk = true;
                                 }
                              }
                           }
                        }
                     }
                  }
                  else
                  {
                     this.draw.player.nNowTime = getTimer();
                     if(this.draw.player.nNowTime - this.draw.UNIT[param1].nSetSndStartTime >= 1000)
                     {
                        this.draw.lib.playEffect(100);
                        this.draw.UNIT[param1].nSetSndStartTime = getTimer();
                     }
                  }
                  if(!this.draw.UNIT[param1].bAttack && !this.draw.UNIT[param1].bIce && !this.draw.UNIT[param1].bFrog && !this.draw.UNIT[param1].bAttackReady)
                  {
                     this.draw.UNIT[param1].bLastAttackFrame = false;
                     _loc4_ = Number(this.draw.UNIT[param1].nPps);
                     if(this.draw.UNIT[param1].bInAura)
                     {
                        _loc4_ = this.draw.UNIT[param1].nPps * (1.5 + this.draw.player.HEROSKILL[Player.SKILL_MOVEAURA] * 0.5);
                     }
                     _loc4_ *= Player.WEB_SCALE;
                     if(this.draw.UNIT[param1].bAttackedStop)
                     {
                        this.draw.player.nNowTime = getTimer();
                        if((this.draw.player.nNowTime - this.draw.UNIT[param1].nAttackedTime) * (1 + this.draw.player.nGameSpeed) >= Player.WAGON_ATTACKEDSTOPTIME)
                        {
                           this.draw.UNIT[param1].bAttackedStop = false;
                           this.draw.UNIT[param1].nAttackedTime = Drawing.INITDATA;
                        }
                     }
                     else
                     {
                        if(!this.draw.UNIT[param1].bWagon)
                        {
                           this.draw.UNIT[param1].nStep = int(this.draw.nGameFrame % (this.draw.UNIT[param1].nMaxStep * 2) / 2);
                        }
                        else
                        {
                           this.draw.UNIT[param1].nStep = int(this.draw.nGameFrame % (this.draw.UNIT[param1].nMaxStep * 4) / 4);
                        }
                        switch(this.draw.player.nGameMode)
                        {
                           case Drawing.MODE_NORMAL:
                           case Drawing.MODE_BOSS:
                           case Drawing.MODE_WAGON:
                           case Drawing.MODE_SURVIVAL:
                              if(this.draw.player.bStageClear)
                              {
                                 this.draw.UNIT[param1].nPosX += (1 + this.draw.nLeakFrame) / (Drawing.FPS / _loc4_);
                              }
                              else if(this.draw.UNIT[param1].nPosX < this.draw.player.nBgPosX + Player.BG_W - 50)
                              {
                                 this.draw.UNIT[param1].nPosX += (1 + this.draw.nLeakFrame) / (Drawing.FPS / _loc4_);
                              }
                              break;
                           case Drawing.MODE_DESTINY:
                              if(this.draw.player.bStageClear)
                              {
                                 this.draw.UNIT[param1].nPosX += (1 + this.draw.nLeakFrame) / (Drawing.FPS / _loc4_);
                              }
                              else if(this.draw.UNIT[param1].nPosX < this.draw.nLcdW - 60)
                              {
                                 this.draw.UNIT[param1].nPosX += (1 + this.draw.nLeakFrame) / (Drawing.FPS / _loc4_);
                              }
                              break;
                           case Drawing.MODE_WARROAD:
                              if(this.draw.UNIT[param1].nPosX <= this.draw.nLcdW)
                              {
                                 this.draw.UNIT[param1].nPosX += (1 + this.draw.nLeakFrame) / (Drawing.FPS / _loc4_);
                              }
                              else
                              {
                                 this.draw.UNIT[param1].bAppear = false;
                                 this.draw.UNIT[param1].bAlive = false;
                                 this.draw.UNIT[param1].bMove = false;
                                 this.draw.UNIT[param1].bArrive = true;
                              }
                        }
                     }
                  }
               }
               if(this.draw.UNIT[param1].bInAura)
               {
                  if(!this.draw.bBossDiaEvent && !this.draw.bBossDialog)
                  {
                     this.draw.UNIT[param1].nHp += this.regenUnitHp(param1);
                     if(this.draw.UNIT[param1].nHp >= this.draw.UNIT[param1].nMaxHp * 20 / 100)
                     {
                        this.draw.UNIT[param1].bWarningHp = false;
                     }
                     if(this.draw.UNIT[param1].nHp >= this.draw.UNIT[param1].nMaxHp)
                     {
                        this.draw.UNIT[param1].nHp = this.draw.UNIT[param1].nMaxHp;
                     }
                  }
               }
            }
         }
      }
      
      public function regenUnitHp(param1:int) : int
      {
         var _loc2_:int = 0;
         this.draw.player.nNowTime = getTimer();
         if((this.draw.player.nNowTime - this.draw.UNIT[param1].nHpRegenTime) * (1 + this.draw.player.nGameSpeed) >= Player.HPREGENTIME)
         {
            _loc2_ = this.draw.UNIT[param1].nMaxHp * 0.04 * this.draw.player.HEROSKILL[Player.SKILL_REGENAURA];
            this.draw.UNIT[param1].nHpRegenTime = getTimer();
         }
         return _loc2_;
      }
      
      public function fireArms(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.draw.player.EQUIPINVEN[param1] > Drawing.INITDATA)
         {
            if(this.draw.player.ARMSCHARGED[param1])
            {
               this.draw.bKeyPressed = true;
               this.draw.nKeyPressTime = getTimer();
               if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
               {
                  this.draw.player.FIREBTN[param1] = true;
                  this.draw.player.nNowArms = this.draw.player.EQUIPINVEN[param1];
                  _loc2_ = 0;
                  while(_loc2_ < Player.MAX_ATTACK)
                  {
                     if(this.draw.player.ATTACKANI[_loc2_] == Drawing.INITDATA)
                     {
                        this.draw.player.ATTACKANI[_loc2_] = this.draw.player.nNowArms;
                        this.draw.player.ATTACKANI[_loc2_ + Player.MAX_ATTACK] = 0;
                        _loc3_ = _loc2_;
                        break;
                     }
                     _loc2_++;
                  }
                  if(this.draw.player.nNowArms != Drawing.ATTACK_HORIZON)
                  {
                     this.setWarRoadAttack(param1,_loc3_);
                     this.draw.player.nMana -= this.getArmsChargeMana(this.draw.player.EQUIPINVEN[param1]);
                     this.draw.player.ARMSCHARGED[param1] = false;
                  }
                  else
                  {
                     if(!this.draw.player.bWarRoadSelectUnit)
                     {
                        this.draw.player.bWarRoadSelectUnit = true;
                        _loc2_ = 0;
                        while(_loc2_ < Player.NUM_WARROAD)
                        {
                           this.draw.player.nWarRoadPosX[_loc2_] = 0;
                           this.draw.player.nWarRoadPosX[_loc2_ + Player.NUM_WARROAD] = -this.draw.nLcdW;
                           _loc2_++;
                        }
                     }
                     this.draw.player.nSetWarRoadUnit = Drawing.INITDATA;
                  }
                  this.draw.player.nArmsAniFrame = 0;
                  if(param1 == 2)
                  {
                     this.draw.player.bAttack = true;
                  }
               }
               else
               {
                  if(this.draw.player.nNotUseMaceIndex > Drawing.INITDATA)
                  {
                     if(this.draw.player.nNotUseMaceIndex == this.draw.player.EQUIPINVEN[param1])
                     {
                        ++this.draw.player.nNotUseMace;
                     }
                  }
                  if(this.draw.player.nUseMaceIndex > Drawing.INITDATA)
                  {
                     if(this.draw.player.nUseMaceIndex == this.draw.player.EQUIPINVEN[param1])
                     {
                        ++this.draw.player.nUseMaceNum;
                     }
                  }
                  this.draw.player.FIREBTN[param1] = true;
                  this.draw.player.nNowArms = this.draw.player.EQUIPINVEN[param1];
                  _loc2_ = 0;
                  while(_loc2_ < Player.MAX_ATTACK)
                  {
                     if(this.draw.player.ATTACKANI[_loc2_] == Drawing.INITDATA)
                     {
                        this.draw.player.ATTACKANI[_loc2_] = this.draw.player.nNowArms;
                        this.draw.player.ATTACKANI[_loc2_ + Player.MAX_ATTACK] = 0;
                        _loc3_ = _loc2_;
                        break;
                     }
                     _loc2_++;
                  }
                  this.setMaceAttack(param1,_loc3_);
                  this.draw.player.nMana -= this.getArmsChargeMana(this.draw.player.EQUIPINVEN[param1]);
                  this.draw.player.ARMSCHARGED[param1] = false;
                  this.draw.player.nArmsAniFrame = 0;
                  this.draw.player.bAttack = true;
                  if(this.draw.player.bMoveLeft)
                  {
                     this.draw.player.nMoveDirection = Drawing.MOVE_LEFT;
                     this.draw.player.bMoveLeft = false;
                     this.draw.player.bBgLeft = false;
                  }
                  else if(this.draw.player.bMoveRight)
                  {
                     this.draw.player.nMoveDirection = Drawing.MOVE_RIGHT;
                     this.draw.player.bMoveRight = false;
                     this.draw.player.bBgRight = false;
                  }
               }
            }
         }
      }
      
      public function fireDestinyArms(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         this.draw.player.EQUIPINVEN[_loc3_] = param1;
         this.draw.player.EQUIPINVEN[_loc3_ + Player.EQUIPINVEN_LEVELPOS] = (int(this.draw.player.nStage / 14) + this.draw.player.nChapter * 2) * 2;
         this.draw.player.nNowArms = this.draw.player.EQUIPINVEN[_loc3_];
         _loc2_ = 0;
         while(_loc2_ < Player.MAX_ATTACK)
         {
            if(this.draw.player.ATTACKANI[_loc2_] == Drawing.INITDATA)
            {
               this.draw.player.ATTACKANI[_loc2_] = this.draw.player.nNowArms;
               this.draw.player.ATTACKANI[_loc2_ + Player.MAX_ATTACK] = 0;
               _loc4_ = _loc2_;
               break;
            }
            _loc2_++;
         }
         this.setMaceAttack(_loc3_,_loc4_);
         this.draw.player.nArmsAniFrame = 0;
         this.draw.player.bAttack = true;
         if(this.draw.player.bMoveLeft)
         {
            this.draw.player.nMoveDirection = Drawing.MOVE_LEFT;
            this.draw.player.bMoveLeft = false;
         }
         else if(this.draw.player.bMoveRight)
         {
            this.draw.player.nMoveDirection = Drawing.MOVE_RIGHT;
            this.draw.player.bMoveRight = false;
         }
      }
      
      public function setWarRoadAttack(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         switch(this.draw.player.EQUIPINVEN[param1])
         {
            case Drawing.ATTACK_VERTICAL:
               _loc3_ = 0;
               while(_loc3_ < Drawing.MAX_UNITKIND)
               {
                  if(!this.draw.player.UNITEQUIP[_loc3_])
                  {
                     break;
                  }
                  _loc4_++;
                  _loc3_++;
               }
               _loc3_ = 0;
               while(_loc3_ < Player.NUM_WARROAD)
               {
                  _loc5_ = this.draw.lib.getRand(_loc4_);
                  this.draw.player.nWarRoadUnitPos = _loc3_;
                  this.appearNextUnit(_loc5_,true,false);
                  _loc3_++;
               }
               this.draw.player.nWarRoadUnitPos = Drawing.INITDATA;
               this.draw.lib.playEffect(84);
               break;
            case Drawing.ATTACK_HORIZON:
               _loc3_ = 0;
               while(_loc3_ < Drawing.MAX_UNITKIND)
               {
                  if(!this.draw.player.UNITEQUIP[_loc3_])
                  {
                     break;
                  }
                  _loc4_++;
                  _loc3_++;
               }
               _loc3_ = 0;
               while(_loc3_ < Player.NUM_WARROAD)
               {
                  this.draw.player.nSetWarRoadUnit = this.draw.lib.getRand(_loc4_);
                  this.draw.player.nAttackHorizonPosX = _loc3_;
                  this.appearNextUnit(this.draw.player.nSetWarRoadUnit,true,false);
                  _loc3_++;
               }
               this.draw.player.nAttackHorizonPosX = Drawing.INITDATA;
               this.draw.player.nMana -= this.getArmsChargeMana(this.draw.player.EQUIPINVEN[param1]);
               this.draw.player.ARMSCHARGED[param1] = false;
               this.draw.lib.playEffect(84);
               break;
            case Drawing.ATTACK_HEAL:
               this.draw.player.ATTACKPOSX[param2] = this.draw.player.nPosX;
               this.draw.player.ATTACKPOSY[param2] = this.draw.player.nPosY + 10;
               this.draw.player.ATTACKARMSEQUIPPOS[param2] = param1;
               _loc3_ = 0;
               while(_loc3_ < Drawing.MAX_UNITNUM)
               {
                  if(this.draw.UNIT[_loc3_].bAppear)
                  {
                     if(this.draw.UNIT[_loc3_].bAlive)
                     {
                        this.draw.UNIT[_loc3_].bHealing = true;
                        this.draw.UNIT[_loc3_].nHealingFrame = 0;
                        this.draw.UNIT[_loc3_].nHp = this.draw.UNIT[_loc3_].nMaxHp;
                     }
                  }
                  _loc3_++;
               }
               this.draw.lib.playEffect(54);
         }
      }
      
      public function equipMaceSnd(param1:int) : void
      {
         switch(this.draw.player.EQUIPINVEN[param1])
         {
            case Drawing.MACE_GODPUNCH:
               this.draw.lib.playEffect(49);
               break;
            case Drawing.MACE_HEAL:
               this.draw.lib.playEffect(54);
               break;
            case Drawing.MACE_TURNUNDEAD:
               this.draw.lib.playEffect(86);
               break;
            case Drawing.MACE_ICE:
               this.draw.lib.playEffect(94);
               break;
            case Drawing.MACE_LIGHT:
               this.draw.lib.playEffect(63);
               break;
            case Drawing.MACE_FIRE:
               this.draw.lib.playEffect(48);
               break;
            case Drawing.MACE_METEO:
               this.draw.lib.playEffect(66);
               break;
            case Drawing.MACE_WIND:
               this.draw.lib.playEffect(102);
               break;
            case Drawing.MACE_FOOD:
               this.draw.lib.playEffect(50);
               break;
            case Drawing.MACE_POISON:
               this.draw.lib.playEffect(55);
         }
      }
      
      public function setMaceAttack(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:Boolean = false;
         var _loc6_:int = int(this.draw.player.HEROSKILL[Player.SKILL_MACEMASTER]);
         switch(this.draw.player.EQUIPINVEN[param1])
         {
            case Drawing.MACE_GODPUNCH:
               this.draw.player.ATTACKPOSX[param2] = this.draw.player.nPosX;
               this.draw.player.ATTACKPOSY[param2] = this.draw.player.nPosY + 10;
               this.draw.player.SUBATTACKARMSPOSX[param2] = this.draw.player.nPosX + 10;
               this.draw.player.ATTACKARMSPOSX[param2] = this.draw.player.nPosX + Player.PALADOG_GODPUNCHPOSX;
               this.draw.player.ATTACKARMSPOSY[param2] = this.draw.player.nPosY + 10 - Player.PALADOG_GODPUNCHPOSY;
               this.draw.player.ATTACKARMSEQUIPPOS[param2] = param1;
               this.draw.player.ATTACKARMSNUM[param2] = 3 + int((this.draw.player.EQUIPINVEN[param1 + Player.EQUIPINVEN_LEVELPOS] + _loc6_) / 20);
               _loc4_ = 0;
               while(_loc4_ < Player.MAX_ATTACKENEMY)
               {
                  this.draw.player.ATTACKENEMY[param2 * Player.MAX_ATTACKENEMY + _loc4_] = Drawing.INITDATA;
                  _loc4_++;
               }
               this.draw.player.nAttackEnemyPos[param2] = 0;
               this.draw.lib.playEffect(49);
               break;
            case Drawing.MACE_HEAL:
               this.draw.player.ATTACKPOSX[param2] = this.draw.player.nPosX;
               this.draw.player.ATTACKPOSY[param2] = this.draw.player.nPosY + 10;
               this.draw.player.ATTACKARMSEQUIPPOS[param2] = param1;
               this.draw.player.nHp += 600 + 40 * (this.draw.player.EQUIPINVEN[param1 + Player.EQUIPINVEN_LEVELPOS] + _loc6_);
               if(this.draw.player.nHp >= this.playerHp())
               {
                  this.draw.player.nHp = this.playerHp();
               }
               _loc3_ = 0;
               while(_loc3_ < Drawing.MAX_UNITNUM)
               {
                  if(this.draw.UNIT[_loc3_].bAppear)
                  {
                     if(this.draw.UNIT[_loc3_].bAlive)
                     {
                        if(this.draw.UNIT[_loc3_].nPosX >= this.draw.player.nPosX - Player.MACE_HEAL_AREA && this.draw.UNIT[_loc3_].nPosX <= this.draw.player.nPosX + Player.MACE_HEAL_AREA)
                        {
                           this.draw.UNIT[_loc3_].bHealing = true;
                           this.draw.UNIT[_loc3_].nHealingFrame = 0;
                           this.draw.UNIT[_loc3_].nHp += 600 + 40 * (this.draw.player.EQUIPINVEN[param1 + Player.EQUIPINVEN_LEVELPOS] + _loc6_);
                           if(this.draw.UNIT[_loc3_].nHp >= this.draw.UNIT[_loc3_].nMaxHp * 20 / 100)
                           {
                              this.draw.UNIT[_loc3_].bWarningHp = false;
                           }
                           if(this.draw.UNIT[_loc3_].nHp >= this.draw.UNIT[_loc3_].nMaxHp)
                           {
                              this.draw.UNIT[_loc3_].nHp = this.draw.UNIT[_loc3_].nMaxHp;
                           }
                        }
                     }
                  }
                  _loc3_++;
               }
               this.draw.lib.playEffect(54);
               break;
            case Drawing.MACE_TURNUNDEAD:
               this.draw.player.ATTACKPOSX[param2] = this.draw.player.nPosX;
               this.draw.player.ATTACKPOSY[param2] = this.draw.player.nPosY + 10;
               this.draw.player.ATTACKARMSEQUIPPOS[param2] = param1;
               this.draw.player.bDarkBg = true;
               this.draw.player.nDarkBgFrame = 0;
               this.draw.lib.playEffect(86);
               break;
            case Drawing.MACE_ICE:
               this.draw.player.ATTACKPOSX[param2] = this.draw.player.nPosX;
               this.draw.player.ATTACKPOSY[param2] = this.draw.player.nPosY + 10;
               this.draw.player.SUBATTACKARMSPOSX[param2] = this.draw.player.nPosX + 10;
               this.draw.player.ATTACKARMSPOSX[param2] = this.draw.player.nPosX + Player.PALADOG_ICEPOSX;
               this.draw.player.ATTACKARMSPOSY[param2] = this.draw.player.nPosY + 10 - Player.PALADOG_ICEPOSY;
               this.draw.player.ATTACKARMSEQUIPPOS[param2] = param1;
               this.draw.player.ATTACKARMSNUM[param2] = 1;
               _loc4_ = 0;
               while(_loc4_ < Player.MAX_ATTACKENEMY)
               {
                  this.draw.player.ATTACKENEMY[param2 * Player.MAX_ATTACKENEMY + _loc4_] = Drawing.INITDATA;
                  _loc4_++;
               }
               this.draw.player.nAttackEnemyPos[param2] = 0;
               this.draw.lib.playEffect(94);
               break;
            case Drawing.MACE_LIGHT:
               _loc7_ = true;
               _loc5_ = this.draw.player.nPosX + Player.MACE_LIGHT_AREA;
               _loc3_ = 0;
               while(_loc3_ < Drawing.MAX_ENEMYNUM)
               {
                  if(this.draw.ENEMY[_loc3_].bAppear)
                  {
                     if(Boolean(this.draw.ENEMY[_loc3_].bAlive) && Boolean(!this.draw.ENEMY[_loc3_].bGhostMove) && !this.draw.ENEMY[_loc3_].bBabyGhostMove)
                     {
                        if(this.draw.ENEMY[_loc3_].nPosX >= this.draw.player.nPosX && this.draw.ENEMY[_loc3_].nPosX <= this.draw.player.nPosX + Player.MACE_LIGHT_AREA)
                        {
                           if(_loc7_)
                           {
                              _loc5_ = int(this.draw.ENEMY[_loc3_].nPosX);
                              _loc7_ = false;
                           }
                           else if(this.draw.lib.getRand(100) < 10)
                           {
                              _loc5_ = int(this.draw.ENEMY[_loc3_].nPosX);
                           }
                        }
                     }
                  }
                  _loc3_++;
               }
               this.draw.player.ATTACKPOSX[param2] = _loc5_;
               this.draw.player.ATTACKPOSY[param2] = this.draw.player.nPosY + 15;
               this.draw.player.ATTACKARMSEQUIPPOS[param2] = param1;
               this.draw.lib.playEffect(63);
               break;
            case Drawing.MACE_FIRE:
               this.draw.player.ATTACKPOSX[param2] = this.draw.player.nPosX;
               this.draw.player.ATTACKPOSY[param2] = this.draw.player.nPosY + 10;
               this.draw.player.ATTACKARMSEQUIPPOS[param2] = param1;
               this.draw.lib.playEffect(48);
               break;
            case Drawing.MACE_METEO:
               _loc5_ = this.draw.player.nPosX + Player.MACE_METEO_AREA;
               _loc3_ = 0;
               while(_loc3_ < Drawing.MAX_ENEMYNUM)
               {
                  if(this.draw.ENEMY[_loc3_].bAppear)
                  {
                     if(Boolean(this.draw.ENEMY[_loc3_].bAlive) && Boolean(!this.draw.ENEMY[_loc3_].bGhostMove) && !this.draw.ENEMY[_loc3_].bBabyGhostMove)
                     {
                        if(this.draw.ENEMY[_loc3_].nPosX >= this.draw.player.nPosX && this.draw.ENEMY[_loc3_].nPosX <= this.draw.player.nPosX + Player.MACE_METEO_AREA)
                        {
                           if(this.draw.ENEMY[_loc3_].nPosX + 40 <= _loc5_)
                           {
                              _loc5_ = this.draw.ENEMY[_loc3_].nPosX + 40;
                           }
                        }
                     }
                  }
                  _loc3_++;
               }
               this.draw.player.ATTACKPOSX[param2] = _loc5_;
               this.draw.player.ATTACKPOSY[param2] = this.draw.player.nPosY + 10;
               this.draw.player.ATTACKARMSEQUIPPOS[param2] = param1;
               this.draw.lib.playEffect(66);
               break;
            case Drawing.MACE_WIND:
               this.draw.player.ATTACKPOSX[param2] = this.draw.player.nPosX;
               this.draw.player.ATTACKPOSY[param2] = this.draw.player.nPosY + 10;
               this.draw.player.ATTACKARMSEQUIPPOS[param2] = param1;
               this.draw.lib.playEffect(102);
               break;
            case Drawing.MACE_FOOD:
               this.draw.player.ATTACKPOSX[param2] = this.draw.player.nPosX;
               this.draw.player.ATTACKPOSY[param2] = this.draw.player.nPosY + 10;
               this.draw.player.ATTACKARMSEQUIPPOS[param2] = param1;
               this.draw.player.nFood += 4 + 0.3 * (this.draw.player.EQUIPINVEN[param1 + Player.EQUIPINVEN_LEVELPOS] + _loc6_);
               if(this.draw.player.nFood >= this.playerFood())
               {
                  this.draw.player.nFood = this.playerFood();
               }
               this.draw.lib.playEffect(50);
               break;
            case Drawing.MACE_POISON:
               this.draw.player.ATTACKPOSX[param2] = this.draw.player.nPosX;
               this.draw.player.ATTACKPOSY[param2] = this.draw.player.nPosY + 10;
               this.draw.player.SUBATTACKARMSPOSX[param2] = this.draw.player.nPosX + 10;
               this.draw.player.ATTACKARMSPOSX[param2] = this.draw.player.nPosX + Player.PALADOG_POISONPOSX;
               this.draw.player.ATTACKARMSPOSY[param2] = this.draw.player.nPosY + 10 - Player.PALADOG_POISONPOSY;
               this.draw.player.ATTACKARMSEQUIPPOS[param2] = param1;
               this.draw.player.ATTACKARMSNUM[param2] = 1;
               _loc4_ = 0;
               while(_loc4_ < Player.MAX_ATTACKENEMY)
               {
                  this.draw.player.ATTACKENEMY[param2 * Player.MAX_ATTACKENEMY + _loc4_] = Drawing.INITDATA;
                  _loc4_++;
               }
               this.draw.player.nAttackEnemyPos[param2] = 0;
               this.draw.lib.playEffect(55);
         }
      }
      
      public function enemyDmgFromUnit(param1:int, param2:Boolean, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc15_:Boolean = false;
         var _loc16_:Boolean = false;
         var _loc8_:Number = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = false;
         switch(this.draw.UNIT[param1].nType)
         {
            case Drawing.UNIT_MOUSE:
               _loc13_ = false;
               _loc14_ = false;
               _loc8_ = Number(this.draw.UNIT[param1].nAttack);
               _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
               _loc11_ = int(this.draw.UNIT[param1].nAttackNum);
               if(this.draw.UNIT[param1].bSkillAtk)
               {
                  _loc8_ *= this.draw.UNIT[param1].nSkillAttack;
                  _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
                  _loc11_ = int(this.draw.UNIT[param1].nSkillAttackNum);
               }
               if(this.draw.UNIT[param1].bInAura)
               {
                  if(this.draw.UNIT[param1].nHp < this.draw.UNIT[param1].nMaxHp * 0.3)
                  {
                     _loc8_ = _loc8_ * (1 + this.draw.player.HEROSKILL[Player.SKILL_ATKAURA] * 0.3) * (1 + this.draw.player.HEROSKILL[Player.SKILL_BERSERKERAURA]);
                  }
                  else
                  {
                     _loc8_ *= 1 + this.draw.player.HEROSKILL[Player.SKILL_ATKAURA] * 0.3;
                  }
               }
               if(this.draw.UNIT[param1].nAttackEnemy > Drawing.INITDATA)
               {
                  _loc4_ = int(this.draw.UNIT[param1].nAttackEnemy);
                  if(_loc4_ == Drawing.ENEMYSTATIONPOS)
                  {
                     if(this.draw.UNIT[param1].nPosX + _loc9_ >= this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS)
                     {
                        this.draw.lib.playEffect(56);
                        this.enemyStationDmg(_loc8_);
                     }
                  }
                  else if(this.draw.ENEMY[_loc4_].bAppear)
                  {
                     if(Boolean(this.draw.ENEMY[_loc4_].bAlive && !this.draw.ENEMY[_loc4_].bGhostMove) && Boolean(!this.draw.ENEMY[_loc4_].bBabyGhostMove) && this.draw.ENEMY[_loc4_].nBaseType != Drawing.ENEMY_BOSSPALADOG)
                     {
                        if(this.draw.ENEMY[_loc4_].nPosX >= this.draw.UNIT[param1].nPosX - this.draw.ENEMY[_loc4_].nAttackedLen && this.draw.ENEMY[_loc4_].nPosX <= this.draw.UNIT[param1].nPosX + _loc9_ + this.draw.ENEMY[_loc4_].nAttackedLen)
                        {
                           if(this.draw.ENEMY[_loc4_].bDefense)
                           {
                              this.draw.lib.playEffect(59);
                           }
                           else
                           {
                              this.draw.lib.playEffect(56);
                           }
                           _loc12_ = false;
                           if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                           {
                              if(this.draw.ENEMY[_loc4_].nPosY == this.draw.UNIT[param1].nPosY)
                              {
                                 _loc12_ = true;
                              }
                           }
                           else
                           {
                              _loc12_ = true;
                           }
                           if(_loc12_)
                           {
                              this.setAttacked(Player.ENEMYATTACKED,_loc4_,param1);
                              this.draw.ENEMY[_loc4_].nHp -= _loc8_;
                              if(this.draw.ENEMY[_loc4_].nHp <= 0)
                              {
                                 this.draw.ENEMY[_loc4_].nHp = 0;
                                 this.draw.ENEMY[_loc4_].bAlive = false;
                                 this.draw.ENEMY[_loc4_].bMove = false;
                                 this.draw.ENEMY[_loc4_].bIce = false;
                                 this.draw.ENEMY[_loc4_].bPoison = false;
                                 this.draw.ENEMY[_loc4_].bDieAni = true;
                                 this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                 this.getEnemyPoint(_loc4_,false);
                              }
                              else if(this.draw.UNIT[param1].bSkillAtk)
                              {
                                 if(this.draw.lib.getRand(100) < this.draw.UNIT[param1].nSkillKnockDownChance)
                                 {
                                    if(this.notKnockBackEnemy(_loc4_,true))
                                    {
                                       this.draw.ENEMY[_loc4_].bAttack = false;
                                       this.draw.ENEMY[_loc4_].nAttackUnit = Drawing.INITDATA;
                                       this.draw.ENEMY[_loc4_].nAtkFrame = 0;
                                       this.draw.ENEMY[_loc4_].bMove = false;
                                       this.draw.ENEMY[_loc4_].bKnockDown = true;
                                       this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                       this.draw.ENEMY[_loc4_].nKnockDownAniFrame = 0;
                                       this.draw.lib.playEffect(57);
                                    }
                                 }
                                 else if(this.notKnockBackEnemy(_loc4_,false))
                                 {
                                    this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                                 }
                              }
                              else if(this.notKnockBackEnemy(_loc4_,false))
                              {
                                 this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                              }
                              if(++_loc10_ >= _loc11_)
                              {
                                 break;
                              }
                           }
                        }
                     }
                  }
               }
               break;
            case Drawing.UNIT_RABBIT:
               if(param2)
               {
                  _loc13_ = false;
                  _loc14_ = false;
                  _loc8_ = Number(this.draw.UNIT[param1].nAttack);
                  _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
                  if(this.draw.UNIT[param1].ATTACKANI[param3] == Unit.SKILL_ATTACK)
                  {
                     _loc8_ *= this.draw.UNIT[param1].nSkillAttack;
                     _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
                  }
                  if(this.draw.UNIT[param1].bInAura)
                  {
                     if(this.draw.UNIT[param1].nHp < this.draw.UNIT[param1].nMaxHp * 0.3)
                     {
                        _loc8_ = _loc8_ * (1 + this.draw.player.HEROSKILL[Player.SKILL_ATKAURA] * 0.3) * (1 + this.draw.player.HEROSKILL[Player.SKILL_BERSERKERAURA]);
                     }
                     else
                     {
                        _loc8_ *= 1 + this.draw.player.HEROSKILL[Player.SKILL_ATKAURA] * 0.3;
                     }
                  }
                  _loc4_ = 0;
                  while(_loc4_ < Drawing.MAX_ENEMYNUM)
                  {
                     if(this.draw.ENEMY[_loc4_].bAppear)
                     {
                        if(Boolean(this.draw.ENEMY[_loc4_].bAlive && !this.draw.ENEMY[_loc4_].bGhostMove) && Boolean(!this.draw.ENEMY[_loc4_].bBabyGhostMove) && this.draw.ENEMY[_loc4_].nBaseType != Drawing.ENEMY_BOSSPALADOG)
                        {
                           if(this.unitAlreadyAttackEnemy(param1,param3,_loc4_) && this.draw.ENEMY[_loc4_].nPosX >= this.draw.UNIT[param1].SUBATTACKARMSPOSX[param3] - this.draw.ENEMY[_loc4_].nAttackedLen && this.draw.ENEMY[_loc4_].nPosX <= this.draw.UNIT[param1].ATTACKARMSPOSX[param3] + this.draw.ENEMY[_loc4_].nAttackedLen)
                           {
                              if(this.draw.ENEMY[_loc4_].bDefense)
                              {
                                 this.draw.lib.playEffect(59);
                              }
                              else
                              {
                                 this.draw.lib.playEffect(56);
                              }
                              _loc12_ = false;
                              if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                              {
                                 if(this.draw.ENEMY[_loc4_].nPosY == this.draw.UNIT[param1].nPosY)
                                 {
                                    _loc12_ = true;
                                 }
                              }
                              else
                              {
                                 _loc12_ = true;
                              }
                              if(_loc12_)
                              {
                                 this.setAttacked(Player.ENEMYATTACKED,_loc4_,param1);
                                 this.draw.ENEMY[_loc4_].nHp -= _loc8_;
                                 if(this.draw.ENEMY[_loc4_].nHp <= 0)
                                 {
                                    this.draw.ENEMY[_loc4_].nHp = 0;
                                    this.draw.ENEMY[_loc4_].bAlive = false;
                                    this.draw.ENEMY[_loc4_].bMove = false;
                                    this.draw.ENEMY[_loc4_].bIce = false;
                                    this.draw.ENEMY[_loc4_].bPoison = false;
                                    this.draw.ENEMY[_loc4_].bDieAni = true;
                                    this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                    this.getEnemyPoint(_loc4_,false);
                                 }
                                 else if(this.draw.UNIT[param1].ATTACKANI[param3] == Unit.SKILL_ATTACK)
                                 {
                                    if(this.draw.lib.getRand(100) < this.draw.UNIT[param1].nSkillKnockDownChance)
                                    {
                                       if(this.notKnockBackEnemy(_loc4_,true))
                                       {
                                          this.draw.ENEMY[_loc4_].bAttack = false;
                                          this.draw.ENEMY[_loc4_].nAttackUnit = Drawing.INITDATA;
                                          this.draw.ENEMY[_loc4_].nAtkFrame = 0;
                                          this.draw.ENEMY[_loc4_].bMove = false;
                                          this.draw.ENEMY[_loc4_].bKnockDown = true;
                                          this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                          this.draw.ENEMY[_loc4_].nKnockDownAniFrame = 0;
                                          this.draw.lib.playEffect(57);
                                       }
                                    }
                                    else if(this.notKnockBackEnemy(_loc4_,false))
                                    {
                                       this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                                    }
                                 }
                                 else if(this.notKnockBackEnemy(_loc4_,false))
                                 {
                                    this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                                 }
                                 this.draw.UNIT[param1].ATTACKENEMY[param3 * Unit.MAX_ATTACKENEMY + this.draw.UNIT[param1].nAttackEnemyPos[param3]] = _loc4_;
                                 ++this.draw.UNIT[param1].nAttackEnemyPos[param3];
                                 --this.draw.UNIT[param1].ATTACKARMSNUM[param3];
                                 if(this.draw.UNIT[param1].ATTACKARMSNUM[param3] <= 0)
                                 {
                                    this.draw.UNIT[param1].ATTACKARMSPOSX[param3] = Drawing.INITDATA;
                                    break;
                                 }
                              }
                           }
                        }
                     }
                     _loc4_++;
                  }
                  if(this.draw.player.nGameMode != Drawing.MODE_WAGON)
                  {
                     if(this.draw.UNIT[param1].ATTACKARMSNUM[param3] > 0)
                     {
                        if(this.unitAlreadyAttackEnemy(param1,param3,Drawing.ENEMYSTATION_POS) && this.draw.UNIT[param1].ATTACKARMSPOSX[param3] >= this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS)
                        {
                           this.draw.lib.playEffect(56);
                           this.draw.UNIT[param1].ATTACKENEMY[param3 * Unit.MAX_ATTACKENEMY + this.draw.UNIT[param1].nAttackEnemyPos[param3]] = Drawing.ENEMYSTATION_POS;
                           ++this.draw.UNIT[param1].nAttackEnemyPos[param3];
                           --this.draw.UNIT[param1].ATTACKARMSNUM[param3];
                           if(this.draw.UNIT[param1].ATTACKARMSNUM[param3] <= 0)
                           {
                              this.draw.UNIT[param1].ATTACKARMSPOSX[param3] = Drawing.INITDATA;
                           }
                           this.enemyStationDmg(_loc8_);
                        }
                     }
                  }
               }
               else
               {
                  _loc8_ = Number(this.draw.UNIT[param1].nAttack);
                  _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
                  _loc11_ = int(this.draw.UNIT[param1].nAttackNum);
                  if(this.draw.UNIT[param1].bSkillAtk)
                  {
                     _loc8_ *= this.draw.UNIT[param1].nSkillAttack;
                     _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
                     _loc11_ = int(this.draw.UNIT[param1].nSkillAttackNum);
                  }
                  _loc4_ = 0;
                  while(_loc4_ < Unit.MAX_UNITATTACK)
                  {
                     if(this.draw.UNIT[param1].ATTACKANI[_loc4_] == Drawing.INITDATA)
                     {
                        if(this.draw.UNIT[param1].bSkillAtk)
                        {
                           this.draw.UNIT[param1].ATTACKANI[_loc4_] = Unit.SKILL_ATTACK;
                        }
                        else
                        {
                           this.draw.UNIT[param1].ATTACKANI[_loc4_] = Unit.NORMAL_ATTACK;
                        }
                        this.draw.UNIT[param1].ATTACKANI[_loc4_ + Unit.MAX_UNITATTACK] = 0;
                        _loc7_ = _loc4_;
                        break;
                     }
                     _loc4_++;
                  }
                  this.draw.UNIT[param1].ATTACKPOSX[_loc7_] = this.draw.UNIT[param1].nPosX;
                  this.draw.UNIT[param1].ATTACKPOSY[_loc7_] = this.draw.UNIT[param1].nPosY + 10;
                  this.draw.UNIT[param1].SUBATTACKARMSPOSX[_loc7_] = this.draw.UNIT[param1].nPosX;
                  if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                  {
                     this.draw.UNIT[param1].ATTACKARMSPOSX[_loc7_] = this.draw.UNIT[param1].nPosX + (Player.RABBIT_ARMSPOSX >> 1);
                     this.draw.UNIT[param1].ATTACKARMSPOSY[_loc7_] = this.draw.UNIT[param1].nPosY + 10 - (Player.RABBIT_ARMSPOSY >> 1);
                  }
                  else
                  {
                     this.draw.UNIT[param1].ATTACKARMSPOSX[_loc7_] = this.draw.UNIT[param1].nPosX + Player.RABBIT_ARMSPOSX;
                     this.draw.UNIT[param1].ATTACKARMSPOSY[_loc7_] = this.draw.UNIT[param1].nPosY + 10 - Player.RABBIT_ARMSPOSY;
                  }
                  this.draw.UNIT[param1].ATTACKARMSNUM[_loc7_] = _loc11_;
                  _loc6_ = 0;
                  while(_loc6_ < Unit.MAX_ATTACKENEMY)
                  {
                     this.draw.UNIT[param1].ATTACKENEMY[_loc7_ * Unit.MAX_ATTACKENEMY + _loc6_] = Drawing.INITDATA;
                     _loc6_++;
                  }
                  this.draw.UNIT[param1].nAttackEnemyPos[_loc7_] = 0;
                  if(this.draw.UNIT[param1].bSkillAtk)
                  {
                     this.draw.lib.playEffect(89);
                  }
                  else
                  {
                     this.draw.lib.playEffect(1);
                  }
               }
               break;
            case Drawing.UNIT_BEAR:
               _loc13_ = false;
               _loc14_ = false;
               _loc8_ = Number(this.draw.UNIT[param1].nAttack);
               _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
               _loc11_ = int(this.draw.UNIT[param1].nAttackNum);
               if(this.draw.UNIT[param1].bSkillAtk)
               {
                  _loc8_ *= this.draw.UNIT[param1].nSkillAttack;
                  _loc9_ = int(this.draw.UNIT[param1].nSkillAttackLen);
                  _loc11_ = int(this.draw.UNIT[param1].nSkillAttackNum);
               }
               if(this.draw.UNIT[param1].bInAura)
               {
                  if(this.draw.UNIT[param1].nHp < this.draw.UNIT[param1].nMaxHp * 0.3)
                  {
                     _loc8_ = _loc8_ * (1 + this.draw.player.HEROSKILL[Player.SKILL_ATKAURA] * 0.3) * (1 + this.draw.player.HEROSKILL[Player.SKILL_BERSERKERAURA]);
                  }
                  else
                  {
                     _loc8_ *= 1 + this.draw.player.HEROSKILL[Player.SKILL_ATKAURA] * 0.3;
                  }
               }
               if(this.draw.UNIT[param1].bSkillAtk)
               {
                  if(_loc10_ < _loc11_)
                  {
                     if(this.draw.UNIT[param1].nPosX + _loc9_ >= this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS)
                     {
                        this.draw.lib.playEffect(56);
                        this.enemyStationDmg(_loc8_);
                        _loc10_++;
                     }
                  }
                  _loc4_ = 0;
                  while(_loc4_ < Drawing.MAX_ENEMYNUM)
                  {
                     if(this.draw.ENEMY[_loc4_].bAppear)
                     {
                        if(Boolean(this.draw.ENEMY[_loc4_].bAlive && !this.draw.ENEMY[_loc4_].bGhostMove) && Boolean(!this.draw.ENEMY[_loc4_].bBabyGhostMove) && this.draw.ENEMY[_loc4_].nBaseType != Drawing.ENEMY_BOSSPALADOG)
                        {
                           if(this.draw.ENEMY[_loc4_].nPosX >= this.draw.UNIT[param1].nPosX - this.draw.ENEMY[_loc4_].nAttackedLen && this.draw.ENEMY[_loc4_].nPosX <= this.draw.UNIT[param1].nPosX + _loc9_ + this.draw.ENEMY[_loc4_].nAttackedLen)
                           {
                              if(this.draw.ENEMY[_loc4_].bDefense)
                              {
                                 this.draw.lib.playEffect(59);
                              }
                              else
                              {
                                 this.draw.lib.playEffect(56);
                              }
                              _loc12_ = false;
                              if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                              {
                                 if(this.draw.ENEMY[_loc4_].nPosY == this.draw.UNIT[param1].nPosY)
                                 {
                                    _loc12_ = true;
                                 }
                              }
                              else
                              {
                                 _loc12_ = true;
                              }
                              if(_loc12_)
                              {
                                 this.setAttacked(Player.ENEMYATTACKED,_loc4_,param1);
                                 this.draw.ENEMY[_loc4_].nHp -= _loc8_;
                                 if(this.draw.ENEMY[_loc4_].nHp <= 0)
                                 {
                                    this.draw.ENEMY[_loc4_].nHp = 0;
                                    this.draw.ENEMY[_loc4_].bAlive = false;
                                    this.draw.ENEMY[_loc4_].bMove = false;
                                    this.draw.ENEMY[_loc4_].bIce = false;
                                    this.draw.ENEMY[_loc4_].bPoison = false;
                                    this.draw.ENEMY[_loc4_].bDieAni = true;
                                    this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                    this.getEnemyPoint(_loc4_,false);
                                 }
                                 else if(this.draw.UNIT[param1].bSkillAtk)
                                 {
                                    if(this.draw.lib.getRand(100) < this.draw.UNIT[param1].nSkillKnockDownChance)
                                    {
                                       if(this.notKnockBackEnemy(_loc4_,true))
                                       {
                                          this.draw.ENEMY[_loc4_].bAttack = false;
                                          this.draw.ENEMY[_loc4_].nAttackUnit = Drawing.INITDATA;
                                          this.draw.ENEMY[_loc4_].nAtkFrame = 0;
                                          this.draw.ENEMY[_loc4_].bMove = false;
                                          this.draw.ENEMY[_loc4_].bKnockDown = true;
                                          this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                          this.draw.ENEMY[_loc4_].nKnockDownAniFrame = 0;
                                          this.draw.lib.playEffect(57);
                                       }
                                    }
                                    else if(this.notKnockBackEnemy(_loc4_,false))
                                    {
                                       this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                                    }
                                 }
                                 else if(this.notKnockBackEnemy(_loc4_,false))
                                 {
                                    this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                                 }
                                 if(++_loc10_ >= _loc11_)
                                 {
                                    break;
                                 }
                              }
                           }
                        }
                     }
                     _loc4_++;
                  }
               }
               else if(this.draw.UNIT[param1].nAttackEnemy > Drawing.INITDATA)
               {
                  _loc4_ = int(this.draw.UNIT[param1].nAttackEnemy);
                  if(_loc4_ == Drawing.ENEMYSTATIONPOS)
                  {
                     if(this.draw.UNIT[param1].nPosX + _loc9_ >= this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS)
                     {
                        this.draw.lib.playEffect(56);
                        this.enemyStationDmg(_loc8_);
                     }
                  }
                  else if(this.draw.ENEMY[_loc4_].bAppear)
                  {
                     if(Boolean(this.draw.ENEMY[_loc4_].bAlive && !this.draw.ENEMY[_loc4_].bGhostMove) && Boolean(!this.draw.ENEMY[_loc4_].bBabyGhostMove) && this.draw.ENEMY[_loc4_].nBaseType != Drawing.ENEMY_BOSSPALADOG)
                     {
                        if(this.draw.ENEMY[_loc4_].nPosX >= this.draw.UNIT[param1].nPosX - this.draw.ENEMY[_loc4_].nAttackedLen && this.draw.ENEMY[_loc4_].nPosX <= this.draw.UNIT[param1].nPosX + _loc9_ + this.draw.ENEMY[_loc4_].nAttackedLen)
                        {
                           if(this.draw.ENEMY[_loc4_].bDefense)
                           {
                              this.draw.lib.playEffect(59);
                           }
                           else
                           {
                              this.draw.lib.playEffect(56);
                           }
                           _loc12_ = false;
                           if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                           {
                              if(this.draw.ENEMY[_loc4_].nPosY == this.draw.UNIT[param1].nPosY)
                              {
                                 _loc12_ = true;
                              }
                           }
                           else
                           {
                              _loc12_ = true;
                           }
                           if(_loc12_)
                           {
                              this.setAttacked(Player.ENEMYATTACKED,_loc4_,param1);
                              this.draw.ENEMY[_loc4_].nHp -= _loc8_;
                              if(this.draw.ENEMY[_loc4_].nHp <= 0)
                              {
                                 this.draw.ENEMY[_loc4_].nHp = 0;
                                 this.draw.ENEMY[_loc4_].bAlive = false;
                                 this.draw.ENEMY[_loc4_].bMove = false;
                                 this.draw.ENEMY[_loc4_].bIce = false;
                                 this.draw.ENEMY[_loc4_].bPoison = false;
                                 this.draw.ENEMY[_loc4_].bDieAni = true;
                                 this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                 this.getEnemyPoint(_loc4_,false);
                              }
                              else if(this.draw.UNIT[param1].bSkillAtk)
                              {
                                 if(this.draw.lib.getRand(100) < this.draw.UNIT[param1].nSkillKnockDownChance)
                                 {
                                    if(this.notKnockBackEnemy(_loc4_,true))
                                    {
                                       this.draw.ENEMY[_loc4_].bAttack = false;
                                       this.draw.ENEMY[_loc4_].nAttackUnit = Drawing.INITDATA;
                                       this.draw.ENEMY[_loc4_].nAtkFrame = 0;
                                       this.draw.ENEMY[_loc4_].bMove = false;
                                       this.draw.ENEMY[_loc4_].bKnockDown = true;
                                       this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                       this.draw.ENEMY[_loc4_].nKnockDownAniFrame = 0;
                                       this.draw.lib.playEffect(57);
                                    }
                                 }
                                 else if(this.notKnockBackEnemy(_loc4_,false))
                                 {
                                    this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                                 }
                              }
                              else if(this.notKnockBackEnemy(_loc4_,false))
                              {
                                 this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                              }
                              if(++_loc10_ >= _loc11_)
                              {
                                 break;
                              }
                           }
                        }
                     }
                  }
               }
               break;
            case Drawing.UNIT_KANGAROO:
               if(param2)
               {
                  _loc13_ = false;
                  _loc14_ = false;
                  _loc8_ = Number(this.draw.UNIT[param1].nAttack);
                  _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
                  if(this.draw.UNIT[param1].ATTACKANI[param3] == Unit.SKILL_ATTACK)
                  {
                     _loc8_ *= this.draw.UNIT[param1].nSkillAttack;
                     _loc9_ = int(this.draw.UNIT[param1].nSkillAttackLen);
                  }
                  if(this.draw.UNIT[param1].bInAura)
                  {
                     if(this.draw.UNIT[param1].nHp < this.draw.UNIT[param1].nMaxHp * 0.3)
                     {
                        _loc8_ = _loc8_ * (1 + this.draw.player.HEROSKILL[Player.SKILL_ATKAURA] * 0.3) * (1 + this.draw.player.HEROSKILL[Player.SKILL_BERSERKERAURA]);
                     }
                     else
                     {
                        _loc8_ *= 1 + this.draw.player.HEROSKILL[Player.SKILL_ATKAURA] * 0.3;
                     }
                  }
                  _loc4_ = 0;
                  while(_loc4_ < Drawing.MAX_ENEMYNUM)
                  {
                     if(this.draw.ENEMY[_loc4_].bAppear)
                     {
                        if(Boolean(this.draw.ENEMY[_loc4_].bAlive && !this.draw.ENEMY[_loc4_].bGhostMove) && Boolean(!this.draw.ENEMY[_loc4_].bBabyGhostMove) && this.draw.ENEMY[_loc4_].nBaseType != Drawing.ENEMY_BOSSPALADOG)
                        {
                           if(this.unitAlreadyAttackEnemy(param1,param3,_loc4_) && this.draw.ENEMY[_loc4_].nPosX >= this.draw.UNIT[param1].SUBATTACKARMSPOSX[param3] - this.draw.ENEMY[_loc4_].nAttackedLen && this.draw.ENEMY[_loc4_].nPosX <= this.draw.UNIT[param1].ATTACKARMSPOSX[param3] + this.draw.ENEMY[_loc4_].nAttackedLen)
                           {
                              if(this.draw.ENEMY[_loc4_].bDefense)
                              {
                                 this.draw.lib.playEffect(59);
                              }
                              else
                              {
                                 this.draw.lib.playEffect(56);
                              }
                              this.setAttacked(Player.ENEMYATTACKED,_loc4_,param1);
                              this.draw.ENEMY[_loc4_].nHp -= _loc8_;
                              if(this.draw.ENEMY[_loc4_].nHp <= 0)
                              {
                                 this.draw.ENEMY[_loc4_].nHp = 0;
                                 this.draw.ENEMY[_loc4_].bAlive = false;
                                 this.draw.ENEMY[_loc4_].bMove = false;
                                 this.draw.ENEMY[_loc4_].bIce = false;
                                 this.draw.ENEMY[_loc4_].bPoison = false;
                                 this.draw.ENEMY[_loc4_].bDieAni = true;
                                 this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                 this.getEnemyPoint(_loc4_,false);
                              }
                              else if(this.draw.lib.getRand(100) < this.draw.UNIT[param1].nSkillKnockDownChance)
                              {
                                 if(this.notKnockBackEnemy(_loc4_,true))
                                 {
                                    this.draw.ENEMY[_loc4_].bAttack = false;
                                    this.draw.ENEMY[_loc4_].nAttackUnit = Drawing.INITDATA;
                                    this.draw.ENEMY[_loc4_].nAtkFrame = 0;
                                    this.draw.ENEMY[_loc4_].bMove = false;
                                    this.draw.ENEMY[_loc4_].bKnockDown = true;
                                    this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                    this.draw.ENEMY[_loc4_].nKnockDownAniFrame = 0;
                                    this.draw.lib.playEffect(57);
                                 }
                              }
                              else if(this.notKnockBackEnemy(_loc4_,false))
                              {
                                 this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                              }
                              this.draw.UNIT[param1].ATTACKENEMY[param3 * Unit.MAX_ATTACKENEMY + this.draw.UNIT[param1].nAttackEnemyPos[param3]] = _loc4_;
                              ++this.draw.UNIT[param1].nAttackEnemyPos[param3];
                              --this.draw.UNIT[param1].ATTACKARMSNUM[param3];
                              if(this.draw.UNIT[param1].ATTACKARMSNUM[param3] <= 0)
                              {
                                 this.draw.UNIT[param1].ATTACKARMSPOSX[param3] = Drawing.INITDATA;
                                 break;
                              }
                           }
                        }
                     }
                     _loc4_++;
                  }
                  if(this.draw.player.nGameMode != Drawing.MODE_WAGON)
                  {
                     if(this.draw.UNIT[param1].ATTACKARMSNUM[param3] > 0)
                     {
                        if(this.unitAlreadyAttackEnemy(param1,param3,Drawing.ENEMYSTATION_POS) && this.draw.UNIT[param1].ATTACKARMSPOSX[param3] >= this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS)
                        {
                           this.draw.lib.playEffect(56);
                           this.draw.UNIT[param1].ATTACKENEMY[param3 * Unit.MAX_ATTACKENEMY + this.draw.UNIT[param1].nAttackEnemyPos[param3]] = Drawing.ENEMYSTATION_POS;
                           ++this.draw.UNIT[param1].nAttackEnemyPos[param3];
                           --this.draw.UNIT[param1].ATTACKARMSNUM[param3];
                           if(this.draw.UNIT[param1].ATTACKARMSNUM[param3] <= 0)
                           {
                              this.draw.UNIT[param1].ATTACKARMSPOSX[param3] = Drawing.INITDATA;
                           }
                           this.enemyStationDmg(_loc8_);
                        }
                     }
                  }
               }
               else
               {
                  _loc13_ = false;
                  _loc14_ = false;
                  _loc8_ = Number(this.draw.UNIT[param1].nAttack);
                  _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
                  _loc11_ = int(this.draw.UNIT[param1].nAttackNum);
                  if(this.draw.UNIT[param1].bSkillAtk)
                  {
                     _loc8_ *= this.draw.UNIT[param1].nSkillAttack;
                     _loc9_ = int(this.draw.UNIT[param1].nSkillAttackLen);
                     _loc11_ = int(this.draw.UNIT[param1].nSkillAttackNum);
                  }
                  if(this.draw.UNIT[param1].bSkillAtk)
                  {
                     _loc4_ = 0;
                     while(_loc4_ < Unit.MAX_UNITATTACK)
                     {
                        if(this.draw.UNIT[param1].ATTACKANI[_loc4_] == Drawing.INITDATA)
                        {
                           if(this.draw.UNIT[param1].bSkillAtk)
                           {
                              this.draw.UNIT[param1].ATTACKANI[_loc4_] = Unit.SKILL_ATTACK;
                           }
                           else
                           {
                              this.draw.UNIT[param1].ATTACKANI[_loc4_] = Unit.NORMAL_ATTACK;
                           }
                           this.draw.UNIT[param1].ATTACKANI[_loc4_ + Unit.MAX_UNITATTACK] = 0;
                           _loc7_ = _loc4_;
                           break;
                        }
                        _loc4_++;
                     }
                     this.draw.UNIT[param1].ATTACKPOSX[_loc7_] = this.draw.UNIT[param1].nPosX;
                     this.draw.UNIT[param1].ATTACKPOSY[_loc7_] = this.draw.UNIT[param1].nPosY + 10;
                     this.draw.UNIT[param1].SUBATTACKARMSPOSX[_loc7_] = this.draw.UNIT[param1].nPosX;
                     if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                     {
                        this.draw.UNIT[param1].ATTACKARMSPOSX[_loc7_] = this.draw.UNIT[param1].nPosX + (Player.KANGAROO_ARMSPOSX >> 1);
                        this.draw.UNIT[param1].ATTACKARMSPOSY[_loc7_] = this.draw.UNIT[param1].nPosY + 10 - (Player.KANGAROO_ARMSPOSY - this.draw.lib.getRand(Player.KANGAROO_ARMSRANDPOSY + 1) >> 1) - 20;
                     }
                     else
                     {
                        this.draw.UNIT[param1].ATTACKARMSPOSX[_loc7_] = this.draw.UNIT[param1].nPosX + Player.KANGAROO_ARMSPOSX;
                        this.draw.UNIT[param1].ATTACKARMSPOSY[_loc7_] = this.draw.UNIT[param1].nPosY + 10 - (Player.KANGAROO_ARMSPOSY - this.draw.lib.getRand(Player.KANGAROO_ARMSRANDPOSY + 1)) - 40;
                     }
                     this.draw.UNIT[param1].ATTACKARMSNUM[_loc7_] = _loc11_;
                     _loc6_ = 0;
                     while(_loc6_ < Unit.MAX_ATTACKENEMY)
                     {
                        this.draw.UNIT[param1].ATTACKENEMY[_loc7_ * Unit.MAX_ATTACKENEMY + _loc6_] = Drawing.INITDATA;
                        _loc6_++;
                     }
                     this.draw.UNIT[param1].nAttackEnemyPos[_loc7_] = 0;
                  }
                  else if(this.draw.UNIT[param1].nAttackEnemy > Drawing.INITDATA)
                  {
                     _loc4_ = int(this.draw.UNIT[param1].nAttackEnemy);
                     if(_loc4_ == Drawing.ENEMYSTATIONPOS)
                     {
                        if(this.draw.UNIT[param1].nPosX + _loc9_ >= this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS)
                        {
                           this.draw.lib.playEffect(56);
                           this.enemyStationDmg(_loc8_);
                        }
                     }
                     else if(this.draw.ENEMY[_loc4_].bAppear)
                     {
                        if(Boolean(this.draw.ENEMY[_loc4_].bAlive && !this.draw.ENEMY[_loc4_].bGhostMove) && Boolean(!this.draw.ENEMY[_loc4_].bBabyGhostMove) && this.draw.ENEMY[_loc4_].nBaseType != Drawing.ENEMY_BOSSPALADOG)
                        {
                           if(this.draw.ENEMY[_loc4_].nPosX >= this.draw.UNIT[param1].nPosX - this.draw.ENEMY[_loc4_].nAttackedLen && this.draw.ENEMY[_loc4_].nPosX <= this.draw.UNIT[param1].nPosX + _loc9_ + this.draw.ENEMY[_loc4_].nAttackedLen)
                           {
                              if(this.draw.ENEMY[_loc4_].bDefense)
                              {
                                 this.draw.lib.playEffect(59);
                              }
                              else
                              {
                                 this.draw.lib.playEffect(56);
                              }
                              _loc12_ = false;
                              if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                              {
                                 if(this.draw.ENEMY[_loc4_].nPosY == this.draw.UNIT[param1].nPosY)
                                 {
                                    _loc12_ = true;
                                 }
                              }
                              else
                              {
                                 _loc12_ = true;
                              }
                              if(_loc12_)
                              {
                                 this.setAttacked(Player.ENEMYATTACKED,_loc4_,param1);
                                 this.draw.ENEMY[_loc4_].nHp -= _loc8_;
                                 if(this.draw.ENEMY[_loc4_].nHp <= 0)
                                 {
                                    this.draw.ENEMY[_loc4_].nHp = 0;
                                    this.draw.ENEMY[_loc4_].bAlive = false;
                                    this.draw.ENEMY[_loc4_].bMove = false;
                                    this.draw.ENEMY[_loc4_].bIce = false;
                                    this.draw.ENEMY[_loc4_].bPoison = false;
                                    this.draw.ENEMY[_loc4_].bDieAni = true;
                                    this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                    this.getEnemyPoint(_loc4_,false);
                                 }
                                 else if(this.notKnockBackEnemy(_loc4_,false))
                                 {
                                    this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                                 }
                                 if(++_loc10_ >= _loc11_)
                                 {
                                    break;
                                 }
                              }
                           }
                        }
                     }
                  }
               }
               break;
            case Drawing.UNIT_TURTLE:
               break;
            case Drawing.UNIT_MONKEY:
               if(param2)
               {
                  _loc13_ = false;
                  _loc14_ = false;
                  _loc8_ = Number(this.draw.UNIT[param1].nAttack);
                  _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
                  _loc9_ = 63;
                  _loc11_ = int(this.draw.UNIT[param1].nAttackNum);
                  if(this.draw.UNIT[param1].ATTACKANI[param3] == Unit.SKILL_ATTACK)
                  {
                     _loc8_ *= this.draw.UNIT[param1].nSkillAttack;
                     _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
                     _loc9_ = 94;
                     _loc11_ = int(this.draw.UNIT[param1].nSkillAttackNum);
                  }
                  if(this.draw.UNIT[param1].bInAura)
                  {
                     if(this.draw.UNIT[param1].nHp < this.draw.UNIT[param1].nMaxHp * 0.3)
                     {
                        _loc8_ = _loc8_ * (1 + this.draw.player.HEROSKILL[Player.SKILL_ATKAURA] * 0.3) * (1 + this.draw.player.HEROSKILL[Player.SKILL_BERSERKERAURA]);
                     }
                     else
                     {
                        _loc8_ *= 1 + this.draw.player.HEROSKILL[Player.SKILL_ATKAURA] * 0.3;
                     }
                  }
                  _loc4_ = 0;
                  while(_loc4_ < Drawing.MAX_ENEMYNUM)
                  {
                     if(this.draw.ENEMY[_loc4_].bAppear)
                     {
                        if(Boolean(this.draw.ENEMY[_loc4_].bAlive && !this.draw.ENEMY[_loc4_].bGhostMove) && Boolean(!this.draw.ENEMY[_loc4_].bBabyGhostMove) && this.draw.ENEMY[_loc4_].nBaseType != Drawing.ENEMY_BOSSPALADOG)
                        {
                           if(this.draw.ENEMY[_loc4_].nPosX >= this.draw.UNIT[param1].ATTACKARMSPOSX[param3] - this.draw.ENEMY[_loc4_].nAttackedLen - _loc9_ && this.draw.ENEMY[_loc4_].nPosX <= this.draw.UNIT[param1].ATTACKARMSPOSX[param3] + this.draw.ENEMY[_loc4_].nAttackedLen + _loc9_)
                           {
                              if(this.draw.ENEMY[_loc4_].bDefense)
                              {
                                 this.draw.lib.playEffect(59);
                              }
                              else
                              {
                                 this.draw.lib.playEffect(56);
                              }
                              _loc12_ = false;
                              if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                              {
                                 if(this.draw.ENEMY[_loc4_].nPosY == this.draw.UNIT[param1].nPosY)
                                 {
                                    _loc12_ = true;
                                 }
                              }
                              else
                              {
                                 _loc12_ = true;
                              }
                              if(_loc12_)
                              {
                                 this.setAttacked(Player.ENEMYATTACKED,_loc4_,param1);
                                 this.draw.ENEMY[_loc4_].nHp -= _loc8_;
                                 if(this.draw.ENEMY[_loc4_].nHp <= 0)
                                 {
                                    this.draw.ENEMY[_loc4_].nHp = 0;
                                    this.draw.ENEMY[_loc4_].bAlive = false;
                                    this.draw.ENEMY[_loc4_].bMove = false;
                                    this.draw.ENEMY[_loc4_].bIce = false;
                                    this.draw.ENEMY[_loc4_].bPoison = false;
                                    this.draw.ENEMY[_loc4_].bDieAni = true;
                                    this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                    this.getEnemyPoint(_loc4_,false);
                                 }
                                 else if(this.draw.UNIT[param1].ATTACKANI[param3] == Unit.SKILL_ATTACK)
                                 {
                                    if(this.draw.lib.getRand(100) < this.draw.UNIT[param1].nSkillKnockDownChance)
                                    {
                                       if(this.notKnockBackEnemy(_loc4_,true))
                                       {
                                          this.draw.ENEMY[_loc4_].bAttack = false;
                                          this.draw.ENEMY[_loc4_].nAttackUnit = Drawing.INITDATA;
                                          this.draw.ENEMY[_loc4_].nAtkFrame = 0;
                                          this.draw.ENEMY[_loc4_].bMove = false;
                                          this.draw.ENEMY[_loc4_].bKnockDown = true;
                                          this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                          this.draw.ENEMY[_loc4_].nKnockDownAniFrame = 0;
                                          this.draw.lib.playEffect(57);
                                       }
                                    }
                                    else if(this.notKnockBackEnemy(_loc4_,false))
                                    {
                                       this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                                    }
                                 }
                                 else if(this.notKnockBackEnemy(_loc4_,false))
                                 {
                                    this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                                 }
                                 if(++_loc10_ >= _loc11_)
                                 {
                                    break;
                                 }
                              }
                           }
                        }
                     }
                     _loc4_++;
                  }
                  if(_loc10_ < _loc11_)
                  {
                     if(this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS >= this.draw.UNIT[param1].ATTACKARMSPOSX[param3] - _loc9_ && this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS <= this.draw.UNIT[param1].ATTACKARMSPOSX[param3] + _loc9_)
                     {
                        this.draw.lib.playEffect(56);
                        this.enemyStationDmg(_loc8_);
                     }
                  }
               }
               else
               {
                  _loc8_ = Number(this.draw.UNIT[param1].nAttack);
                  _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
                  _loc11_ = int(this.draw.UNIT[param1].nAttackNum);
                  if(this.draw.UNIT[param1].bSkillAtk)
                  {
                     _loc8_ *= this.draw.UNIT[param1].nSkillAttack;
                     _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
                     _loc11_ = int(this.draw.UNIT[param1].nSkillAttackNum);
                  }
                  _loc4_ = 0;
                  while(_loc4_ < Unit.MAX_UNITATTACK)
                  {
                     if(this.draw.UNIT[param1].ATTACKANI[_loc4_] == Drawing.INITDATA)
                     {
                        if(this.draw.UNIT[param1].bSkillAtk)
                        {
                           this.draw.UNIT[param1].ATTACKANI[_loc4_] = Unit.SKILL_ATTACK;
                        }
                        else
                        {
                           this.draw.UNIT[param1].ATTACKANI[_loc4_] = Unit.NORMAL_ATTACK;
                        }
                        this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_] = Drawing.INITDATA;
                        _loc5_ = 0;
                        while(_loc5_ < Drawing.MAX_ENEMYNUM)
                        {
                           if(this.draw.ENEMY[_loc5_].bAppear)
                           {
                              if(Boolean(this.draw.ENEMY[_loc5_].bAlive && !this.draw.ENEMY[_loc4_].bGhostMove) && Boolean(!this.draw.ENEMY[_loc4_].bBabyGhostMove) && this.draw.ENEMY[_loc4_].nBaseType != Drawing.ENEMY_BOSSPALADOG)
                              {
                                 if(this.draw.ENEMY[_loc5_].nPosX >= this.draw.UNIT[param1].nPosX - this.draw.ENEMY[_loc4_].nAttackedLen && this.draw.ENEMY[_loc5_].nPosX <= this.draw.UNIT[param1].nPosX + this.draw.UNIT[param1].nBattleLen + this.draw.ENEMY[_loc5_].nAttackedLen)
                                 {
                                    if(this.draw.UNIT[param1].bSkillAtk)
                                    {
                                       if(this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_] <= Drawing.INITDATA)
                                       {
                                          this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_] = this.draw.ENEMY[_loc5_].nPosX + 79;
                                       }
                                       else if(this.draw.ENEMY[_loc5_].nPosX <= this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_])
                                       {
                                          this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_] = this.draw.ENEMY[_loc5_].nPosX + 79;
                                       }
                                    }
                                    else if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                                    {
                                       if(this.draw.ENEMY[_loc4_].nPosY == this.draw.UNIT[param1].nPosY)
                                       {
                                          if(this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_] <= Drawing.INITDATA)
                                          {
                                             this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_] = this.draw.ENEMY[_loc5_].nPosX + 23;
                                          }
                                          else if(this.draw.ENEMY[_loc5_].nPosX <= this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_])
                                          {
                                             this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_] = this.draw.ENEMY[_loc5_].nPosX + 23;
                                          }
                                       }
                                    }
                                    else if(this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_] <= Drawing.INITDATA)
                                    {
                                       this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_] = this.draw.ENEMY[_loc5_].nPosX + 47;
                                    }
                                    else if(this.draw.ENEMY[_loc5_].nPosX <= this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_])
                                    {
                                       this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_] = this.draw.ENEMY[_loc5_].nPosX + 47;
                                    }
                                 }
                              }
                           }
                           _loc5_++;
                        }
                        if(this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_] <= Drawing.INITDATA)
                        {
                           if(!this.draw.player.bStageClear)
                           {
                              if(this.draw.player.nGameMode != Drawing.MODE_WAGON && this.draw.player.nEnemyStationHp > 0)
                              {
                                 if(this.draw.UNIT[param1].nPosX + this.draw.UNIT[param1].nBattleLen >= this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS)
                                 {
                                    if(this.draw.UNIT[param1].bSkillAtk)
                                    {
                                       this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_] = this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS + 79;
                                    }
                                    else
                                    {
                                       this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_] = this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS + 47;
                                    }
                                 }
                              }
                           }
                        }
                        if(this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_] <= Drawing.INITDATA)
                        {
                           this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc4_] = this.draw.UNIT[param1].nPosX + this.draw.UNIT[param1].nBattleLen;
                        }
                        this.draw.UNIT[param1].ATTACKANI[_loc4_ + Unit.MAX_UNITATTACK] = 0;
                        _loc7_ = _loc4_;
                        break;
                     }
                     _loc4_++;
                  }
                  this.draw.UNIT[param1].ATTACKPOSX[_loc7_] = this.draw.UNIT[param1].nPosX;
                  this.draw.UNIT[param1].ATTACKPOSY[_loc7_] = this.draw.UNIT[param1].nPosY + 10;
                  this.draw.UNIT[param1].ATTACKARMSPOSX[_loc7_] = this.draw.UNIT[param1].nPosX;
                  this.draw.UNIT[param1].SUBATTACKARMSPOSX[_loc7_] = this.draw.UNIT[param1].nPosX;
                  this.draw.UNIT[param1].ATTACKARMSPOSY[_loc7_] = this.draw.UNIT[param1].nPosY + 10;
                  this.draw.UNIT[param1].ATTACKARRIVEPOS[_loc7_] -= this.draw.UNIT[param1].nPosX;
                  this.draw.UNIT[param1].ATTACKARMSNUM[_loc7_] = _loc11_;
                  _loc6_ = 0;
                  while(_loc6_ < Unit.MAX_ATTACKENEMY)
                  {
                     this.draw.UNIT[param1].ATTACKENEMY[_loc7_ * Unit.MAX_ATTACKENEMY + _loc6_] = Drawing.INITDATA;
                     _loc6_++;
                  }
                  this.draw.UNIT[param1].nAttackEnemyPos[_loc7_] = 0;
               }
               break;
            case Drawing.UNIT_RHINO:
               _loc13_ = false;
               _loc14_ = false;
               _loc8_ = Number(this.draw.UNIT[param1].nAttack);
               _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
               _loc11_ = int(this.draw.UNIT[param1].nAttackNum);
               if(this.draw.UNIT[param1].bSkillAtk)
               {
                  _loc8_ *= this.draw.UNIT[param1].nSkillAttack;
                  _loc9_ = int(this.draw.UNIT[param1].nSkillAttackLen);
                  _loc11_ = int(this.draw.UNIT[param1].nSkillAttackNum);
               }
               if(this.draw.UNIT[param1].bInAura)
               {
                  if(this.draw.UNIT[param1].nHp < this.draw.UNIT[param1].nMaxHp * 0.3)
                  {
                     _loc8_ = _loc8_ * (1 + this.draw.player.HEROSKILL[Player.SKILL_ATKAURA] * 0.3) * (1 + this.draw.player.HEROSKILL[Player.SKILL_BERSERKERAURA]);
                  }
                  else
                  {
                     _loc8_ *= 1 + this.draw.player.HEROSKILL[Player.SKILL_ATKAURA] * 0.3;
                  }
               }
               if(this.draw.UNIT[param1].nAttackEnemy > Drawing.INITDATA)
               {
                  _loc4_ = int(this.draw.UNIT[param1].nAttackEnemy);
                  if(_loc4_ == Drawing.ENEMYSTATIONPOS)
                  {
                     if(this.draw.UNIT[param1].nPosX + _loc9_ >= this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS)
                     {
                        this.draw.lib.playEffect(56);
                        this.enemyStationDmg(_loc8_);
                     }
                  }
                  else if(this.draw.ENEMY[_loc4_].bAppear)
                  {
                     if(Boolean(this.draw.ENEMY[_loc4_].bAlive && !this.draw.ENEMY[_loc4_].bGhostMove) && Boolean(!this.draw.ENEMY[_loc4_].bBabyGhostMove) && this.draw.ENEMY[_loc4_].nBaseType != Drawing.ENEMY_BOSSPALADOG)
                     {
                        if(this.draw.ENEMY[_loc4_].nPosX >= this.draw.UNIT[param1].nPosX - this.draw.ENEMY[_loc4_].nAttackedLen && this.draw.ENEMY[_loc4_].nPosX <= this.draw.UNIT[param1].nPosX + _loc9_ + this.draw.ENEMY[_loc4_].nAttackedLen)
                        {
                           if(this.draw.ENEMY[_loc4_].bDefense)
                           {
                              this.draw.lib.playEffect(59);
                           }
                           else
                           {
                              this.draw.lib.playEffect(56);
                           }
                           _loc12_ = false;
                           if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                           {
                              if(this.draw.ENEMY[_loc4_].nPosY == this.draw.UNIT[param1].nPosY)
                              {
                                 _loc12_ = true;
                              }
                           }
                           else
                           {
                              _loc12_ = true;
                           }
                           if(_loc12_)
                           {
                              this.setAttacked(Player.ENEMYATTACKED,_loc4_,param1);
                              this.draw.ENEMY[_loc4_].nHp -= _loc8_;
                              if(this.draw.ENEMY[_loc4_].nHp <= 0)
                              {
                                 this.draw.ENEMY[_loc4_].nHp = 0;
                                 this.draw.ENEMY[_loc4_].bAlive = false;
                                 this.draw.ENEMY[_loc4_].bMove = false;
                                 this.draw.ENEMY[_loc4_].bIce = false;
                                 this.draw.ENEMY[_loc4_].bPoison = false;
                                 this.draw.ENEMY[_loc4_].bDieAni = true;
                                 this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                 this.getEnemyPoint(_loc4_,false);
                              }
                              else if(this.draw.UNIT[param1].bSkillAtk)
                              {
                                 if(this.draw.lib.getRand(100) < this.draw.UNIT[param1].nSkillKnockDownChance)
                                 {
                                    if(this.notKnockBackEnemy(_loc4_,true))
                                    {
                                       this.draw.ENEMY[_loc4_].bAttack = false;
                                       this.draw.ENEMY[_loc4_].nAttackUnit = Drawing.INITDATA;
                                       this.draw.ENEMY[_loc4_].nAtkFrame = 0;
                                       this.draw.ENEMY[_loc4_].bMove = false;
                                       this.draw.ENEMY[_loc4_].bKnockDown = true;
                                       this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                       this.draw.ENEMY[_loc4_].nKnockDownAniFrame = 0;
                                       this.draw.lib.playEffect(57);
                                    }
                                 }
                                 else if(this.notKnockBackEnemy(_loc4_,false))
                                 {
                                    this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                                 }
                              }
                              else if(this.notKnockBackEnemy(_loc4_,false))
                              {
                                 this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                              }
                              if(++_loc10_ >= _loc11_)
                              {
                                 break;
                              }
                           }
                        }
                     }
                  }
               }
               break;
            case Drawing.UNIT_PENGUIN:
               if(param2)
               {
                  _loc15_ = false;
                  _loc13_ = false;
                  _loc14_ = false;
                  _loc8_ = Number(this.draw.UNIT[param1].nAttack);
                  _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
                  if(this.draw.UNIT[param1].ATTACKANI[param3] == Unit.SKILL_ATTACK)
                  {
                     _loc8_ *= this.draw.UNIT[param1].nSkillAttack;
                     _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
                  }
                  if(this.draw.UNIT[param1].bInAura)
                  {
                     if(this.draw.UNIT[param1].nHp < this.draw.UNIT[param1].nMaxHp * 0.3)
                     {
                        _loc8_ = _loc8_ * (1 + this.draw.player.HEROSKILL[Player.SKILL_ATKAURA] * 0.3) * (1 + this.draw.player.HEROSKILL[Player.SKILL_BERSERKERAURA]);
                     }
                     else
                     {
                        _loc8_ *= 1 + this.draw.player.HEROSKILL[Player.SKILL_ATKAURA] * 0.3;
                     }
                  }
                  _loc4_ = 0;
                  while(_loc4_ < Drawing.MAX_ENEMYNUM)
                  {
                     if(this.draw.ENEMY[_loc4_].bAppear)
                     {
                        if(Boolean(this.draw.ENEMY[_loc4_].bAlive && !this.draw.ENEMY[_loc4_].bGhostMove) && Boolean(!this.draw.ENEMY[_loc4_].bBabyGhostMove) && this.draw.ENEMY[_loc4_].nBaseType != Drawing.ENEMY_BOSSPALADOG)
                        {
                           if(this.unitAlreadyAttackEnemy(param1,param3,_loc4_) && this.draw.ENEMY[_loc4_].nPosX >= this.draw.UNIT[param1].SUBATTACKARMSPOSX[param3] - this.draw.ENEMY[_loc4_].nAttackedLen && this.draw.ENEMY[_loc4_].nPosX <= this.draw.UNIT[param1].ATTACKARMSPOSX[param3] + this.draw.ENEMY[_loc4_].nAttackedLen)
                           {
                              if(this.draw.ENEMY[_loc4_].bDefense)
                              {
                                 this.draw.lib.playEffect(59);
                              }
                              else
                              {
                                 this.draw.lib.playEffect(56);
                              }
                              _loc12_ = false;
                              if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                              {
                                 if(this.draw.ENEMY[_loc4_].nPosY == this.draw.UNIT[param1].nPosY)
                                 {
                                    _loc12_ = true;
                                 }
                              }
                              else
                              {
                                 _loc12_ = true;
                              }
                              if(_loc12_)
                              {
                                 this.setAttacked(Player.ENEMYATTACKED,_loc4_,param1);
                                 this.draw.ENEMY[_loc4_].nHp -= _loc8_;
                                 if(this.draw.ENEMY[_loc4_].nHp <= 0)
                                 {
                                    this.draw.ENEMY[_loc4_].nHp = 0;
                                    this.draw.ENEMY[_loc4_].bAlive = false;
                                    this.draw.ENEMY[_loc4_].bMove = false;
                                    this.draw.ENEMY[_loc4_].bIce = false;
                                    this.draw.ENEMY[_loc4_].bPoison = false;
                                    this.draw.ENEMY[_loc4_].bDieAni = true;
                                    this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                    this.getEnemyPoint(_loc4_,false);
                                 }
                                 else if(!this.draw.ENEMY[_loc4_].bBoss)
                                 {
                                    if(this.draw.UNIT[param1].ATTACKANI[param3] == Unit.SKILL_ATTACK)
                                    {
                                       this.draw.ENEMY[_loc4_].bMove = false;
                                       if(this.draw.ENEMY[_loc4_].bIce)
                                       {
                                          if(this.notKnockBackEnemy(_loc4_,false))
                                          {
                                             this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                                          }
                                          this.draw.ENEMY[_loc4_].nIceStartTime = getTimer();
                                          this.draw.ENEMY[_loc4_].nIceTime = 2500;
                                       }
                                       else
                                       {
                                          if(this.notKnockBackEnemy(_loc4_,false))
                                          {
                                             this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                                          }
                                          this.draw.ENEMY[_loc4_].bIce = true;
                                          this.draw.ENEMY[_loc4_].nIceStartTime = getTimer();
                                          this.draw.ENEMY[_loc4_].nIceTime = 2500;
                                          this.draw.ENEMY[_loc4_].nIceAniFrame = 0;
                                       }
                                       this.draw.lib.playEffect(52);
                                    }
                                    else if(this.notKnockBackEnemy(_loc4_,false))
                                    {
                                       this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                                    }
                                 }
                                 this.draw.UNIT[param1].ATTACKENEMY[param3 * Unit.MAX_ATTACKENEMY + this.draw.UNIT[param1].nAttackEnemyPos[param3]] = _loc4_;
                                 ++this.draw.UNIT[param1].nAttackEnemyPos[param3];
                                 --this.draw.UNIT[param1].ATTACKARMSNUM[param3];
                                 if(this.draw.UNIT[param1].ATTACKARMSNUM[param3] <= 0)
                                 {
                                    this.draw.UNIT[param1].ATTACKARMSPOSX[param3] = Drawing.INITDATA;
                                    break;
                                 }
                              }
                           }
                        }
                     }
                     _loc4_++;
                  }
                  if(this.draw.player.nGameMode != Drawing.MODE_WAGON)
                  {
                     if(this.draw.UNIT[param1].ATTACKARMSNUM[param3] > 0)
                     {
                        if(this.draw.UNIT[param1].ATTACKARMSPOSX[param3] >= this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS)
                        {
                           this.draw.lib.playEffect(56);
                           --this.draw.UNIT[param1].ATTACKARMSNUM[param3];
                           if(this.draw.UNIT[param1].ATTACKARMSNUM[param3] <= 0)
                           {
                              this.draw.UNIT[param1].ATTACKARMSPOSX[param3] = Drawing.INITDATA;
                           }
                           this.enemyStationDmg(_loc8_);
                        }
                     }
                  }
               }
               else
               {
                  _loc8_ = Number(this.draw.UNIT[param1].nAttack);
                  _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
                  _loc11_ = int(this.draw.UNIT[param1].nAttackNum);
                  if(this.draw.UNIT[param1].bSkillAtk)
                  {
                     _loc8_ *= this.draw.UNIT[param1].nSkillAttack;
                     _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
                     _loc11_ = int(this.draw.UNIT[param1].nSkillAttackNum);
                  }
                  _loc4_ = 0;
                  while(_loc4_ < Unit.MAX_UNITATTACK)
                  {
                     if(this.draw.UNIT[param1].ATTACKANI[_loc4_] == Drawing.INITDATA)
                     {
                        if(this.draw.UNIT[param1].bSkillAtk)
                        {
                           this.draw.UNIT[param1].ATTACKANI[_loc4_] = Unit.SKILL_ATTACK;
                        }
                        else
                        {
                           this.draw.UNIT[param1].ATTACKANI[_loc4_] = Unit.NORMAL_ATTACK;
                        }
                        this.draw.UNIT[param1].ATTACKANI[_loc4_ + Unit.MAX_UNITATTACK] = 0;
                        _loc7_ = _loc4_;
                        break;
                     }
                     _loc4_++;
                  }
                  this.draw.UNIT[param1].ATTACKPOSX[_loc7_] = this.draw.UNIT[param1].nPosX;
                  this.draw.UNIT[param1].ATTACKPOSY[_loc7_] = this.draw.UNIT[param1].nPosY + 10;
                  this.draw.UNIT[param1].SUBATTACKARMSPOSX[_loc7_] = this.draw.UNIT[param1].nPosX;
                  if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                  {
                     this.draw.UNIT[param1].ATTACKARMSPOSX[_loc7_] = this.draw.UNIT[param1].nPosX + (Player.PENGUIN_ARMSPOSX >> 1);
                     this.draw.UNIT[param1].ATTACKARMSPOSY[_loc7_] = this.draw.UNIT[param1].nPosY + 10 - (Player.PENGUIN_ARMSPOSY >> 1);
                  }
                  else
                  {
                     this.draw.UNIT[param1].ATTACKARMSPOSX[_loc7_] = this.draw.UNIT[param1].nPosX + Player.PENGUIN_ARMSPOSX;
                     this.draw.UNIT[param1].ATTACKARMSPOSY[_loc7_] = this.draw.UNIT[param1].nPosY + 10 - Player.PENGUIN_ARMSPOSY;
                  }
                  this.draw.UNIT[param1].ATTACKARMSNUM[_loc7_] = _loc11_;
                  _loc6_ = 0;
                  while(_loc6_ < Unit.MAX_ATTACKENEMY)
                  {
                     this.draw.UNIT[param1].ATTACKENEMY[_loc7_ * Unit.MAX_ATTACKENEMY + _loc6_] = Drawing.INITDATA;
                     _loc6_++;
                  }
                  this.draw.UNIT[param1].nAttackEnemyPos[_loc7_] = 0;
               }
               break;
            case Drawing.UNIT_DRAGON:
               _loc16_ = false;
               _loc8_ = Number(this.draw.UNIT[param1].nAttack);
               _loc9_ = int(this.draw.UNIT[param1].nAttackLen);
               _loc11_ = int(this.draw.UNIT[param1].nAttackNum);
               if(this.draw.UNIT[param1].bSkillAtk)
               {
                  _loc8_ *= this.draw.UNIT[param1].nSkillAttack;
                  _loc9_ = int(this.draw.UNIT[param1].nSkillAttackLen);
                  _loc11_ = int(this.draw.UNIT[param1].nSkillAttackNum);
               }
               if(this.draw.UNIT[param1].bInAura)
               {
                  if(this.draw.UNIT[param1].nHp < this.draw.UNIT[param1].nMaxHp * 0.3)
                  {
                     _loc8_ = _loc8_ * (1 + this.draw.player.HEROSKILL[Player.SKILL_ATKAURA] * 0.3) * (1 + this.draw.player.HEROSKILL[Player.SKILL_BERSERKERAURA]);
                  }
                  else
                  {
                     _loc8_ *= 1 + this.draw.player.HEROSKILL[Player.SKILL_ATKAURA] * 0.3;
                  }
               }
               _loc4_ = 0;
               while(_loc4_ < Drawing.MAX_ENEMYNUM)
               {
                  if(this.draw.ENEMY[_loc4_].bAppear)
                  {
                     if(Boolean(this.draw.ENEMY[_loc4_].bAlive && !this.draw.ENEMY[_loc4_].bGhostMove) && Boolean(!this.draw.ENEMY[_loc4_].bBabyGhostMove) && this.draw.ENEMY[_loc4_].nBaseType != Drawing.ENEMY_BOSSPALADOG)
                     {
                        if(this.draw.ENEMY[_loc4_].nPosX >= this.draw.UNIT[param1].nPosX - this.draw.ENEMY[_loc4_].nAttackedLen && this.draw.ENEMY[_loc4_].nPosX <= this.draw.UNIT[param1].nPosX + _loc9_ + this.draw.ENEMY[_loc4_].nAttackedLen)
                        {
                           this.draw.lib.playEffect(14);
                           _loc12_ = false;
                           if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                           {
                              if(this.draw.ENEMY[_loc4_].nPosY == this.draw.UNIT[param1].nPosY)
                              {
                                 _loc12_ = true;
                              }
                           }
                           else
                           {
                              _loc12_ = true;
                           }
                           if(_loc12_)
                           {
                              this.setAttacked(Player.ENEMYATTACKED,_loc4_,param1);
                              this.draw.ENEMY[_loc4_].nHp -= _loc8_;
                              if(this.draw.ENEMY[_loc4_].nHp <= 0)
                              {
                                 this.draw.ENEMY[_loc4_].nHp = 0;
                                 this.draw.ENEMY[_loc4_].bAlive = false;
                                 this.draw.ENEMY[_loc4_].bMove = false;
                                 this.draw.ENEMY[_loc4_].bIce = false;
                                 this.draw.ENEMY[_loc4_].bPoison = false;
                                 this.draw.ENEMY[_loc4_].bDieAni = true;
                                 this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                 this.getEnemyPoint(_loc4_,false);
                              }
                              else
                              {
                                 if(this.draw.UNIT[param1].bSkillAtk)
                                 {
                                    if(this.draw.lib.getRand(100) < this.draw.UNIT[param1].nSkillKnockDownChance)
                                    {
                                       if(this.notKnockBackEnemy(_loc4_,true))
                                       {
                                          this.draw.ENEMY[_loc4_].bAttack = false;
                                          this.draw.ENEMY[_loc4_].nAttackUnit = Drawing.INITDATA;
                                          this.draw.ENEMY[_loc4_].nAtkFrame = 0;
                                          this.draw.ENEMY[_loc4_].bMove = false;
                                          this.draw.ENEMY[_loc4_].bKnockDown = true;
                                          this.draw.ENEMY[_loc4_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                          this.draw.ENEMY[_loc4_].nKnockDownAniFrame = 0;
                                          this.draw.lib.playEffect(57);
                                       }
                                    }
                                    else if(this.notKnockBackEnemy(_loc4_,false))
                                    {
                                       this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                                    }
                                 }
                                 else if(this.notKnockBackEnemy(_loc4_,false))
                                 {
                                    this.enemyKnockBack(_loc4_,Player.KNOCKBACKWIDTH);
                                 }
                                 _loc5_ = 0;
                                 while(_loc5_ < Enemy.MAX_DMG)
                                 {
                                    if(this.draw.ENEMY[_loc4_].DMGKIND[_loc5_] == Drawing.INITDATA)
                                    {
                                       this.draw.ENEMY[_loc4_].DMGKIND[_loc5_] = Drawing.MACE_FIRE;
                                       this.draw.ENEMY[_loc4_].DMGPOSX[_loc5_] = this.draw.ENEMY[_loc4_].nPosX;
                                       this.draw.ENEMY[_loc4_].DMGPOSY[_loc5_] = this.draw.ENEMY[_loc4_].nPosY + 10;
                                       this.draw.ENEMY[_loc4_].DMGANIFRAME[_loc5_] = 0;
                                       break;
                                    }
                                    _loc5_++;
                                 }
                              }
                              if(++_loc10_ >= _loc11_)
                              {
                                 break;
                              }
                           }
                        }
                     }
                  }
                  _loc4_++;
               }
               if(_loc10_ < _loc11_)
               {
                  if(this.draw.UNIT[param1].nPosX + _loc9_ >= this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS)
                  {
                     this.draw.lib.playEffect(14);
                     this.enemyStationDmg(_loc8_);
                  }
               }
         }
      }
      
      public function setGameOver() : void
      {
         this.unitAllDie();
         this.draw.lib.stopMusic();
         this.draw.lib.playEffect(30);
         this.draw.lib.playMusic(Library.MUSIC_FAIL,false);
         this.draw.bKeyPressed = true;
         this.draw.player.nHp = 0;
         this.draw.player.nPaladogDieFrame = 0;
         this.resetMouseDrag();
         this.moveDiePos(this.draw.nLcdWC - this.draw.player.nPosX);
         this.draw.nGameScene = Player.PALADOGDIESCENE;
      }
      
      public function moveDiePos(param1:int) : void
      {
         if(param1 > 0)
         {
            this.draw.player.nPlayerDieWidth = param1 / Player.PALADOGDIETOTALFRAME;
            this.draw.player.nBgDieWidth = (Player.PALADOG_DIEKNOCKDOWNDISTANCE + param1) / Player.PALADOGDIETOTALFRAME;
         }
         else if(param1 < 0)
         {
            this.draw.player.nPlayerDieWidth = param1 / Player.PALADOGDIETOTALFRAME;
            this.draw.player.nBgDieWidth = (Player.PALADOG_DIEKNOCKDOWNDISTANCE + param1) / Player.PALADOGDIETOTALFRAME;
         }
         else
         {
            this.draw.player.nPlayerDieWidth = 0;
            this.draw.player.nBgDieWidth = Player.PALADOG_DIEKNOCKDOWNDISTANCE / Player.PALADOGDIETOTALFRAME;
         }
      }
      
      public function dmgFromEnemy(param1:int, param2:Boolean, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:Boolean = false;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:Boolean = false;
         var _loc18_:int = 0;
         _loc6_ = Drawing.INITDATA;
         _loc7_ = 0;
         _loc8_ = 0;
         _loc9_ = 0;
         _loc10_ = 0;
         _loc11_ = 0;
         _loc12_ = false;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = false;
         switch(this.draw.ENEMY[param1].nBaseType)
         {
            case Drawing.ENEMY_ZOMBIE:
            case Drawing.ENEMY_WITCH:
            case Drawing.ENEMY_DEVIL:
            case Drawing.ENEMY_RINGGHOST:
            case Drawing.ENEMY_MUMMY:
            case Drawing.ENEMY_FRANKEN:
            case Drawing.ENEMY_KNIGHTSKELETON:
            case Drawing.ENEMY_MINERZOMBIE:
            case Drawing.ENEMY_ONEEYEDPERSON:
            case Drawing.ENEMY_ARMORAXE:
            case Drawing.ENEMY_LANCEZOMBIE:
            case Drawing.ENEMY_BOSSSOCCER:
               _loc13_ = false;
               _loc14_ = false;
               _loc7_ = int(this.draw.ENEMY[param1].nAttack);
               _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
               _loc10_ = int(this.draw.ENEMY[param1].nAttackNum);
               if(this.draw.ENEMY[param1].nAttackUnit > Drawing.INITDATA)
               {
                  _loc4_ = int(this.draw.ENEMY[param1].nAttackUnit);
                  if(_loc4_ == Drawing.HEROPOS)
                  {
                     if(this.draw.player.nGameMode != Drawing.MODE_WARROAD)
                     {
                        if(this.draw.player.nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - Player.PALADOGDMGWIDTH && this.draw.player.nPosX <= this.draw.ENEMY[param1].nPosX)
                        {
                           this.draw.lib.playEffect(56);
                           this.paladogDmg(_loc7_,false);
                        }
                     }
                  }
                  else if(this.draw.UNIT[_loc4_].bAppear)
                  {
                     if(this.draw.UNIT[_loc4_].bAlive)
                     {
                        if(this.draw.UNIT[_loc4_].bWagon)
                        {
                           if(this.draw.ENEMY[param1].nPosX - _loc8_ >= this.draw.UNIT[_loc4_].nPosX - 50 && this.draw.ENEMY[param1].nPosX - _loc8_ <= this.draw.UNIT[_loc4_].nPosX + Player.WAGONDMGWIDTH || this.draw.ENEMY[param1].nPosX >= this.draw.UNIT[_loc4_].nPosX - 50 && this.draw.ENEMY[param1].nPosX <= this.draw.UNIT[_loc4_].nPosX + Player.WAGONDMGWIDTH)
                           {
                              this.draw.lib.playEffect(56);
                              _loc11_ = _loc7_;
                              if(this.draw.UNIT[_loc4_].bInAura)
                              {
                                 _loc11_ = _loc7_ * (1 - this.draw.player.HEROSKILL[Player.SKILL_DEFAURA] / 10);
                              }
                              this.setAttacked(Player.UNITATTACKED,_loc4_,param1);
                              this.draw.UNIT[_loc4_].nHp -= _loc11_;
                              if(this.draw.UNIT[_loc4_].nHp <= 0)
                              {
                                 this.draw.UNIT[_loc4_].nHp = 0;
                                 this.draw.UNIT[_loc4_].bAlive = false;
                                 this.draw.UNIT[_loc4_].bMove = false;
                                 this.draw.UNIT[_loc4_].bIce = false;
                                 this.draw.UNIT[_loc4_].bPoison = false;
                                 this.draw.UNIT[_loc4_].bDieAni = true;
                                 this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                                 this.setGameOver();
                              }
                           }
                        }
                        else if(this.draw.UNIT[_loc4_].nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - this.draw.UNIT[_loc4_].nAttackedLen && this.draw.UNIT[_loc4_].nPosX <= this.draw.ENEMY[param1].nPosX + this.draw.UNIT[_loc4_].nAttackedLen)
                        {
                           _loc11_ = _loc7_;
                           if(this.draw.UNIT[_loc4_].bInAura)
                           {
                              _loc11_ = _loc7_ * (1 - this.draw.player.HEROSKILL[Player.SKILL_DEFAURA] / 10);
                           }
                           if(this.draw.UNIT[_loc4_].bDefense)
                           {
                              this.draw.lib.playEffect(59);
                              _loc11_ >>= 1;
                           }
                           else
                           {
                              this.draw.lib.playEffect(56);
                           }
                           this.setAttacked(Player.UNITATTACKED,_loc4_,param1);
                           this.draw.UNIT[_loc4_].nHp -= _loc11_;
                           if(this.draw.UNIT[_loc4_].nHp <= 0)
                           {
                              this.draw.UNIT[_loc4_].nHp = 0;
                              this.draw.UNIT[_loc4_].bAlive = false;
                              this.draw.UNIT[_loc4_].bMove = false;
                              this.draw.UNIT[_loc4_].bIce = false;
                              this.draw.UNIT[_loc4_].bPoison = false;
                              this.draw.UNIT[_loc4_].bDieAni = true;
                              if(this.draw.ENEMY[param1].nBaseType == Drawing.ENEMY_BOSSSOCCER)
                              {
                                 this.draw.UNIT[_loc4_].nKnockDownDistance = Player.BOSS_KNOCKDOWNDISTANCE;
                              }
                              else
                              {
                                 this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                              }
                              ++this.draw.player.nUnitDieNum;
                           }
                           else if(this.draw.ENEMY[param1].nBaseType == Drawing.ENEMY_BOSSSOCCER)
                           {
                              this.draw.UNIT[_loc4_].bAttack = false;
                              this.draw.UNIT[_loc4_].nAttackEnemy = Drawing.INITDATA;
                              this.draw.UNIT[_loc4_].nAtkFrame = 0;
                              this.draw.UNIT[_loc4_].bMove = false;
                              this.draw.UNIT[_loc4_].bKnockDown = true;
                              this.draw.UNIT[_loc4_].nKnockDownDistance = Player.BOSS_KNOCKDOWNDISTANCE;
                              this.draw.UNIT[_loc4_].nKnockDownAniFrame = 0;
                              this.draw.lib.playEffect(57);
                           }
                           else if(this.draw.UNIT[_loc4_].nHp < this.draw.UNIT[_loc4_].nMaxHp * 20 / 100 && !this.draw.UNIT[_loc4_].bWarningHp)
                           {
                              this.draw.UNIT[_loc4_].bAttack = false;
                              this.draw.UNIT[_loc4_].nAttackEnemy = Drawing.INITDATA;
                              this.draw.UNIT[_loc4_].nAtkFrame = 0;
                              this.draw.UNIT[_loc4_].bMove = false;
                              this.draw.UNIT[_loc4_].bKnockDown = true;
                              this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                              this.draw.UNIT[_loc4_].nKnockDownAniFrame = 0;
                              this.draw.UNIT[_loc4_].bWarningHp = true;
                              this.draw.lib.playEffect(57);
                           }
                           else if(this.draw.UNIT[_loc4_].nType != Drawing.UNIT_TURTLE)
                           {
                              this.draw.UNIT[_loc4_].nPosX -= Player.KNOCKBACKWIDTH;
                           }
                        }
                     }
                  }
               }
               break;
            case Drawing.ENEMY_WOMANSKELETON:
            case Drawing.ENEMY_MANSKELETON:
            case Drawing.ENEMY_ONEEYEDMONSTER:
               if(param2)
               {
                  _loc14_ = false;
                  _loc13_ = false;
                  _loc7_ = int(this.draw.ENEMY[param1].nAttack);
                  _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
                  _loc4_ = 0;
                  while(_loc4_ < Drawing.MAX_UNITNUM)
                  {
                     if(this.draw.UNIT[_loc4_].bAppear)
                     {
                        if(this.draw.UNIT[_loc4_].bAlive)
                        {
                           if(this.draw.UNIT[_loc4_].bWagon)
                           {
                              if(this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] >= this.draw.UNIT[_loc4_].nPosX - 50 && this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] <= this.draw.UNIT[_loc4_].nPosX + Player.WAGONDMGWIDTH || this.draw.ENEMY[param1].SUBATTACKARMSPOSX[param3] >= this.draw.UNIT[_loc4_].nPosX - 50 && this.draw.ENEMY[param1].SUBATTACKARMSPOSX[param3] <= this.draw.UNIT[_loc4_].nPosX + Player.WAGONDMGWIDTH)
                              {
                                 this.draw.lib.playEffect(56);
                                 _loc11_ = _loc7_;
                                 if(this.draw.UNIT[_loc4_].bInAura)
                                 {
                                    _loc11_ = _loc7_ * (1 - this.draw.player.HEROSKILL[Player.SKILL_DEFAURA] / 10);
                                 }
                                 this.setAttacked(Player.UNITATTACKED,_loc4_,param1);
                                 this.draw.UNIT[_loc4_].nHp -= _loc11_;
                                 if(this.draw.UNIT[_loc4_].nHp <= 0)
                                 {
                                    this.draw.UNIT[_loc4_].nHp = 0;
                                    this.draw.UNIT[_loc4_].bAlive = false;
                                    this.draw.UNIT[_loc4_].bMove = false;
                                    this.draw.UNIT[_loc4_].bIce = false;
                                    this.draw.UNIT[_loc4_].bPoison = false;
                                    this.draw.UNIT[_loc4_].bDieAni = true;
                                    this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                                    this.setGameOver();
                                 }
                                 --this.draw.ENEMY[param1].ATTACKARMSNUM[param3];
                                 if(this.draw.ENEMY[param1].ATTACKARMSNUM[param3] <= 0)
                                 {
                                    this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] = Drawing.INITDATA;
                                    break;
                                 }
                              }
                           }
                           else if(this.draw.UNIT[_loc4_].nPosX >= this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] - this.draw.UNIT[_loc4_].nAttackedLen && this.draw.UNIT[_loc4_].nPosX <= this.draw.ENEMY[param1].SUBATTACKARMSPOSX[param3] + this.draw.UNIT[_loc4_].nAttackedLen)
                           {
                              _loc12_ = false;
                              if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                              {
                                 if(this.draw.UNIT[_loc4_].nPosY == this.draw.ENEMY[param1].nPosY)
                                 {
                                    _loc12_ = true;
                                 }
                              }
                              else
                              {
                                 _loc12_ = true;
                              }
                              if(_loc12_)
                              {
                                 _loc11_ = _loc7_;
                                 if(this.draw.UNIT[_loc4_].bInAura)
                                 {
                                    _loc11_ = _loc7_ * (1 - this.draw.player.HEROSKILL[Player.SKILL_DEFAURA] / 10);
                                 }
                                 if(this.draw.UNIT[_loc4_].bDefense)
                                 {
                                    this.draw.lib.playEffect(59);
                                    _loc11_ >>= 1;
                                 }
                                 else
                                 {
                                    this.draw.lib.playEffect(56);
                                 }
                                 this.setAttacked(Player.UNITATTACKED,_loc4_,param1);
                                 this.draw.UNIT[_loc4_].nHp -= _loc11_;
                                 if(this.draw.UNIT[_loc4_].nHp <= 0)
                                 {
                                    this.draw.UNIT[_loc4_].nHp = 0;
                                    this.draw.UNIT[_loc4_].bAlive = false;
                                    this.draw.UNIT[_loc4_].bMove = false;
                                    this.draw.UNIT[_loc4_].bIce = false;
                                    this.draw.UNIT[_loc4_].bPoison = false;
                                    this.draw.UNIT[_loc4_].bDieAni = true;
                                    this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                                    ++this.draw.player.nUnitDieNum;
                                 }
                                 else if(this.draw.UNIT[_loc4_].nHp < this.draw.UNIT[_loc4_].nMaxHp * 20 / 100 && !this.draw.UNIT[_loc4_].bWarningHp)
                                 {
                                    this.draw.UNIT[_loc4_].bAttack = false;
                                    this.draw.UNIT[_loc4_].nAttackEnemy = Drawing.INITDATA;
                                    this.draw.UNIT[_loc4_].nAtkFrame = 0;
                                    this.draw.UNIT[_loc4_].bMove = false;
                                    this.draw.UNIT[_loc4_].bKnockDown = true;
                                    this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                                    this.draw.UNIT[_loc4_].nKnockDownAniFrame = 0;
                                    this.draw.UNIT[_loc4_].bWarningHp = true;
                                    this.draw.lib.playEffect(57);
                                 }
                                 else if(this.draw.UNIT[_loc4_].nType != Drawing.UNIT_TURTLE)
                                 {
                                    this.draw.UNIT[_loc4_].nPosX -= Player.KNOCKBACKWIDTH;
                                 }
                                 --this.draw.ENEMY[param1].ATTACKARMSNUM[param3];
                                 if(this.draw.ENEMY[param1].ATTACKARMSNUM[param3] <= 0)
                                 {
                                    this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] = Drawing.INITDATA;
                                    break;
                                 }
                              }
                           }
                        }
                     }
                     _loc4_++;
                  }
                  if(this.draw.ENEMY[param1].ATTACKARMSNUM[param3] > 0)
                  {
                     if(this.draw.player.nGameMode != Drawing.MODE_WARROAD)
                     {
                        if(this.draw.player.nPosX >= this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] - Player.PALADOGDMGWIDTH && this.draw.player.nPosX <= this.draw.ENEMY[param1].SUBATTACKARMSPOSX[param3])
                        {
                           this.draw.lib.playEffect(56);
                           this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] = Drawing.INITDATA;
                           this.paladogDmg(_loc7_,false);
                        }
                     }
                  }
               }
               else
               {
                  _loc7_ = int(this.draw.ENEMY[param1].nAttack);
                  _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
                  _loc10_ = int(this.draw.ENEMY[param1].nAttackNum);
                  _loc4_ = 0;
                  while(_loc4_ < Enemy.MAX_ENEMYATTACK)
                  {
                     if(this.draw.ENEMY[param1].ATTACKANI[_loc4_] == Drawing.INITDATA)
                     {
                        this.draw.ENEMY[param1].ATTACKANI[_loc4_] = Enemy.NORMAL_ATTACK;
                        this.draw.ENEMY[param1].ATTACKANI[_loc4_ + Enemy.MAX_ENEMYATTACK] = 0;
                        _loc6_ = _loc4_;
                        break;
                     }
                     _loc4_++;
                  }
                  if(_loc6_ > Drawing.INITDATA)
                  {
                     this.draw.ENEMY[param1].ATTACKPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX;
                     this.draw.ENEMY[param1].ATTACKPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10;
                     if(this.draw.ENEMY[param1].nBaseType == Drawing.ENEMY_ONEEYEDMONSTER)
                     {
                        this.draw.ENEMY[param1].SUBATTACKARMSPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX;
                        if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                        {
                           this.draw.ENEMY[param1].ATTACKARMSPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX - (Player.ONEEYEDMONSTER_ARMSPOSX >> 1);
                           this.draw.ENEMY[param1].ATTACKARMSPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10 - (Player.ONEEYEDMONSTER_ARMSPOSY >> 1);
                        }
                        else
                        {
                           this.draw.ENEMY[param1].ATTACKARMSPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX - Player.ONEEYEDMONSTER_ARMSPOSX;
                           this.draw.ENEMY[param1].ATTACKARMSPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10 - Player.ONEEYEDMONSTER_ARMSPOSY;
                        }
                     }
                     else
                     {
                        this.draw.ENEMY[param1].SUBATTACKARMSPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX;
                        if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                        {
                           if(this.draw.ENEMY[param1].nBaseType == Drawing.ENEMY_WOMANSKELETON)
                           {
                              this.draw.ENEMY[param1].ATTACKARMSPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX - (Player.WOMANSKELETON_ARMSPOSX >> 1);
                              this.draw.ENEMY[param1].ATTACKARMSPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10 - (Player.WOMANSKELETON_ARMSPOSY >> 1);
                           }
                           else
                           {
                              this.draw.ENEMY[param1].ATTACKARMSPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX - (Player.MANSKELETON_ARMSPOSX >> 1);
                              this.draw.ENEMY[param1].ATTACKARMSPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10 - (Player.MANSKELETON_ARMSPOSY >> 1);
                           }
                        }
                        else if(this.draw.ENEMY[param1].nBaseType == Drawing.ENEMY_WOMANSKELETON)
                        {
                           this.draw.ENEMY[param1].ATTACKARMSPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX - Player.WOMANSKELETON_ARMSPOSX;
                           this.draw.ENEMY[param1].ATTACKARMSPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10 - Player.WOMANSKELETON_ARMSPOSY;
                        }
                        else
                        {
                           this.draw.ENEMY[param1].ATTACKARMSPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX - Player.MANSKELETON_ARMSPOSX;
                           this.draw.ENEMY[param1].ATTACKARMSPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10 - Player.MANSKELETON_ARMSPOSY;
                        }
                     }
                     this.draw.ENEMY[param1].ATTACKARMSNUM[_loc6_] = _loc10_;
                     this.draw.ENEMY[param1].ATTACKENEMY[_loc6_] = Drawing.INITDATA;
                     this.draw.lib.playEffect(65);
                  }
               }
               break;
            case Drawing.ENEMY_DARKZOMBIE:
               if(param2)
               {
                  _loc14_ = false;
                  _loc13_ = false;
                  _loc7_ = int(this.draw.ENEMY[param1].nAttack);
                  _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
                  _loc4_ = 0;
                  while(_loc4_ < Drawing.MAX_UNITNUM)
                  {
                     if(this.draw.UNIT[_loc4_].bAppear)
                     {
                        if(this.draw.UNIT[_loc4_].bAlive)
                        {
                           if(this.draw.UNIT[_loc4_].bWagon)
                           {
                              if(this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] - 40 >= this.draw.UNIT[_loc4_].nPosX - 50 && this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] - 40 <= this.draw.UNIT[_loc4_].nPosX + Player.WAGONDMGWIDTH || this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] + 40 >= this.draw.UNIT[_loc4_].nPosX - 50 && this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] + 40 <= this.draw.UNIT[_loc4_].nPosX + Player.WAGONDMGWIDTH)
                              {
                                 this.draw.lib.playEffect(56);
                                 _loc11_ = _loc7_;
                                 if(this.draw.UNIT[_loc4_].bInAura)
                                 {
                                    _loc11_ = _loc7_ * (1 - this.draw.player.HEROSKILL[Player.SKILL_DEFAURA] / 10);
                                 }
                                 this.setAttacked(Player.UNITATTACKED,_loc4_,param1);
                                 this.draw.UNIT[_loc4_].nHp -= _loc11_;
                                 if(this.draw.UNIT[_loc4_].nHp <= 0)
                                 {
                                    this.draw.UNIT[_loc4_].nHp = 0;
                                    this.draw.UNIT[_loc4_].bAlive = false;
                                    this.draw.UNIT[_loc4_].bMove = false;
                                    this.draw.UNIT[_loc4_].bIce = false;
                                    this.draw.UNIT[_loc4_].bPoison = false;
                                    this.draw.UNIT[_loc4_].bDieAni = true;
                                    this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                                    this.setGameOver();
                                 }
                                 _loc5_ = 0;
                                 while(_loc5_ < Unit.MAX_DMG)
                                 {
                                    if(this.draw.UNIT[_loc4_].DMGKIND[_loc5_] == Drawing.INITDATA)
                                    {
                                       if(this.draw.ENEMY[param1].nType == Drawing.ENEMY_DARKZOMBIE)
                                       {
                                          this.draw.UNIT[_loc4_].DMGKIND[_loc5_] = this.draw.ENEMY[param1].nType;
                                       }
                                       else
                                       {
                                          this.draw.UNIT[_loc4_].DMGKIND[_loc5_] = Drawing.ENEMY_DARKZOMBIE2;
                                       }
                                       this.draw.UNIT[_loc4_].DMGPOSX[_loc5_] = this.draw.UNIT[_loc4_].nPosX;
                                       this.draw.UNIT[_loc4_].DMGPOSY[_loc5_] = this.draw.UNIT[_loc4_].nPosY + 10;
                                       this.draw.UNIT[_loc4_].DMGANIFRAME[_loc5_] = 0;
                                       break;
                                    }
                                    _loc5_++;
                                 }
                                 --this.draw.ENEMY[param1].ATTACKARMSNUM[param3];
                                 if(this.draw.ENEMY[param1].ATTACKARMSNUM[param3] <= 0)
                                 {
                                    break;
                                 }
                              }
                           }
                           else if(this.draw.UNIT[_loc4_].nPosX >= this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] - 40 && this.draw.UNIT[_loc4_].nPosX <= this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] + 40)
                           {
                              _loc12_ = false;
                              if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                              {
                                 if(this.draw.UNIT[_loc4_].nPosY == this.draw.ENEMY[param1].nPosY)
                                 {
                                    _loc12_ = true;
                                 }
                              }
                              else
                              {
                                 _loc12_ = true;
                              }
                              if(_loc12_)
                              {
                                 _loc11_ = _loc7_;
                                 if(this.draw.UNIT[_loc4_].bInAura)
                                 {
                                    _loc11_ = _loc7_ * (1 - this.draw.player.HEROSKILL[Player.SKILL_DEFAURA] / 10);
                                 }
                                 if(this.draw.UNIT[_loc4_].bDefense)
                                 {
                                    this.draw.lib.playEffect(59);
                                    _loc11_ >>= 1;
                                 }
                                 else
                                 {
                                    this.draw.lib.playEffect(56);
                                 }
                                 this.setAttacked(Player.UNITATTACKED,_loc4_,param1);
                                 this.draw.UNIT[_loc4_].nHp -= _loc11_;
                                 if(this.draw.UNIT[_loc4_].nHp <= 0)
                                 {
                                    this.draw.UNIT[_loc4_].nHp = 0;
                                    this.draw.UNIT[_loc4_].bAlive = false;
                                    this.draw.UNIT[_loc4_].bMove = false;
                                    this.draw.UNIT[_loc4_].bIce = false;
                                    this.draw.UNIT[_loc4_].bPoison = false;
                                    this.draw.UNIT[_loc4_].bDieAni = true;
                                    this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                                    ++this.draw.player.nUnitDieNum;
                                 }
                                 else if(this.draw.UNIT[_loc4_].nHp < this.draw.UNIT[_loc4_].nMaxHp * 20 / 100 && !this.draw.UNIT[_loc4_].bWarningHp)
                                 {
                                    this.draw.UNIT[_loc4_].bAttack = false;
                                    this.draw.UNIT[_loc4_].nAttackEnemy = Drawing.INITDATA;
                                    this.draw.UNIT[_loc4_].nAtkFrame = 0;
                                    this.draw.UNIT[_loc4_].bMove = false;
                                    this.draw.UNIT[_loc4_].bKnockDown = true;
                                    this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                                    this.draw.UNIT[_loc4_].nKnockDownAniFrame = 0;
                                    this.draw.UNIT[_loc4_].bWarningHp = true;
                                    this.draw.lib.playEffect(57);
                                 }
                                 else if(this.draw.UNIT[_loc4_].nType != Drawing.UNIT_TURTLE)
                                 {
                                    this.draw.UNIT[_loc4_].nPosX -= Player.KNOCKBACKWIDTH;
                                 }
                                 _loc5_ = 0;
                                 while(_loc5_ < Unit.MAX_DMG)
                                 {
                                    if(this.draw.UNIT[_loc4_].DMGKIND[_loc5_] == Drawing.INITDATA)
                                    {
                                       if(this.draw.ENEMY[param1].nType == Drawing.ENEMY_DARKZOMBIE)
                                       {
                                          this.draw.UNIT[_loc4_].DMGKIND[_loc5_] = this.draw.ENEMY[param1].nType;
                                       }
                                       else
                                       {
                                          this.draw.UNIT[_loc4_].DMGKIND[_loc5_] = Drawing.ENEMY_DARKZOMBIE2;
                                       }
                                       this.draw.UNIT[_loc4_].DMGPOSX[_loc5_] = this.draw.UNIT[_loc4_].nPosX;
                                       this.draw.UNIT[_loc4_].DMGPOSY[_loc5_] = this.draw.UNIT[_loc4_].nPosY + 10;
                                       this.draw.UNIT[_loc4_].DMGANIFRAME[_loc5_] = 0;
                                       break;
                                    }
                                    _loc5_++;
                                 }
                                 --this.draw.ENEMY[param1].ATTACKARMSNUM[param3];
                                 if(this.draw.ENEMY[param1].ATTACKARMSNUM[param3] <= 0)
                                 {
                                    break;
                                 }
                              }
                           }
                        }
                     }
                     _loc4_++;
                  }
                  if(this.draw.ENEMY[param1].ATTACKARMSNUM[param3] > 0)
                  {
                     if(this.draw.player.nGameMode != Drawing.MODE_WARROAD)
                     {
                        if(this.draw.player.nPosX >= this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] - 40 && this.draw.player.nPosX <= this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] + 40)
                        {
                           this.draw.lib.playEffect(56);
                           this.paladogDmg(_loc7_,false);
                           _loc4_ = 0;
                           while(_loc4_ < Player.MAX_DMG)
                           {
                              if(this.draw.player.DMGKIND[_loc4_] == Drawing.INITDATA)
                              {
                                 if(this.draw.ENEMY[param1].nType == Drawing.ENEMY_DARKZOMBIE)
                                 {
                                    this.draw.player.DMGKIND[_loc4_] = this.draw.ENEMY[param1].nType;
                                 }
                                 else
                                 {
                                    this.draw.player.DMGKIND[_loc4_] = Drawing.ENEMY_DARKZOMBIE2;
                                 }
                                 this.draw.player.DMGPOSX[_loc4_] = this.draw.player.nPosX;
                                 this.draw.player.DMGPOSY[_loc4_] = this.draw.player.nPosY + 10;
                                 this.draw.player.DMGANIFRAME[_loc4_] = 0;
                                 break;
                              }
                              _loc4_++;
                           }
                        }
                     }
                  }
               }
               else
               {
                  _loc7_ = int(this.draw.ENEMY[param1].nAttack);
                  _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
                  _loc10_ = int(this.draw.ENEMY[param1].nAttackNum);
                  _loc4_ = 0;
                  while(_loc4_ < Enemy.MAX_ENEMYATTACK)
                  {
                     if(this.draw.ENEMY[param1].ATTACKANI[_loc4_] == Drawing.INITDATA)
                     {
                        this.draw.ENEMY[param1].ATTACKARRIVEPOS[_loc4_] = 10000;
                        _loc5_ = 0;
                        while(_loc5_ < Drawing.MAX_UNITNUM)
                        {
                           if(this.draw.UNIT[_loc5_].bAppear)
                           {
                              if(this.draw.UNIT[_loc5_].bAlive)
                              {
                                 if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                                 {
                                    if(this.draw.UNIT[_loc5_].nPosY == this.draw.ENEMY[param1].nPosY)
                                    {
                                       if(this.draw.UNIT[_loc5_].nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - this.draw.UNIT[_loc5_].nAttackedLen && this.draw.UNIT[_loc5_].nPosX <= this.draw.ENEMY[param1].nPosX + this.draw.UNIT[_loc5_].nAttackedLen)
                                       {
                                          if(this.draw.ENEMY[param1].nPosX - this.draw.UNIT[_loc5_].nPosX <= this.draw.ENEMY[param1].ATTACKARRIVEPOS[_loc4_])
                                          {
                                             this.draw.ENEMY[param1].ATTACKARRIVEPOS[_loc4_] = this.draw.ENEMY[param1].nPosX - this.draw.UNIT[_loc5_].nPosX;
                                          }
                                       }
                                    }
                                 }
                                 else if(this.draw.UNIT[_loc5_].nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - this.draw.UNIT[_loc5_].nAttackedLen && this.draw.UNIT[_loc5_].nPosX <= this.draw.ENEMY[param1].nPosX + this.draw.UNIT[_loc5_].nAttackedLen)
                                 {
                                    if(this.draw.ENEMY[param1].nPosX - this.draw.UNIT[_loc5_].nPosX <= this.draw.ENEMY[param1].ATTACKARRIVEPOS[_loc4_])
                                    {
                                       this.draw.ENEMY[param1].ATTACKARRIVEPOS[_loc4_] = this.draw.ENEMY[param1].nPosX - this.draw.UNIT[_loc5_].nPosX;
                                    }
                                 }
                              }
                           }
                           _loc5_++;
                        }
                        if(this.draw.ENEMY[param1].ATTACKARRIVEPOS[_loc4_] >= 10000)
                        {
                           if(this.draw.player.nGameMode != Drawing.MODE_WARROAD)
                           {
                              if(this.draw.player.nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - Player.PALADOGDMGWIDTH && this.draw.player.nPosX <= this.draw.ENEMY[param1].nPosX)
                              {
                                 if(this.draw.ENEMY[param1].nPosX - this.draw.player.nPosX <= this.draw.ENEMY[param1].ATTACKARRIVEPOS[_loc4_])
                                 {
                                    this.draw.ENEMY[param1].ATTACKARRIVEPOS[_loc4_] = this.draw.ENEMY[param1].nPosX - this.draw.player.nPosX;
                                 }
                              }
                           }
                        }
                        if(this.draw.ENEMY[param1].ATTACKARRIVEPOS[_loc4_] < 10000)
                        {
                           this.draw.ENEMY[param1].ATTACKANI[_loc4_] = Enemy.NORMAL_ATTACK;
                           this.draw.ENEMY[param1].ATTACKANI[_loc4_ + Enemy.MAX_ENEMYATTACK] = 0;
                           _loc6_ = _loc4_;
                        }
                        break;
                     }
                     _loc4_++;
                  }
                  if(_loc6_ > Drawing.INITDATA)
                  {
                     this.draw.ENEMY[param1].ATTACKPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX;
                     this.draw.ENEMY[param1].ATTACKPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10;
                     this.draw.ENEMY[param1].ATTACKARMSPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX - this.draw.ENEMY[param1].ATTACKARRIVEPOS[_loc6_] / (Drawing.FPS >> 1);
                     this.draw.ENEMY[param1].SUBATTACKARMSPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX;
                     this.draw.ENEMY[param1].ATTACKARMSPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10;
                     this.draw.ENEMY[param1].ATTACKARMSNUM[_loc6_] = _loc10_;
                     this.draw.ENEMY[param1].ATTACKENEMY[_loc6_] = Drawing.INITDATA;
                     this.draw.lib.playEffect(85);
                  }
               }
               break;
            case Drawing.ENEMY_PUMPKIN:
               _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
               _loc10_ = int(this.draw.ENEMY[param1].nAttackNum);
               _loc4_ = 0;
               while(_loc4_ < Drawing.MAX_UNITNUM)
               {
                  if(this.draw.UNIT[_loc4_].bAppear)
                  {
                     if(this.draw.UNIT[_loc4_].bAlive)
                     {
                        if(this.draw.UNIT[_loc4_].bWagon)
                        {
                           if(this.draw.ENEMY[param1].nPosX - _loc8_ >= this.draw.UNIT[_loc4_].nPosX - 50 && this.draw.ENEMY[param1].nPosX - _loc8_ <= this.draw.UNIT[_loc4_].nPosX + Player.WAGONDMGWIDTH || this.draw.ENEMY[param1].nPosX >= this.draw.UNIT[_loc4_].nPosX - 50 && this.draw.ENEMY[param1].nPosX <= this.draw.UNIT[_loc4_].nPosX + Player.WAGONDMGWIDTH)
                           {
                              _loc5_ = 0;
                              while(_loc5_ < Unit.MAX_DMG)
                              {
                                 if(this.draw.UNIT[_loc4_].DMGKIND[_loc5_] == Drawing.INITDATA)
                                 {
                                    if(this.draw.ENEMY[param1].nType == Drawing.ENEMY_PUMPKIN)
                                    {
                                       this.draw.UNIT[_loc4_].DMGKIND[_loc5_] = this.draw.ENEMY[param1].nType;
                                    }
                                    else
                                    {
                                       this.draw.UNIT[_loc4_].DMGKIND[_loc5_] = Drawing.ENEMY_PUMPKIN2;
                                    }
                                    this.draw.UNIT[_loc4_].DMGPOSX[_loc5_] = this.draw.UNIT[_loc4_].nPosX;
                                    this.draw.UNIT[_loc4_].DMGPOSY[_loc5_] = this.draw.UNIT[_loc4_].nPosY + 10;
                                    this.draw.UNIT[_loc4_].DMGANIFRAME[_loc5_] = 0;
                                    this.draw.UNIT[_loc4_].DMGFROMENEMY[_loc5_] = param1;
                                    break;
                                 }
                                 _loc5_++;
                              }
                              if(++_loc9_ >= _loc10_)
                              {
                                 break;
                              }
                           }
                        }
                        else if(this.draw.UNIT[_loc4_].nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - this.draw.UNIT[_loc4_].nAttackedLen && this.draw.UNIT[_loc4_].nPosX <= this.draw.ENEMY[param1].nPosX + this.draw.UNIT[_loc4_].nAttackedLen)
                        {
                           _loc5_ = 0;
                           while(_loc5_ < Unit.MAX_DMG)
                           {
                              if(this.draw.UNIT[_loc4_].DMGKIND[_loc5_] == Drawing.INITDATA)
                              {
                                 if(this.draw.ENEMY[param1].nType == Drawing.ENEMY_PUMPKIN)
                                 {
                                    this.draw.UNIT[_loc4_].DMGKIND[_loc5_] = this.draw.ENEMY[param1].nType;
                                 }
                                 else
                                 {
                                    this.draw.UNIT[_loc4_].DMGKIND[_loc5_] = Drawing.ENEMY_PUMPKIN2;
                                 }
                                 this.draw.UNIT[_loc4_].DMGPOSX[_loc5_] = this.draw.UNIT[_loc4_].nPosX;
                                 this.draw.UNIT[_loc4_].DMGPOSY[_loc5_] = this.draw.UNIT[_loc4_].nPosY + 10;
                                 this.draw.UNIT[_loc4_].DMGANIFRAME[_loc5_] = 0;
                                 this.draw.UNIT[_loc4_].DMGFROMENEMY[_loc5_] = param1;
                                 break;
                              }
                              _loc5_++;
                           }
                           if(++_loc9_ >= _loc10_)
                           {
                              break;
                           }
                        }
                     }
                  }
                  _loc4_++;
               }
               if(_loc9_ < _loc10_)
               {
                  if(this.draw.player.nGameMode != Drawing.MODE_WARROAD)
                  {
                     if(this.draw.player.nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - Player.PALADOGDMGWIDTH && this.draw.player.nPosX <= this.draw.ENEMY[param1].nPosX)
                     {
                        _loc4_ = 0;
                        while(_loc4_ < Player.MAX_DMG)
                        {
                           if(this.draw.player.DMGKIND[_loc4_] == Drawing.INITDATA)
                           {
                              if(this.draw.ENEMY[param1].nType == Drawing.ENEMY_PUMPKIN)
                              {
                                 this.draw.player.DMGKIND[_loc4_] = this.draw.ENEMY[param1].nType;
                              }
                              else
                              {
                                 this.draw.player.DMGKIND[_loc4_] = Drawing.ENEMY_PUMPKIN2;
                              }
                              this.draw.player.DMGPOSX[_loc4_] = this.draw.player.nPosX;
                              this.draw.player.DMGPOSY[_loc4_] = this.draw.player.nPosY + 10;
                              this.draw.player.DMGANIFRAME[_loc4_] = 0;
                              this.draw.player.DMGFROMENEMY[_loc4_] = param1;
                              break;
                           }
                           _loc4_++;
                        }
                     }
                  }
               }
               break;
            case Drawing.ENEMY_STONE:
            case Drawing.ENEMY_ARMORSHIELD:
               break;
            case Drawing.ENEMY_GHOST:
            case Drawing.ENEMY_BOSSGHOST:
               _loc13_ = false;
               _loc14_ = false;
               _loc7_ = int(this.draw.ENEMY[param1].nAttack);
               _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
               _loc10_ = int(this.draw.ENEMY[param1].nAttackNum);
               if(this.draw.ENEMY[param1].nAttackUnit > Drawing.INITDATA)
               {
                  _loc4_ = int(this.draw.ENEMY[param1].nAttackUnit);
                  if(_loc4_ == Drawing.HEROPOS)
                  {
                     if(this.draw.player.nGameMode != Drawing.MODE_WARROAD)
                     {
                        if(this.draw.player.nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - Player.PALADOGDMGWIDTH && this.draw.player.nPosX <= this.draw.ENEMY[param1].nPosX)
                        {
                           this.draw.lib.playEffect(56);
                           this.paladogDmg(_loc7_,false);
                        }
                     }
                  }
                  else if(this.draw.UNIT[_loc4_].bAppear)
                  {
                     if(this.draw.UNIT[_loc4_].bAlive)
                     {
                        if(this.draw.UNIT[_loc4_].bWagon)
                        {
                           if(this.draw.ENEMY[param1].nPosX - _loc8_ >= this.draw.UNIT[_loc4_].nPosX - 50 && this.draw.ENEMY[param1].nPosX - _loc8_ <= this.draw.UNIT[_loc4_].nPosX + Player.WAGONDMGWIDTH || this.draw.ENEMY[param1].nPosX >= this.draw.UNIT[_loc4_].nPosX - 50 && this.draw.ENEMY[param1].nPosX <= this.draw.UNIT[_loc4_].nPosX + Player.WAGONDMGWIDTH)
                           {
                              this.draw.lib.playEffect(56);
                              _loc11_ = _loc7_;
                              if(this.draw.UNIT[_loc4_].bInAura)
                              {
                                 _loc11_ = _loc7_ * (1 - this.draw.player.HEROSKILL[Player.SKILL_DEFAURA] / 10);
                              }
                              this.setAttacked(Player.UNITATTACKED,_loc4_,param1);
                              this.draw.UNIT[_loc4_].nHp -= _loc11_;
                              if(this.draw.UNIT[_loc4_].nHp <= 0)
                              {
                                 this.draw.UNIT[_loc4_].nHp = 0;
                                 this.draw.UNIT[_loc4_].bAlive = false;
                                 this.draw.UNIT[_loc4_].bMove = false;
                                 this.draw.UNIT[_loc4_].bIce = false;
                                 this.draw.UNIT[_loc4_].bPoison = false;
                                 this.draw.UNIT[_loc4_].bDieAni = true;
                                 this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                                 this.setGameOver();
                              }
                           }
                        }
                        else if(this.draw.UNIT[_loc4_].nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - this.draw.UNIT[_loc4_].nAttackedLen && this.draw.UNIT[_loc4_].nPosX <= this.draw.ENEMY[param1].nPosX + this.draw.UNIT[_loc4_].nAttackedLen)
                        {
                           _loc11_ = _loc7_;
                           if(this.draw.UNIT[_loc4_].bInAura)
                           {
                              _loc11_ = _loc7_ * (1 - this.draw.player.HEROSKILL[Player.SKILL_DEFAURA] / 10);
                           }
                           if(this.draw.UNIT[_loc4_].bDefense)
                           {
                              this.draw.lib.playEffect(59);
                              _loc11_ >>= 1;
                           }
                           else
                           {
                              this.draw.lib.playEffect(56);
                           }
                           this.setAttacked(Player.UNITATTACKED,_loc4_,param1);
                           this.draw.UNIT[_loc4_].nHp -= _loc11_;
                           if(this.draw.UNIT[_loc4_].nHp <= 0)
                           {
                              this.draw.UNIT[_loc4_].nHp = 0;
                              this.draw.UNIT[_loc4_].bAlive = false;
                              this.draw.UNIT[_loc4_].bMove = false;
                              this.draw.UNIT[_loc4_].bIce = false;
                              this.draw.UNIT[_loc4_].bPoison = false;
                              this.draw.UNIT[_loc4_].bDieAni = true;
                              this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                              ++this.draw.player.nUnitDieNum;
                           }
                           else if(this.draw.UNIT[_loc4_].nHp < this.draw.UNIT[_loc4_].nMaxHp * 20 / 100 && !this.draw.UNIT[_loc4_].bWarningHp)
                           {
                              this.draw.UNIT[_loc4_].bAttack = false;
                              this.draw.UNIT[_loc4_].nAttackEnemy = Drawing.INITDATA;
                              this.draw.UNIT[_loc4_].nAtkFrame = 0;
                              this.draw.UNIT[_loc4_].bMove = false;
                              this.draw.UNIT[_loc4_].bKnockDown = true;
                              this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                              this.draw.UNIT[_loc4_].nKnockDownAniFrame = 0;
                              this.draw.UNIT[_loc4_].bWarningHp = true;
                              this.draw.lib.playEffect(57);
                           }
                           else if(this.draw.UNIT[_loc4_].nType != Drawing.UNIT_TURTLE)
                           {
                              this.draw.UNIT[_loc4_].nPosX -= Player.KNOCKBACKWIDTH;
                           }
                        }
                     }
                  }
               }
               break;
            case Drawing.ENEMY_BOSSZOMBIE:
            case Drawing.ENEMY_BOSSMUMMY:
               _loc4_ = 0;
               while(_loc4_ < Enemy.MAX_ENEMYATTACK)
               {
                  if(this.draw.ENEMY[param1].ATTACKANI[_loc4_] == Drawing.INITDATA)
                  {
                     this.draw.ENEMY[param1].ATTACKANI[_loc4_] = Enemy.NORMAL_ATTACK;
                     this.draw.ENEMY[param1].ATTACKANI[_loc4_ + Enemy.MAX_ENEMYATTACK] = 0;
                     _loc6_ = _loc4_;
                     break;
                  }
                  _loc4_++;
               }
               if(_loc6_ > Drawing.INITDATA)
               {
                  this.draw.ENEMY[param1].ATTACKPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX;
                  this.draw.ENEMY[param1].ATTACKPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10;
                  _loc15_ = this.draw.lib.getRand(6) + 5;
                  _loc4_ = 0;
                  while(_loc4_ < 2)
                  {
                     _loc16_ = this.draw.lib.getRand(10) + 1;
                     this.setAppearEnemy(Drawing.INITDATA,true,this.draw.ENEMY[param1].nBaseType,this.draw.ENEMY[param1].nPosX - _loc15_ + _loc4_ * (_loc15_ * 2),this.draw.ENEMY[param1].nPosY - _loc16_);
                     _loc4_++;
                  }
                  this.draw.lib.playEffect(46);
               }
               break;
            case Drawing.ENEMY_BOSSWITCH:
               _loc17_ = false;
               _loc18_ = Drawing.INITDATA;
               _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
               _loc4_ = 0;
               while(_loc4_ < Drawing.MAX_UNITNUM)
               {
                  if(this.draw.UNIT[_loc4_].bAppear)
                  {
                     if(Boolean(this.draw.UNIT[_loc4_].bAlive) && !this.draw.UNIT[_loc4_].bWagon)
                     {
                        if(this.draw.UNIT[_loc4_].nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - this.draw.UNIT[_loc4_].nAttackedLen && this.draw.UNIT[_loc4_].nPosX <= this.draw.ENEMY[param1].nPosX + this.draw.UNIT[_loc4_].nAttackedLen)
                        {
                           if(!this.draw.UNIT[_loc4_].bFrog)
                           {
                              if(_loc18_ == Drawing.INITDATA)
                              {
                                 _loc18_ = _loc4_;
                              }
                              else if(this.draw.UNIT[_loc4_].nPosX > this.draw.UNIT[_loc18_].nPosX)
                              {
                                 _loc18_ = _loc4_;
                              }
                              else if(this.draw.UNIT[_loc4_].nPosX == this.draw.UNIT[_loc18_].nPosX)
                              {
                                 if(this.draw.lib.getRand(100) < 50)
                                 {
                                    _loc18_ = _loc4_;
                                 }
                              }
                           }
                        }
                     }
                  }
                  _loc4_++;
               }
               if(_loc18_ == Drawing.INITDATA)
               {
                  _loc4_ = 0;
                  while(_loc4_ < Drawing.MAX_UNITNUM)
                  {
                     if(this.draw.UNIT[_loc4_].bAppear)
                     {
                        if(Boolean(this.draw.UNIT[_loc4_].bAlive) && !this.draw.UNIT[_loc4_].bWagon)
                        {
                           if(this.draw.UNIT[_loc4_].nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - this.draw.UNIT[_loc4_].nAttackedLen && this.draw.UNIT[_loc4_].nPosX <= this.draw.ENEMY[param1].nPosX + this.draw.UNIT[_loc4_].nAttackedLen)
                           {
                              if(_loc18_ == Drawing.INITDATA)
                              {
                                 _loc18_ = _loc4_;
                              }
                              else if(this.draw.lib.getRand(100) < 50)
                              {
                                 _loc18_ = _loc4_;
                              }
                           }
                        }
                     }
                     _loc4_++;
                  }
               }
               if(_loc18_ != Drawing.INITDATA)
               {
                  this.draw.UNIT[_loc18_].bMove = false;
                  this.draw.UNIT[_loc18_].nAtkFrame = 0;
                  this.draw.UNIT[_loc18_].bAttack = false;
                  this.draw.UNIT[_loc18_].nAttackEnemy = Drawing.INITDATA;
                  this.draw.UNIT[_loc18_].bFrog = true;
                  this.draw.UNIT[_loc18_].bReturnFromFrog = false;
                  this.draw.UNIT[_loc18_].nFrogStartTime = getTimer();
                  this.draw.UNIT[_loc18_].nFrogTime = 5000;
                  this.draw.UNIT[_loc18_].nFrogAniFrame = 0;
                  this.draw.lib.playEffect(46);
               }
               break;
            case Drawing.ENEMY_BOSSBIGMOUTH:
               _loc13_ = false;
               _loc14_ = false;
               _loc7_ = int(this.draw.ENEMY[param1].nAttack);
               _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
               _loc10_ = int(this.draw.ENEMY[param1].nAttackNum);
               _loc4_ = 0;
               while(_loc4_ < Drawing.MAX_UNITNUM)
               {
                  if(this.draw.UNIT[_loc4_].bAppear)
                  {
                     if(this.draw.UNIT[_loc4_].bAlive)
                     {
                        if(this.draw.UNIT[_loc4_].nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - this.draw.UNIT[_loc4_].nAttackedLen && this.draw.UNIT[_loc4_].nPosX <= this.draw.ENEMY[param1].nPosX + this.draw.UNIT[_loc4_].nAttackedLen)
                        {
                           this.draw.UNIT[_loc4_].nHp = 0;
                           this.draw.UNIT[_loc4_].bAlive = false;
                           this.draw.UNIT[_loc4_].bMove = false;
                           this.draw.UNIT[_loc4_].bIce = false;
                           this.draw.UNIT[_loc4_].bPoison = false;
                           this.draw.UNIT[_loc4_].bDieAni = false;
                           ++this.draw.player.nUnitDieNum;
                           if(++_loc9_ >= _loc10_)
                           {
                              break;
                           }
                        }
                     }
                  }
                  _loc4_++;
               }
               if(_loc9_ < _loc10_)
               {
                  if(this.draw.player.nGameMode != Drawing.MODE_WARROAD)
                  {
                     if(this.draw.player.nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - Player.PALADOGDMGWIDTH && this.draw.player.nPosX <= this.draw.ENEMY[param1].nPosX)
                     {
                        this.paladogDmg(10000000,false);
                     }
                  }
               }
               break;
            case Drawing.ENEMY_BOSSPALADOG:
               if(param2)
               {
                  _loc14_ = false;
                  _loc13_ = false;
                  _loc7_ = int(this.draw.ENEMY[param1].nAttack);
                  _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
                  _loc10_ = int(this.draw.ENEMY[param1].nAttackNum);
                  _loc4_ = 0;
                  while(_loc4_ < Drawing.MAX_UNITNUM)
                  {
                     if(this.draw.UNIT[_loc4_].bAppear)
                     {
                        if(this.draw.UNIT[_loc4_].bAlive)
                        {
                           if(this.draw.UNIT[_loc4_].bWagon)
                           {
                              if(this.enemyAlreadyAttackUnit(param1,param3,_loc4_) && (this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] >= this.draw.UNIT[_loc4_].nPosX - 50 && this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] <= this.draw.UNIT[_loc4_].nPosX + Player.WAGONDMGWIDTH || this.draw.ENEMY[param1].SUBATTACKARMSPOSX[param3] >= this.draw.UNIT[_loc4_].nPosX - 50 && this.draw.ENEMY[param1].SUBATTACKARMSPOSX[param3] <= this.draw.UNIT[_loc4_].nPosX + Player.WAGONDMGWIDTH))
                              {
                                 _loc12_ = false;
                                 if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                                 {
                                    if(this.draw.UNIT[_loc4_].nPosY == this.draw.ENEMY[param1].nPosY)
                                    {
                                       _loc12_ = true;
                                    }
                                 }
                                 else
                                 {
                                    _loc12_ = true;
                                 }
                                 if(_loc12_)
                                 {
                                    this.draw.lib.playEffect(56);
                                    _loc11_ = _loc7_;
                                    if(this.draw.UNIT[_loc4_].bInAura)
                                    {
                                       _loc11_ = _loc7_ * (1 - this.draw.player.HEROSKILL[Player.SKILL_DEFAURA] / 10);
                                    }
                                    this.setAttacked(Player.UNITATTACKED,_loc4_,param1);
                                    this.draw.UNIT[_loc4_].nHp -= _loc11_;
                                    if(this.draw.UNIT[_loc4_].nHp <= 0)
                                    {
                                       this.draw.UNIT[_loc4_].nHp = 0;
                                       this.draw.UNIT[_loc4_].bAlive = false;
                                       this.draw.UNIT[_loc4_].bMove = false;
                                       this.draw.UNIT[_loc4_].bIce = false;
                                       this.draw.UNIT[_loc4_].bPoison = false;
                                       this.draw.UNIT[_loc4_].bDieAni = true;
                                       this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                                       this.setGameOver();
                                    }
                                    this.draw.ENEMY[param1].ATTACKUNIT[param3 * Enemy.MAX_ATTACKUNIT + this.draw.ENEMY[param1].nAttackUnitPos[param3]] = _loc4_;
                                    ++this.draw.ENEMY[param1].nAttackUnitPos[param3];
                                    --this.draw.ENEMY[param1].ATTACKARMSNUM[param3];
                                    if(this.draw.ENEMY[param1].ATTACKARMSNUM[param3] <= 0)
                                    {
                                       this.resetEnemyAttack(param1,param3);
                                       break;
                                    }
                                 }
                              }
                           }
                           else if(this.enemyAlreadyAttackUnit(param1,param3,_loc4_) && this.draw.UNIT[_loc4_].nPosX >= this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] - this.draw.UNIT[_loc4_].nAttackedLen && this.draw.UNIT[_loc4_].nPosX <= this.draw.ENEMY[param1].SUBATTACKARMSPOSX[param3] + this.draw.UNIT[_loc4_].nAttackedLen)
                           {
                              _loc12_ = false;
                              if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                              {
                                 if(this.draw.UNIT[_loc4_].nPosY == this.draw.ENEMY[param1].nPosY)
                                 {
                                    _loc12_ = true;
                                 }
                              }
                              else
                              {
                                 _loc12_ = true;
                              }
                              if(_loc12_)
                              {
                                 _loc11_ = _loc7_;
                                 if(this.draw.UNIT[_loc4_].bInAura)
                                 {
                                    _loc11_ = _loc7_ * (1 - this.draw.player.HEROSKILL[Player.SKILL_DEFAURA] / 10);
                                 }
                                 if(this.draw.UNIT[_loc4_].bDefense)
                                 {
                                    this.draw.lib.playEffect(59);
                                    _loc11_ >>= 1;
                                 }
                                 else
                                 {
                                    this.draw.lib.playEffect(56);
                                 }
                                 this.setAttacked(Player.UNITATTACKED,_loc4_,param1);
                                 this.draw.UNIT[_loc4_].nHp -= _loc11_;
                                 if(this.draw.UNIT[_loc4_].nHp <= 0)
                                 {
                                    this.draw.UNIT[_loc4_].nHp = 0;
                                    this.draw.UNIT[_loc4_].bAlive = false;
                                    this.draw.UNIT[_loc4_].bMove = false;
                                    this.draw.UNIT[_loc4_].bIce = false;
                                    this.draw.UNIT[_loc4_].bPoison = false;
                                    this.draw.UNIT[_loc4_].bDieAni = true;
                                    this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                                    ++this.draw.player.nUnitDieNum;
                                 }
                                 else if(this.draw.UNIT[_loc4_].nHp < this.draw.UNIT[_loc4_].nMaxHp * 20 / 100 && !this.draw.UNIT[_loc4_].bWarningHp)
                                 {
                                    this.draw.UNIT[_loc4_].bAttack = false;
                                    this.draw.UNIT[_loc4_].nAttackEnemy = Drawing.INITDATA;
                                    this.draw.UNIT[_loc4_].nAtkFrame = 0;
                                    this.draw.UNIT[_loc4_].bMove = false;
                                    this.draw.UNIT[_loc4_].bKnockDown = true;
                                    this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                                    this.draw.UNIT[_loc4_].nKnockDownAniFrame = 0;
                                    this.draw.UNIT[_loc4_].bWarningHp = true;
                                    this.draw.lib.playEffect(57);
                                 }
                                 else if(this.draw.UNIT[_loc4_].nType != Drawing.UNIT_TURTLE)
                                 {
                                    this.draw.UNIT[_loc4_].nPosX -= Player.KNOCKBACKWIDTH;
                                 }
                                 this.draw.ENEMY[param1].ATTACKUNIT[param3 * Enemy.MAX_ATTACKUNIT + this.draw.ENEMY[param1].nAttackUnitPos[param3]] = _loc4_;
                                 ++this.draw.ENEMY[param1].nAttackUnitPos[param3];
                                 --this.draw.ENEMY[param1].ATTACKARMSNUM[param3];
                                 if(this.draw.ENEMY[param1].ATTACKARMSNUM[param3] <= 0)
                                 {
                                    this.resetEnemyAttack(param1,param3);
                                    break;
                                 }
                              }
                           }
                        }
                     }
                     _loc4_++;
                  }
                  if(this.draw.ENEMY[param1].ATTACKARMSNUM[param3] > 0)
                  {
                     if(this.draw.player.nGameMode != Drawing.MODE_WARROAD)
                     {
                        if(this.enemyAlreadyAttackUnit(param1,param3,Drawing.HEROPOS) && this.draw.player.nPosX >= this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] - Player.PALADOGDMGWIDTH && this.draw.player.nPosX <= this.draw.ENEMY[param1].SUBATTACKARMSPOSX[param3])
                        {
                           this.draw.lib.playEffect(56);
                           this.draw.ENEMY[param1].ATTACKUNIT[param3 * Enemy.MAX_ATTACKUNIT + this.draw.ENEMY[param1].nAttackUnitPos[param3]] = Drawing.HEROPOS;
                           ++this.draw.ENEMY[param1].nAttackUnitPos[param3];
                           --this.draw.ENEMY[param1].ATTACKARMSNUM[param3];
                           if(this.draw.ENEMY[param1].ATTACKARMSNUM[param3] <= 0)
                           {
                              this.resetEnemyAttack(param1,param3);
                           }
                           this.paladogDmg(_loc7_,false);
                        }
                     }
                  }
               }
               else
               {
                  _loc7_ = int(this.draw.ENEMY[param1].nAttack);
                  _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
                  _loc10_ = int(this.draw.ENEMY[param1].nAttackNum);
                  _loc4_ = 0;
                  while(_loc4_ < Enemy.MAX_ENEMYATTACK)
                  {
                     if(this.draw.ENEMY[param1].ATTACKANI[_loc4_] == Drawing.INITDATA)
                     {
                        this.draw.ENEMY[param1].ATTACKANI[_loc4_] = Enemy.NORMAL_ATTACK;
                        this.draw.ENEMY[param1].ATTACKANI[_loc4_ + Enemy.MAX_ENEMYATTACK] = 0;
                        _loc6_ = _loc4_;
                        break;
                     }
                     _loc4_++;
                  }
                  if(_loc6_ > Drawing.INITDATA)
                  {
                     this.draw.ENEMY[param1].ATTACKPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX;
                     this.draw.ENEMY[param1].ATTACKPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10;
                     this.draw.ENEMY[param1].SUBATTACKARMSPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX - 10;
                     if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                     {
                        this.draw.ENEMY[param1].ATTACKARMSPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX - (Player.PALADOG_GODPUNCHPOSX >> 1);
                        this.draw.ENEMY[param1].ATTACKARMSPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10 - (Player.PALADOG_GODPUNCHPOSY >> 1);
                     }
                     else
                     {
                        this.draw.ENEMY[param1].ATTACKARMSPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX - Player.PALADOG_GODPUNCHPOSX;
                        this.draw.ENEMY[param1].ATTACKARMSPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10 - Player.PALADOG_GODPUNCHPOSY;
                     }
                     this.draw.ENEMY[param1].ATTACKARMSNUM[_loc6_] = _loc10_;
                     this.draw.ENEMY[param1].ATTACKENEMY[_loc6_] = Drawing.INITDATA;
                     _loc4_ = 0;
                     while(_loc4_ < Enemy.MAX_ATTACKUNIT)
                     {
                        this.draw.ENEMY[param1].ATTACKUNIT[_loc6_ * Enemy.MAX_ATTACKUNIT + _loc4_] = Drawing.INITDATA;
                        _loc4_++;
                     }
                     this.draw.ENEMY[param1].nAttackUnitPos[_loc6_] = 0;
                     this.draw.lib.playEffect(49);
                  }
               }
               break;
            case Drawing.ENEMY_BOMB:
               if(param2)
               {
                  _loc13_ = false;
                  _loc14_ = false;
                  _loc7_ = int(this.draw.ENEMY[param1].nAttack);
                  _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
                  _loc10_ = int(this.draw.ENEMY[param1].nAttackNum);
                  _loc4_ = 0;
                  while(_loc4_ < Drawing.MAX_UNITNUM)
                  {
                     if(this.draw.UNIT[_loc4_].bAppear)
                     {
                        if(this.draw.UNIT[_loc4_].bAlive)
                        {
                           if(this.draw.UNIT[_loc4_].bWagon)
                           {
                              if(this.draw.ENEMY[param1].nPosX - _loc8_ >= this.draw.UNIT[_loc4_].nPosX - 50 && this.draw.ENEMY[param1].nPosX - _loc8_ <= this.draw.UNIT[_loc4_].nPosX + Player.WAGONDMGWIDTH || this.draw.ENEMY[param1].nPosX >= this.draw.UNIT[_loc4_].nPosX - 50 && this.draw.ENEMY[param1].nPosX <= this.draw.UNIT[_loc4_].nPosX + Player.WAGONDMGWIDTH)
                              {
                                 this.draw.lib.playEffect(56);
                                 _loc11_ = _loc7_;
                                 if(this.draw.UNIT[_loc4_].bInAura)
                                 {
                                    _loc11_ = _loc7_ * (1 - this.draw.player.HEROSKILL[Player.SKILL_DEFAURA] / 10);
                                 }
                                 this.setAttacked(Player.UNITATTACKED,_loc4_,param1);
                                 this.draw.UNIT[_loc4_].nHp -= _loc11_;
                                 if(this.draw.UNIT[_loc4_].nHp <= 0)
                                 {
                                    this.draw.UNIT[_loc4_].nHp = 0;
                                    this.draw.UNIT[_loc4_].bAlive = false;
                                    this.draw.UNIT[_loc4_].bMove = false;
                                    this.draw.UNIT[_loc4_].bIce = false;
                                    this.draw.UNIT[_loc4_].bPoison = false;
                                    this.draw.UNIT[_loc4_].bDieAni = true;
                                    this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                                    this.setGameOver();
                                 }
                                 if(++_loc9_ >= _loc10_)
                                 {
                                    break;
                                 }
                              }
                           }
                           else if(this.draw.UNIT[_loc4_].nPosX >= this.draw.ENEMY[param1].ATTACKPOSX[param3] - _loc8_ - this.draw.UNIT[_loc4_].nAttackedLen && this.draw.UNIT[_loc4_].nPosX <= this.draw.ENEMY[param1].ATTACKPOSX[param3] + _loc8_ + this.draw.UNIT[_loc4_].nAttackedLen)
                           {
                              _loc11_ = _loc7_;
                              if(this.draw.UNIT[_loc4_].bInAura)
                              {
                                 _loc11_ = _loc7_ * (1 - this.draw.player.HEROSKILL[Player.SKILL_DEFAURA] / 10);
                              }
                              if(this.draw.UNIT[_loc4_].bDefense)
                              {
                                 this.draw.lib.playEffect(59);
                                 _loc11_ >>= 1;
                              }
                              else
                              {
                                 this.draw.lib.playEffect(56);
                              }
                              this.setAttacked(Player.UNITATTACKED,_loc4_,param1);
                              this.draw.UNIT[_loc4_].nHp -= _loc11_;
                              if(this.draw.UNIT[_loc4_].nHp <= 0)
                              {
                                 this.draw.UNIT[_loc4_].nHp = 0;
                                 this.draw.UNIT[_loc4_].bAlive = false;
                                 this.draw.UNIT[_loc4_].bMove = false;
                                 this.draw.UNIT[_loc4_].bIce = false;
                                 this.draw.UNIT[_loc4_].bPoison = false;
                                 this.draw.UNIT[_loc4_].bDieAni = true;
                                 this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                                 ++this.draw.player.nUnitDieNum;
                              }
                              else if(this.draw.UNIT[_loc4_].nHp < this.draw.UNIT[_loc4_].nMaxHp * 20 / 100 && !this.draw.UNIT[_loc4_].bWarningHp)
                              {
                                 this.draw.UNIT[_loc4_].bAttack = false;
                                 this.draw.UNIT[_loc4_].nAttackEnemy = Drawing.INITDATA;
                                 this.draw.UNIT[_loc4_].nAtkFrame = 0;
                                 this.draw.UNIT[_loc4_].bMove = false;
                                 this.draw.UNIT[_loc4_].bKnockDown = true;
                                 this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                                 this.draw.UNIT[_loc4_].nKnockDownAniFrame = 0;
                                 this.draw.UNIT[_loc4_].bWarningHp = true;
                                 this.draw.lib.playEffect(57);
                              }
                              else if(this.draw.UNIT[_loc4_].nType != Drawing.UNIT_TURTLE)
                              {
                                 this.draw.UNIT[_loc4_].nPosX -= Player.KNOCKBACKWIDTH;
                              }
                              if(++_loc9_ >= _loc10_)
                              {
                                 break;
                              }
                           }
                        }
                     }
                     _loc4_++;
                  }
                  if(_loc9_ < _loc10_)
                  {
                     if(this.draw.player.nGameMode != Drawing.MODE_WARROAD)
                     {
                        if(this.draw.player.nPosX >= this.draw.ENEMY[param1].ATTACKPOSX[param3] - _loc8_ - Player.PALADOGDMGWIDTH && this.draw.player.nPosX <= this.draw.ENEMY[param1].ATTACKPOSX[param3] + _loc8_ + Player.PALADOGDMGWIDTH)
                        {
                           this.draw.lib.playEffect(56);
                           this.paladogDmg(_loc7_,false);
                        }
                     }
                  }
               }
               else
               {
                  _loc7_ = int(this.draw.ENEMY[param1].nAttack);
                  _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
                  _loc10_ = int(this.draw.ENEMY[param1].nAttackNum);
                  _loc4_ = 0;
                  while(_loc4_ < Enemy.MAX_ENEMYATTACK)
                  {
                     if(this.draw.ENEMY[param1].ATTACKANI[_loc4_] == Drawing.INITDATA)
                     {
                        this.draw.ENEMY[param1].ATTACKANI[_loc4_] = Enemy.NORMAL_ATTACK;
                        this.draw.ENEMY[param1].ATTACKANI[_loc4_ + Enemy.MAX_ENEMYATTACK] = 0;
                        _loc6_ = _loc4_;
                        break;
                     }
                     _loc4_++;
                  }
                  if(_loc6_ > Drawing.INITDATA)
                  {
                     this.draw.ENEMY[param1].ATTACKPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX;
                     this.draw.ENEMY[param1].ATTACKPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10;
                     this.draw.ENEMY[param1].ATTACKARMSNUM[_loc6_] = _loc10_;
                     this.draw.ENEMY[param1].ATTACKENEMY[_loc6_] = Drawing.INITDATA;
                     this.draw.ENEMY[param1].bAlive = false;
                     this.draw.ENEMY[param1].bBomb = true;
                  }
               }
               break;
            case Drawing.ENEMY_BOSSDRAGON:
               _loc13_ = false;
               _loc14_ = false;
               _loc7_ = int(this.draw.ENEMY[param1].nAttack);
               _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
               _loc10_ = int(this.draw.ENEMY[param1].nAttackNum);
               _loc4_ = 0;
               while(_loc4_ < Drawing.MAX_UNITNUM)
               {
                  if(this.draw.UNIT[_loc4_].bAppear)
                  {
                     if(this.draw.UNIT[_loc4_].bAlive)
                     {
                        if(this.draw.UNIT[_loc4_].nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - this.draw.UNIT[_loc4_].nAttackedLen && this.draw.UNIT[_loc4_].nPosX <= this.draw.ENEMY[param1].nPosX + this.draw.UNIT[_loc4_].nAttackedLen)
                        {
                           _loc11_ = _loc7_;
                           if(this.draw.UNIT[_loc4_].bInAura)
                           {
                              _loc11_ = _loc7_ * (1 - this.draw.player.HEROSKILL[Player.SKILL_DEFAURA] / 10);
                           }
                           if(this.draw.UNIT[_loc4_].bDefense)
                           {
                              this.draw.lib.playEffect(59);
                              _loc11_ >>= 1;
                           }
                           else
                           {
                              this.draw.lib.playEffect(56);
                           }
                           this.setAttacked(Player.UNITATTACKED,_loc4_,param1);
                           this.draw.UNIT[_loc4_].nHp -= _loc11_;
                           if(this.draw.UNIT[_loc4_].nHp <= 0)
                           {
                              this.draw.UNIT[_loc4_].nHp = 0;
                              this.draw.UNIT[_loc4_].bAlive = false;
                              this.draw.UNIT[_loc4_].bMove = false;
                              this.draw.UNIT[_loc4_].bIce = false;
                              this.draw.UNIT[_loc4_].bPoison = false;
                              this.draw.UNIT[_loc4_].bDieAni = true;
                              this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                              ++this.draw.player.nUnitDieNum;
                           }
                           else if(this.draw.UNIT[_loc4_].nHp < this.draw.UNIT[_loc4_].nMaxHp * 20 / 100 && !this.draw.UNIT[_loc4_].bWarningHp)
                           {
                              this.draw.UNIT[_loc4_].bAttack = false;
                              this.draw.UNIT[_loc4_].nAttackEnemy = Drawing.INITDATA;
                              this.draw.UNIT[_loc4_].nAtkFrame = 0;
                              this.draw.UNIT[_loc4_].bMove = false;
                              this.draw.UNIT[_loc4_].bKnockDown = true;
                              this.draw.UNIT[_loc4_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                              this.draw.UNIT[_loc4_].nKnockDownAniFrame = 0;
                              this.draw.UNIT[_loc4_].bWarningHp = true;
                              this.draw.lib.playEffect(57);
                           }
                           else
                           {
                              if(this.draw.UNIT[_loc4_].nType != Drawing.UNIT_TURTLE)
                              {
                                 this.draw.UNIT[_loc4_].nPosX -= Player.KNOCKBACKWIDTH;
                              }
                              if(this.draw.lib.getRand(100) < 25)
                              {
                                 this.draw.UNIT[_loc4_].bMove = false;
                                 if(this.draw.UNIT[_loc4_].bIce)
                                 {
                                    this.draw.UNIT[_loc4_].nIceStartTime = getTimer();
                                    this.draw.UNIT[_loc4_].nIceTime = 3000;
                                 }
                                 else
                                 {
                                    this.draw.lib.playEffect(52);
                                    this.draw.UNIT[_loc4_].bIce = true;
                                    this.draw.UNIT[_loc4_].nIceStartTime = getTimer();
                                    this.draw.UNIT[_loc4_].nIceTime = 3000;
                                    this.draw.ENEMY[_loc4_].nIceAniFrame = 0;
                                 }
                              }
                           }
                           if(++_loc9_ >= _loc10_)
                           {
                              break;
                           }
                        }
                     }
                  }
                  _loc4_++;
               }
               if(_loc9_ < _loc10_)
               {
                  if(this.draw.player.nGameMode != Drawing.MODE_WARROAD)
                  {
                     if(this.draw.player.nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - Player.PALADOGDMGWIDTH && this.draw.player.nPosX <= this.draw.ENEMY[param1].nPosX)
                     {
                        this.draw.lib.playEffect(56);
                        this.paladogDmg(_loc7_,false);
                     }
                  }
               }
               break;
            case Drawing.ENEMY_BOSSWOMANDEVIL:
               if(param2)
               {
                  _loc14_ = false;
                  _loc13_ = false;
                  _loc7_ = int(this.draw.ENEMY[param1].nAttack);
                  _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
                  _loc4_ = 0;
                  while(_loc4_ < Drawing.MAX_UNITNUM)
                  {
                     if(this.draw.UNIT[_loc4_].bAppear)
                     {
                        if(this.draw.UNIT[_loc4_].bAlive)
                        {
                           if(this.draw.UNIT[_loc4_].nPosX >= this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] - this.draw.UNIT[_loc4_].nAttackedLen && this.draw.UNIT[_loc4_].nPosX <= this.draw.ENEMY[param1].SUBATTACKARMSPOSX[param3] + this.draw.UNIT[_loc4_].nAttackedLen)
                           {
                              _loc12_ = false;
                              if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                              {
                                 if(this.draw.UNIT[_loc4_].nPosY == this.draw.ENEMY[param1].nPosY)
                                 {
                                    _loc12_ = true;
                                 }
                              }
                              else
                              {
                                 _loc12_ = true;
                              }
                              if(_loc12_)
                              {
                                 this.draw.lib.playEffect(83);
                                 this.setAttacked(Player.UNITATTACKED,_loc4_,param1);
                                 this.draw.UNIT[_loc4_].nPoisonDps = 2000;
                                 if(this.draw.UNIT[_loc4_].bPoison)
                                 {
                                    if(this.draw.UNIT[_loc4_].nType != Drawing.UNIT_TURTLE)
                                    {
                                       this.draw.UNIT[_loc4_].nPosX -= Player.KNOCKBACKWIDTH;
                                    }
                                    this.draw.UNIT[_loc4_].nPoisonStartTime = getTimer();
                                    this.draw.UNIT[_loc4_].nPoisonDpsTime = getTimer();
                                    this.draw.UNIT[_loc4_].nPoisonTime = 10000;
                                 }
                                 else
                                 {
                                    if(this.draw.UNIT[_loc4_].nType != Drawing.UNIT_TURTLE)
                                    {
                                       this.draw.UNIT[_loc4_].nPosX -= Player.KNOCKBACKWIDTH;
                                    }
                                    this.draw.UNIT[_loc4_].bPoison = true;
                                    this.draw.UNIT[_loc4_].nPoisonStartTime = getTimer();
                                    this.draw.UNIT[_loc4_].nPoisonDpsTime = getTimer();
                                    this.draw.UNIT[_loc4_].nPoisonTime = 10000;
                                 }
                                 --this.draw.ENEMY[param1].ATTACKARMSNUM[param3];
                                 if(this.draw.ENEMY[param1].ATTACKARMSNUM[param3] <= 0)
                                 {
                                    this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] = Drawing.INITDATA;
                                    break;
                                 }
                              }
                           }
                        }
                     }
                     _loc4_++;
                  }
                  if(this.draw.ENEMY[param1].ATTACKARMSNUM[param3] > 0)
                  {
                     if(this.draw.player.nGameMode != Drawing.MODE_WARROAD)
                     {
                        if(this.draw.player.nPosX >= this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] - Player.PALADOGDMGWIDTH && this.draw.player.nPosX <= this.draw.ENEMY[param1].SUBATTACKARMSPOSX[param3])
                        {
                           this.draw.lib.playEffect(83);
                           this.setAttacked(Player.PALADOGATTACKED,Drawing.INITDATA,Drawing.INITDATA);
                           this.draw.player.nPoisonDps = 2000;
                           if(this.draw.player.bPoison)
                           {
                              this.draw.player.nPoisonStartTime = getTimer();
                              this.draw.player.nPoisonDpsTime = getTimer();
                              this.draw.player.nPoisonTime = 10000;
                           }
                           else
                           {
                              this.draw.player.bPoison = true;
                              this.draw.player.nPoisonStartTime = getTimer();
                              this.draw.player.nPoisonDpsTime = getTimer();
                              this.draw.player.nPoisonTime = 10000;
                           }
                           this.draw.ENEMY[param1].ATTACKARMSPOSX[param3] = Drawing.INITDATA;
                        }
                     }
                  }
               }
               else
               {
                  _loc7_ = int(this.draw.ENEMY[param1].nAttack);
                  _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
                  _loc10_ = int(this.draw.ENEMY[param1].nAttackNum);
                  _loc4_ = 0;
                  while(_loc4_ < Enemy.MAX_ENEMYATTACK)
                  {
                     if(this.draw.ENEMY[param1].ATTACKANI[_loc4_] == Drawing.INITDATA)
                     {
                        this.draw.ENEMY[param1].ATTACKANI[_loc4_] = Enemy.NORMAL_ATTACK;
                        this.draw.ENEMY[param1].ATTACKANI[_loc4_ + Enemy.MAX_ENEMYATTACK] = 0;
                        _loc6_ = _loc4_;
                        break;
                     }
                     _loc4_++;
                  }
                  if(_loc6_ > Drawing.INITDATA)
                  {
                     this.draw.ENEMY[param1].ATTACKPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX;
                     this.draw.ENEMY[param1].ATTACKPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10;
                     this.draw.ENEMY[param1].SUBATTACKARMSPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX;
                     if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
                     {
                        this.draw.ENEMY[param1].ATTACKARMSPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX - (Player.BOSSWOMANDEVIL_ARMSPOSX >> 1);
                        this.draw.ENEMY[param1].ATTACKARMSPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10 - (Player.BOSSWOMANDEVIL_ARMSPOSY >> 1);
                     }
                     else
                     {
                        this.draw.ENEMY[param1].ATTACKARMSPOSX[_loc6_] = this.draw.ENEMY[param1].nPosX - Player.BOSSWOMANDEVIL_ARMSPOSX;
                        this.draw.ENEMY[param1].ATTACKARMSPOSY[_loc6_] = this.draw.ENEMY[param1].nPosY + 10 - Player.BOSSWOMANDEVIL_ARMSPOSY;
                     }
                     this.draw.ENEMY[param1].ATTACKARMSNUM[_loc6_] = _loc10_;
                     this.draw.ENEMY[param1].ATTACKENEMY[_loc6_] = Drawing.INITDATA;
                     this.draw.lib.playEffect(83);
                  }
               }
               break;
            case Drawing.ENEMY_BOSSMANDEVIL:
               _loc12_ = false;
               _loc8_ = int(this.draw.ENEMY[param1].nAttackLen);
               _loc10_ = int(this.draw.ENEMY[param1].nAttackNum);
               _loc4_ = 0;
               while(_loc4_ < Drawing.MAX_UNITNUM)
               {
                  if(this.draw.UNIT[_loc4_].bAppear)
                  {
                     if(this.draw.UNIT[_loc4_].bAlive)
                     {
                        if(this.draw.UNIT[_loc4_].nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - this.draw.UNIT[_loc4_].nAttackedLen && this.draw.UNIT[_loc4_].nPosX <= this.draw.ENEMY[param1].nPosX + this.draw.UNIT[_loc4_].nAttackedLen)
                        {
                           _loc12_ = true;
                           _loc5_ = 0;
                           while(_loc5_ < Unit.MAX_DMG)
                           {
                              if(this.draw.UNIT[_loc4_].DMGKIND[_loc5_] == Drawing.INITDATA)
                              {
                                 this.draw.UNIT[_loc4_].DMGKIND[_loc5_] = Drawing.ENEMY_BOSSMANDEVIL;
                                 this.draw.UNIT[_loc4_].DMGPOSX[_loc5_] = this.draw.UNIT[_loc4_].nPosX;
                                 this.draw.UNIT[_loc4_].DMGPOSY[_loc5_] = this.draw.UNIT[_loc4_].nPosY + 10;
                                 this.draw.UNIT[_loc4_].DMGANIFRAME[_loc5_] = 0;
                                 this.draw.UNIT[_loc4_].DMGFROMENEMY[_loc5_] = param1;
                                 break;
                              }
                              _loc5_++;
                           }
                           if(++_loc9_ >= _loc10_)
                           {
                              break;
                           }
                        }
                     }
                  }
                  _loc4_++;
               }
               if(_loc9_ < _loc10_)
               {
                  if(this.draw.player.nGameMode != Drawing.MODE_WARROAD)
                  {
                     if(this.draw.player.nPosX >= this.draw.ENEMY[param1].nPosX - _loc8_ - Player.PALADOGDMGWIDTH && this.draw.player.nPosX <= this.draw.ENEMY[param1].nPosX)
                     {
                        _loc12_ = true;
                        _loc4_ = 0;
                        while(_loc4_ < Player.MAX_DMG)
                        {
                           if(this.draw.player.DMGKIND[_loc4_] == Drawing.INITDATA)
                           {
                              this.draw.player.DMGKIND[_loc4_] = Drawing.ENEMY_BOSSMANDEVIL;
                              this.draw.player.DMGPOSX[_loc4_] = this.draw.player.nPosX;
                              this.draw.player.DMGPOSY[_loc4_] = this.draw.player.nPosY + 10;
                              this.draw.player.DMGANIFRAME[_loc4_] = 0;
                              this.draw.player.DMGFROMENEMY[_loc4_] = param1;
                              break;
                           }
                           _loc4_++;
                        }
                     }
                  }
               }
               if(_loc12_)
               {
                  this.draw.lib.playEffect(11);
               }
         }
      }
      
      public function paladogDmg(param1:int, param2:Boolean) : void
      {
         this.setAttacked(Player.PALADOGATTACKED,Drawing.INITDATA,Drawing.INITDATA);
         if(this.draw.nGameState < Drawing.GAME_LEVELUP)
         {
            if(param2)
            {
               this.draw.player.nHp = 1;
            }
            else
            {
               this.draw.player.nHp -= (1 - this.draw.player.HEROSKILL[Player.SKILL_DEF] / 10) * param1;
            }
         }
         if(this.draw.player.nHp <= 0)
         {
            this.draw.player.nHp = 0;
         }
      }
      
      public function getEnemyPoint(param1:int, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(this.draw.player.nHp > 0)
         {
            _loc4_ = 0;
            _loc5_ = 0;
            _loc6_ = 0;
            if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
            {
               if(!this.draw.ENEMY[param1].bBaby)
               {
                  ++this.draw.player.nSurvivalDieMob;
               }
               if(this.draw.player.nSurvivalDieMob >= this.draw.player.nSurvivalMobMaxNum)
               {
                  this.draw.player.bStageClear = true;
                  this.draw.nGameFrame = 0;
               }
            }
            if(param2)
            {
               ++this.draw.player.nStageDieEnemy;
            }
            if(this.draw.player.nPlayTime < 900)
            {
               _loc6_ = 0;
               _loc4_ += this.draw.ENEMY[param1].nMoney + this.draw.player.HEROSKILL[Player.SKILL_BUSINESS] * (this.draw.ENEMY[param1].nMoney / 5);
               _loc3_ = 0;
               while(_loc3_ < 2)
               {
                  if(this.draw.player.EQUIPINVEN[_loc3_ + Player.EQUIPINVEN_RINGPOS] == Drawing.RING_RICH)
                  {
                     _loc6_ += this.getRingAbility(this.draw.player.EQUIPINVEN[_loc3_ + Player.EQUIPINVEN_RINGPOS],this.draw.player.EQUIPINVEN[_loc3_ + Player.EQUIPINVEN_RINGPOS + Player.EQUIPINVEN_LEVELPOS]);
                  }
                  _loc3_++;
               }
               _loc4_ += _loc4_ * _loc6_ / 100;
               if(this.draw.nGameLevel == Drawing.LEVEL_EASY)
               {
                  _loc4_ = _loc4_ * 200 / 100;
               }
               else if(this.draw.nGameLevel == Drawing.LEVEL_HARD)
               {
                  _loc4_ = _loc4_ * 75 / 100;
               }
               else if(this.draw.nGameLevel == Drawing.LEVEL_HELL)
               {
                  _loc4_ = _loc4_ * 50 / 100;
               }
               this.draw.player.nMoney += _loc4_;
            }
            this.draw.player.nStageEatMoney += _loc4_;
            if(this.draw.player.nPlayTime < 900)
            {
               _loc6_ = 0;
               _loc5_ += this.draw.ENEMY[param1].nExp + this.draw.player.HEROSKILL[Player.SKILL_SEELEARN] * (this.draw.ENEMY[param1].nExp / 5);
               _loc3_ = 0;
               while(_loc3_ < 2)
               {
                  if(this.draw.player.EQUIPINVEN[_loc3_ + Player.EQUIPINVEN_RINGPOS] == Drawing.RING_EXP)
                  {
                     _loc6_ += this.getRingAbility(this.draw.player.EQUIPINVEN[_loc3_ + Player.EQUIPINVEN_RINGPOS],this.draw.player.EQUIPINVEN[_loc3_ + Player.EQUIPINVEN_RINGPOS + Player.EQUIPINVEN_LEVELPOS]);
                  }
                  _loc3_++;
               }
               _loc5_ += _loc5_ * _loc6_ / 100;
               if(this.draw.nGameLevel == Drawing.LEVEL_EASY)
               {
                  _loc5_ = _loc5_ * 200 / 100;
               }
               else if(this.draw.nGameLevel == Drawing.LEVEL_HARD)
               {
                  _loc5_ = _loc5_ * 75 / 100;
               }
               else if(this.draw.nGameLevel == Drawing.LEVEL_HELL)
               {
                  _loc5_ = _loc5_ * 50 / 100;
               }
               this.draw.player.nExp += _loc5_;
            }
            if(this.draw.player.nGameMode == Drawing.MODE_DESTINY)
            {
               ++this.draw.player.nDestinyTotalDieEnemy;
            }
            if(this.draw.ENEMY[param1].bStageBoss)
            {
               if(this.draw.player.nPlayTime < 900)
               {
                  this.draw.player.bDrawEatItem = true;
                  this.draw.player.nDrawEatItemTime = getTimer();
                  _loc8_ = true;
                  while(_loc8_)
                  {
                     this.draw.player.nEatItem = this.draw.lib.getRand(Player.MAX_ITEMNUM);
                     if(this.draw.player.nEatItem != Drawing.MACE_GOLD)
                     {
                        _loc8_ = false;
                     }
                  }
                  _loc9_ = int(this.draw.player.nStage / 12) + this.draw.player.nChapter * 2;
                  this.draw.player.nEatItemLevel = this.draw.lib.getRand(3) + 3 + _loc9_;
                  this.eatItem(this.draw.player.nEatItem,this.draw.player.nEatItemLevel);
                  _loc3_ = 0;
                  while(_loc3_ < Player.MAX_DRAWDROPITEM)
                  {
                     if(this.draw.player.DRAWDROPITEM[_loc3_] == false)
                     {
                        this.draw.player.DRAWDROPITEM[_loc3_] = true;
                        this.draw.player.DRAWDROPITEMTIME[_loc3_] = this.draw.player.nDrawEatItemTime;
                        this.draw.player.DRAWDROPITEMBAG[_loc3_] = this.draw.player.nEatItem;
                        this.draw.player.DRAWDROPITEMBAG[_loc3_ + Player.MAX_DRAWDROPITEM] = this.draw.player.nEatItemLevel;
                        break;
                     }
                     _loc3_++;
                  }
               }
            }
            else if(this.draw.player.nPlayTime < 900)
            {
               _loc7_ = 1;
               _loc6_ = 0;
               _loc7_ += this.draw.player.HEROSKILL[Player.SKILL_TREASURESEARCH] * 0.5;
               _loc3_ = 0;
               while(_loc3_ < 2)
               {
                  if(this.draw.player.EQUIPINVEN[_loc3_ + Player.EQUIPINVEN_RINGPOS] == Drawing.RING_TREASURE)
                  {
                     _loc6_ += this.getRingAbility(this.draw.player.EQUIPINVEN[_loc3_ + Player.EQUIPINVEN_RINGPOS],this.draw.player.EQUIPINVEN[_loc3_ + Player.EQUIPINVEN_RINGPOS + Player.EQUIPINVEN_LEVELPOS]);
                  }
                  _loc3_++;
               }
               _loc7_ = (_loc7_ + _loc7_ * _loc6_ / 100) * 100;
               if(this.draw.lib.getRand(10000) < _loc7_)
               {
                  this.draw.player.bDrawEatItem = true;
                  this.draw.player.nDrawEatItemTime = getTimer();
                  _loc8_ = true;
                  while(_loc8_)
                  {
                     this.draw.player.nEatItem = this.draw.lib.getRand(Player.MAX_ITEMNUM);
                     if(this.draw.player.nEatItem != Drawing.MACE_GOLD)
                     {
                        _loc8_ = false;
                     }
                  }
                  _loc10_ = int(this.draw.player.nStage / 12) + this.draw.player.nChapter * 2;
                  this.draw.player.nEatItemLevel = this.draw.lib.getRand(3) + _loc10_;
                  this.eatItem(this.draw.player.nEatItem,this.draw.player.nEatItemLevel);
                  _loc3_ = 0;
                  while(_loc3_ < Player.MAX_DRAWDROPITEM)
                  {
                     if(this.draw.player.DRAWDROPITEM[_loc3_] == false)
                     {
                        this.draw.player.DRAWDROPITEM[_loc3_] = true;
                        this.draw.player.DRAWDROPITEMTIME[_loc3_] = this.draw.player.nDrawEatItemTime;
                        this.draw.player.DRAWDROPITEMBAG[_loc3_] = this.draw.player.nEatItem;
                        this.draw.player.DRAWDROPITEMBAG[_loc3_ + Player.MAX_DRAWDROPITEM] = this.draw.player.nEatItemLevel;
                        break;
                     }
                     _loc3_++;
                  }
               }
            }
            if(this.draw.ENEMY[param1].bStageBoss)
            {
               this.enemyBossDie();
            }
            if(!this.draw.player.bBgEff)
            {
               this.draw.player.bBgEff = true;
            }
            switch(this.draw.ENEMY[param1].nBaseType)
            {
               case Drawing.ENEMY_BOSSZOMBIE:
               case Drawing.ENEMY_BOSSSOCCER:
               case Drawing.ENEMY_BOSSMUMMY:
               case Drawing.ENEMY_BOSSMANDEVIL:
                  this.draw.lib.playEffect(28);
                  break;
               case Drawing.ENEMY_BOSSWITCH:
               case Drawing.ENEMY_BOSSWOMANDEVIL:
                  this.draw.lib.playEffect(40);
                  break;
               case Drawing.ENEMY_BOSSGHOST:
               case Drawing.ENEMY_BOSSPALADOG:
                  this.draw.lib.playEffect(27);
                  break;
               case Drawing.ENEMY_BOSSDRAGON:
                  this.draw.lib.playEffect(29);
                  break;
               default:
                  this.draw.lib.playEffect(58);
            }
         }
      }
      
      public function eatItem(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < Player.INVENDATA_LEVELPOS)
         {
            if(this.draw.player.INVENDATA[_loc3_] <= Drawing.INITDATA)
            {
               this.draw.player.INVENDATA[_loc3_] = param1;
               this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS] = param2;
               break;
            }
            _loc3_++;
         }
      }
      
      public function notKnockBackEnemy(param1:int, param2:Boolean) : Boolean
      {
         if(!param2)
         {
            if(!this.draw.ENEMY[param1].bBoss && this.draw.ENEMY[param1].nBaseType != Drawing.ENEMY_STONE && this.draw.ENEMY[param1].nBaseType != Drawing.ENEMY_ARMORSHIELD && this.draw.ENEMY[param1].nBaseType != Drawing.ENEMY_BOMB)
            {
               return true;
            }
            return false;
         }
         if(!this.draw.ENEMY[param1].bBoss)
         {
            return true;
         }
         return false;
      }
      
      public function enemyBossDie() : void
      {
         this.enemyAllDie();
         this.draw.player.bStageClear = true;
         this.draw.nGameFrame = 0;
      }
      
      public function enemyAllDie() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < Drawing.MAX_ENEMYNUM)
         {
            if(this.draw.ENEMY[_loc1_].bAppear)
            {
               if(this.draw.ENEMY[_loc1_].bAlive)
               {
                  this.draw.ENEMY[_loc1_].bAttack = false;
                  this.draw.ENEMY[_loc1_].nAttackUnit = Drawing.INITDATA;
                  this.draw.ENEMY[_loc1_].nAtkFrame = 0;
                  this.draw.ENEMY[_loc1_].nHp = 0;
                  this.draw.ENEMY[_loc1_].bAlive = false;
                  this.draw.ENEMY[_loc1_].bMove = false;
                  this.draw.ENEMY[_loc1_].bIce = false;
                  this.draw.ENEMY[_loc1_].bPoison = false;
                  this.draw.ENEMY[_loc1_].bDieAni = true;
                  this.draw.ENEMY[_loc1_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                  this.getEnemyPoint(_loc1_,false);
               }
            }
            _loc1_++;
         }
      }
      
      public function unitAllKnockDown() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < Drawing.MAX_UNITNUM)
         {
            if(this.draw.UNIT[_loc1_].bAppear)
            {
               if(this.draw.UNIT[_loc1_].bAlive)
               {
                  this.draw.UNIT[_loc1_].bAttack = false;
                  this.draw.UNIT[_loc1_].nAttackEnemy = Drawing.INITDATA;
                  this.draw.UNIT[_loc1_].nAtkFrame = 0;
                  this.draw.UNIT[_loc1_].bMove = false;
                  this.draw.UNIT[_loc1_].bKnockDown = true;
                  this.draw.UNIT[_loc1_].nKnockDownDistance = Player.BOSS_KNOCKDOWNDISTANCE;
                  this.draw.UNIT[_loc1_].nKnockDownAniFrame = 0;
                  this.draw.lib.playEffect(57);
               }
            }
            _loc1_++;
         }
      }
      
      public function unitAllDie() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < Drawing.MAX_UNITNUM)
         {
            if(this.draw.UNIT[_loc1_].bAppear)
            {
               if(this.draw.UNIT[_loc1_].bAlive)
               {
                  this.draw.UNIT[_loc1_].bAttack = false;
                  this.draw.UNIT[_loc1_].nAttackEnemy = Drawing.INITDATA;
                  this.draw.UNIT[_loc1_].nAtkFrame = 0;
                  this.draw.UNIT[_loc1_].nHp = 0;
                  this.draw.UNIT[_loc1_].bAlive = false;
                  this.draw.UNIT[_loc1_].bMove = false;
                  this.draw.UNIT[_loc1_].bIce = false;
                  this.draw.UNIT[_loc1_].bPoison = false;
                  this.draw.UNIT[_loc1_].bDieAni = true;
                  this.draw.UNIT[_loc1_].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
               }
            }
            _loc1_++;
         }
      }
      
      public function enemyStationDmg(param1:int) : void
      {
         var _loc2_:int = 0;
         switch(this.draw.player.nGameMode)
         {
            case Drawing.MODE_NORMAL:
            case Drawing.MODE_BOSS:
               if(!this.draw.player.bEnemyStationCrashed)
               {
                  if(!this.draw.player.bEnemyStationAttacked)
                  {
                     this.draw.lib.playEffect(56);
                     this.draw.player.bEnemyStationAttacked = true;
                     this.draw.player.nEnemyStationAttackedFrame = 0;
                  }
                  this.draw.player.nEnemyStationHp -= param1;
                  if(this.draw.player.nEnemyStationHp <= 0)
                  {
                     this.draw.lib.playEffect(20);
                     this.draw.player.nEnemyStationHp = 0;
                     this.draw.player.bEnemyStationAttacked = false;
                     this.draw.player.nEnemyStationAttackedFrame = 0;
                     this.draw.player.bEnemyStationCrashed = true;
                     if(this.draw.player.nGameMode == Drawing.MODE_NORMAL)
                     {
                        this.enemyAllDie();
                     }
                     else
                     {
                        this.unitAllKnockDown();
                        this.draw.bBossDiaEvent = true;
                        this.draw.nBossEventTime = getTimer();
                        _loc2_ = 0;
                        while(_loc2_ < Drawing.MAX_UNITKIND)
                        {
                           this.draw.nUiPassTime[_loc2_] = getTimer();
                           _loc2_++;
                        }
                        this.setBossDialogPos();
                        this.appearNextBossEnemy();
                     }
                  }
                  if(!this.draw.player.bEnemyStationBadEnergy)
                  {
                     if(this.draw.player.nEnemyStationHp <= this.draw.player.nEnemyStationMaxHp >> 1)
                     {
                        this.draw.lib.playEffect(19);
                        this.draw.player.bEnemyStationBadEnergy = true;
                        this.draw.player.nEnemyStationBadEnergyFrame = 0;
                     }
                  }
               }
         }
      }
      
      public function enemyDmg(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         _loc4_ = int(this.draw.player.ATTACKARMSEQUIPPOS[param1]);
         _loc5_ = int(this.draw.player.HEROSKILL[Player.SKILL_MACEMASTER]);
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         switch(this.draw.player.EQUIPINVEN[_loc4_])
         {
            case Drawing.MACE_GODPUNCH:
               _loc6_ = false;
               _loc7_ = false;
               _loc2_ = 0;
               while(_loc2_ < Drawing.MAX_ENEMYNUM)
               {
                  if(this.draw.ENEMY[_loc2_].bAppear)
                  {
                     if(Boolean(this.draw.ENEMY[_loc2_].bAlive) && Boolean(!this.draw.ENEMY[_loc2_].bGhostMove) && !this.draw.ENEMY[_loc2_].bBabyGhostMove)
                     {
                        if(this.playerAlreadyAttackEnemy(param1,_loc2_) && this.draw.ENEMY[_loc2_].nPosX >= this.draw.player.SUBATTACKARMSPOSX[param1] - this.draw.ENEMY[_loc2_].nAttackedLen && this.draw.ENEMY[_loc2_].nPosX <= this.draw.player.ATTACKARMSPOSX[param1] + this.draw.ENEMY[_loc2_].nAttackedLen)
                        {
                           this.setAttacked(Player.ENEMYATTACKED,_loc2_,Drawing.HEROPOS);
                           this.draw.ENEMY[_loc2_].nHp -= 80 + 20 * (this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_);
                           if(this.draw.ENEMY[_loc2_].nHp <= 0)
                           {
                              this.draw.ENEMY[_loc2_].nHp = 0;
                              this.draw.ENEMY[_loc2_].bAlive = false;
                              this.draw.ENEMY[_loc2_].bMove = false;
                              this.draw.ENEMY[_loc2_].bIce = false;
                              this.draw.ENEMY[_loc2_].bPoison = false;
                              this.draw.ENEMY[_loc2_].bDieAni = true;
                              this.draw.ENEMY[_loc2_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                              this.getEnemyPoint(_loc2_,true);
                           }
                           else if(this.notKnockBackEnemy(_loc2_,false))
                           {
                              this.enemyKnockBack(_loc2_,Player.KNOCKBACKWIDTH);
                           }
                           if(this.draw.ENEMY[_loc2_].bDefense)
                           {
                              this.draw.lib.playEffect(59);
                           }
                           else
                           {
                              this.draw.lib.playEffect(56);
                           }
                           _loc3_ = 0;
                           while(_loc3_ < Enemy.MAX_DMG)
                           {
                              if(this.draw.ENEMY[_loc2_].DMGKIND[_loc3_] == Drawing.INITDATA)
                              {
                                 this.draw.ENEMY[_loc2_].DMGKIND[_loc3_] = Drawing.MACE_GODPUNCH;
                                 this.draw.ENEMY[_loc2_].DMGPOSX[_loc3_] = this.draw.ENEMY[_loc2_].nPosX;
                                 this.draw.ENEMY[_loc2_].DMGPOSY[_loc3_] = this.draw.ENEMY[_loc2_].nPosY + 20;
                                 this.draw.ENEMY[_loc2_].DMGANIFRAME[_loc3_] = 0;
                                 break;
                              }
                              _loc3_++;
                           }
                           this.draw.player.ATTACKENEMY[param1 * Player.MAX_ATTACKENEMY + this.draw.player.nAttackEnemyPos[param1]] = _loc2_;
                           ++this.draw.player.nAttackEnemyPos[param1];
                           --this.draw.player.ATTACKARMSNUM[param1];
                           if(this.draw.player.ATTACKARMSNUM[param1] <= 0)
                           {
                              this.initPlayerAttackObj(param1);
                              break;
                           }
                        }
                     }
                  }
                  _loc2_++;
               }
               if(this.draw.player.nGameMode != Drawing.MODE_WAGON)
               {
                  if(this.draw.player.ATTACKARMSNUM[param1] > 0 && this.draw.player.nEnemyStationHp > 0)
                  {
                     if(this.playerAlreadyAttackEnemy(param1,Drawing.ENEMYSTATION_POS) && this.draw.player.ATTACKARMSPOSX[param1] >= this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS)
                     {
                        this.draw.lib.playEffect(56);
                        this.draw.player.ATTACKENEMY[param1 * Player.MAX_ATTACKENEMY + this.draw.player.nAttackEnemyPos[param1]] = Drawing.ENEMYSTATION_POS;
                        ++this.draw.player.nAttackEnemyPos[param1];
                        --this.draw.player.ATTACKARMSNUM[param1];
                        if(this.draw.player.ATTACKARMSNUM[param1] <= 0)
                        {
                           this.initPlayerAttackObj(param1);
                        }
                        this.enemyStationDmg(80 + 20 * (this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_));
                     }
                  }
               }
               break;
            case Drawing.MACE_HEAL:
               break;
            case Drawing.MACE_TURNUNDEAD:
               _loc6_ = false;
               _loc7_ = false;
               _loc2_ = 0;
               while(_loc2_ < Drawing.MAX_ENEMYNUM)
               {
                  if(this.draw.ENEMY[_loc2_].bAppear)
                  {
                     if(Boolean(this.draw.ENEMY[_loc2_].bAlive) && Boolean(!this.draw.ENEMY[_loc2_].bGhostMove) && !this.draw.ENEMY[_loc2_].bBabyGhostMove)
                     {
                        if(this.draw.ENEMY[_loc2_].nPosX >= this.draw.player.nPosX - this.draw.ENEMY[_loc2_].nAttackedLen && this.draw.ENEMY[_loc2_].nPosX <= this.draw.player.nPosX + Player.MACE_TURNUNDEAD_AREA + this.draw.ENEMY[_loc2_].nAttackedLen)
                        {
                           if(!this.draw.ENEMY[_loc2_].bBoss && this.draw.lib.getRand(100) < 10 + 0.5 * (this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_))
                           {
                              this.setAttacked(Player.ENEMYATTACKED,_loc2_,Drawing.HEROPOS);
                              this.draw.ENEMY[_loc2_].nHp = 0;
                              this.draw.ENEMY[_loc2_].bAlive = false;
                              this.draw.ENEMY[_loc2_].bMove = false;
                              this.draw.ENEMY[_loc2_].bIce = false;
                              this.draw.ENEMY[_loc2_].bPoison = false;
                              this.draw.ENEMY[_loc2_].bDieAni = true;
                              this.draw.ENEMY[_loc2_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                              this.getEnemyPoint(_loc2_,true);
                              _loc3_ = 0;
                              while(_loc3_ < Enemy.MAX_DMG)
                              {
                                 if(this.draw.ENEMY[_loc2_].DMGKIND[_loc3_] == Drawing.INITDATA)
                                 {
                                    this.draw.ENEMY[_loc2_].DMGKIND[_loc3_] = Drawing.MACE_TURNUNDEAD;
                                    this.draw.ENEMY[_loc2_].DMGPOSX[_loc3_] = this.draw.ENEMY[_loc2_].nPosX;
                                    this.draw.ENEMY[_loc2_].DMGPOSY[_loc3_] = this.draw.ENEMY[_loc2_].nPosY;
                                    this.draw.ENEMY[_loc2_].DMGANIFRAME[_loc3_] = 0;
                                    break;
                                 }
                                 _loc3_++;
                              }
                           }
                           else
                           {
                              if(this.draw.ENEMY[_loc2_].bDefense)
                              {
                                 this.draw.lib.playEffect(59);
                              }
                              else
                              {
                                 this.draw.lib.playEffect(56);
                              }
                              this.setAttacked(Player.ENEMYATTACKED,_loc2_,Drawing.HEROPOS);
                              this.draw.ENEMY[_loc2_].nHp -= 60 + 15 * (this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_);
                              if(this.draw.ENEMY[_loc2_].nHp <= 0)
                              {
                                 this.draw.ENEMY[_loc2_].nHp = 0;
                                 this.draw.ENEMY[_loc2_].bAlive = false;
                                 this.draw.ENEMY[_loc2_].bMove = false;
                                 this.draw.ENEMY[_loc2_].bIce = false;
                                 this.draw.ENEMY[_loc2_].bPoison = false;
                                 this.draw.ENEMY[_loc2_].bDieAni = true;
                                 this.draw.ENEMY[_loc2_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                                 this.getEnemyPoint(_loc2_,true);
                              }
                              else if(this.notKnockBackEnemy(_loc2_,false))
                              {
                                 this.enemyKnockBack(_loc2_,Player.KNOCKBACKWIDTH);
                              }
                              _loc3_ = 0;
                              while(_loc3_ < Enemy.MAX_DMG)
                              {
                                 if(this.draw.ENEMY[_loc2_].DMGKIND[_loc3_] == Drawing.INITDATA)
                                 {
                                    this.draw.ENEMY[_loc2_].DMGKIND[_loc3_] = Drawing.MACE_TURNUNDEAD;
                                    this.draw.ENEMY[_loc2_].DMGPOSX[_loc3_] = this.draw.ENEMY[_loc2_].nPosX;
                                    this.draw.ENEMY[_loc2_].DMGPOSY[_loc3_] = this.draw.ENEMY[_loc2_].nPosY;
                                    this.draw.ENEMY[_loc2_].DMGANIFRAME[_loc3_] = 0;
                                    break;
                                 }
                                 _loc3_++;
                              }
                           }
                        }
                     }
                  }
                  _loc2_++;
               }
               break;
            case Drawing.MACE_ICE:
               _loc8_ = false;
               _loc6_ = false;
               _loc7_ = false;
               _loc2_ = 0;
               while(_loc2_ < Drawing.MAX_ENEMYNUM)
               {
                  if(this.draw.ENEMY[_loc2_].bAppear)
                  {
                     if(Boolean(this.draw.ENEMY[_loc2_].bAlive) && Boolean(!this.draw.ENEMY[_loc2_].bGhostMove) && !this.draw.ENEMY[_loc2_].bBabyGhostMove)
                     {
                        if(this.draw.ENEMY[_loc2_].nPosX >= this.draw.player.SUBATTACKARMSPOSX[param1] - this.draw.ENEMY[_loc2_].nAttackedLen && this.draw.ENEMY[_loc2_].nPosX <= this.draw.player.ATTACKARMSPOSX[param1] + this.draw.ENEMY[_loc2_].nAttackedLen)
                        {
                           if(this.draw.ENEMY[_loc2_].bDefense)
                           {
                              this.draw.lib.playEffect(59);
                           }
                           else
                           {
                              this.draw.lib.playEffect(56);
                           }
                           this.setAttacked(Player.ENEMYATTACKED,_loc2_,Drawing.HEROPOS);
                           this.draw.ENEMY[_loc2_].nHp -= 80 + 20 * (this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_);
                           if(this.draw.ENEMY[_loc2_].nHp <= 0)
                           {
                              this.draw.ENEMY[_loc2_].nHp = 0;
                              this.draw.ENEMY[_loc2_].bAlive = false;
                              this.draw.ENEMY[_loc2_].bMove = false;
                              this.draw.ENEMY[_loc2_].bIce = false;
                              this.draw.ENEMY[_loc2_].bPoison = false;
                              this.draw.ENEMY[_loc2_].bDieAni = true;
                              this.draw.ENEMY[_loc2_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                              this.getEnemyPoint(_loc2_,true);
                           }
                           else if(!this.draw.ENEMY[_loc2_].bBoss)
                           {
                              this.draw.ENEMY[_loc2_].bMove = false;
                              if(this.draw.ENEMY[_loc2_].bIce)
                              {
                                 if(this.notKnockBackEnemy(_loc2_,false))
                                 {
                                    this.enemyKnockBack(_loc2_,Player.KNOCKBACKWIDTH);
                                 }
                                 this.draw.ENEMY[_loc2_].nIceStartTime = getTimer();
                                 this.draw.ENEMY[_loc2_].nIceTime = (3 + int((this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_) / 5)) * 1000;
                              }
                              else
                              {
                                 this.draw.lib.playEffect(52);
                                 if(this.notKnockBackEnemy(_loc2_,false))
                                 {
                                    this.enemyKnockBack(_loc2_,Player.KNOCKBACKWIDTH);
                                 }
                                 this.draw.ENEMY[_loc2_].bIce = true;
                                 this.draw.ENEMY[_loc2_].nIceStartTime = getTimer();
                                 this.draw.ENEMY[_loc2_].nIceTime = (3 + int((this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_) / 5)) * 1000;
                                 this.draw.ENEMY[_loc2_].nIceAniFrame = 0;
                              }
                           }
                           --this.draw.player.ATTACKARMSNUM[param1];
                           if(this.draw.player.ATTACKARMSNUM[param1] <= 0)
                           {
                              this.initPlayerAttackObj(param1);
                              break;
                           }
                        }
                     }
                  }
                  _loc2_++;
               }
               if(this.draw.player.nGameMode != Drawing.MODE_WAGON)
               {
                  if(this.draw.player.ATTACKARMSNUM[param1] > 0 && this.draw.player.nEnemyStationHp > 0)
                  {
                     if(this.draw.player.ATTACKARMSPOSX[param1] >= this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS)
                     {
                        this.draw.lib.playEffect(56);
                        --this.draw.player.ATTACKARMSNUM[param1];
                        if(this.draw.player.ATTACKARMSNUM[param1] <= 0)
                        {
                           this.initPlayerAttackObj(param1);
                        }
                        this.enemyStationDmg(80 + 20 * (this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_));
                     }
                  }
               }
               break;
            case Drawing.MACE_LIGHT:
               _loc9_ = false;
               _loc2_ = 0;
               while(_loc2_ < Drawing.MAX_ENEMYNUM)
               {
                  if(this.draw.ENEMY[_loc2_].bAppear)
                  {
                     if(Boolean(this.draw.ENEMY[_loc2_].bAlive) && Boolean(!this.draw.ENEMY[_loc2_].bGhostMove) && !this.draw.ENEMY[_loc2_].bBabyGhostMove)
                     {
                        if(this.draw.ENEMY[_loc2_].nPosX >= this.draw.player.ATTACKPOSX[param1] - Player.MACE_LIGHT_DMGAREA - this.draw.ENEMY[_loc2_].nAttackedLen && this.draw.ENEMY[_loc2_].nPosX <= this.draw.player.ATTACKPOSX[param1] + Player.MACE_LIGHT_DMGAREA + this.draw.ENEMY[_loc2_].nAttackedLen)
                        {
                           this.setAttacked(Player.ENEMYATTACKED,_loc2_,Drawing.HEROPOS);
                           this.draw.ENEMY[_loc2_].nHp -= 240 + 60 * (this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_);
                           if(this.draw.ENEMY[_loc2_].nHp <= 0)
                           {
                              this.draw.ENEMY[_loc2_].nHp = 0;
                              this.draw.ENEMY[_loc2_].bAlive = false;
                              this.draw.ENEMY[_loc2_].bMove = false;
                              this.draw.ENEMY[_loc2_].bIce = false;
                              this.draw.ENEMY[_loc2_].bPoison = false;
                              this.draw.ENEMY[_loc2_].bDieAni = true;
                              this.draw.ENEMY[_loc2_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                              this.getEnemyPoint(_loc2_,true);
                           }
                           else if(this.notKnockBackEnemy(_loc2_,false))
                           {
                              this.enemyKnockBack(_loc2_,Player.KNOCKBACKWIDTH);
                           }
                           _loc3_ = 0;
                           while(_loc3_ < Enemy.MAX_DMG)
                           {
                              if(this.draw.ENEMY[_loc2_].DMGKIND[_loc3_] == Drawing.INITDATA)
                              {
                                 this.draw.ENEMY[_loc2_].DMGKIND[_loc3_] = Drawing.MACE_LIGHT;
                                 this.draw.ENEMY[_loc2_].DMGPOSX[_loc3_] = this.draw.ENEMY[_loc2_].nPosX;
                                 this.draw.ENEMY[_loc2_].DMGPOSY[_loc3_] = this.draw.ENEMY[_loc2_].nPosY;
                                 this.draw.ENEMY[_loc2_].DMGANIFRAME[_loc3_] = 0;
                                 break;
                              }
                              _loc3_++;
                           }
                           _loc9_ = true;
                        }
                     }
                  }
                  _loc2_++;
               }
               if(this.draw.player.nEnemyStationHp > 0)
               {
                  if(this.draw.player.nBgPosX + Player.BG_W - (Player.ENEMYSTATIONATKPOS >> 1) >= this.draw.player.ATTACKPOSX[param1] - Player.MACE_LIGHT_DMGAREA - (Player.ENEMYSTATIONATKPOS >> 1) && this.draw.player.nBgPosX + Player.BG_W - (Player.ENEMYSTATIONATKPOS >> 1) <= this.draw.player.ATTACKPOSX[param1] + Player.MACE_LIGHT_DMGAREA + (Player.ENEMYSTATIONATKPOS >> 1))
                  {
                     this.enemyStationDmg(240 + 60 * (this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_));
                  }
               }
               if(_loc9_)
               {
                  this.draw.lib.playEffect(64);
               }
               break;
            case Drawing.MACE_FIRE:
               _loc10_ = false;
               _loc2_ = 0;
               while(_loc2_ < Drawing.MAX_ENEMYNUM)
               {
                  if(this.draw.ENEMY[_loc2_].bAppear)
                  {
                     if(Boolean(this.draw.ENEMY[_loc2_].bAlive) && Boolean(!this.draw.ENEMY[_loc2_].bGhostMove) && !this.draw.ENEMY[_loc2_].bBabyGhostMove)
                     {
                        if(this.draw.ENEMY[_loc2_].nPosX >= this.draw.player.nPosX - this.draw.ENEMY[_loc2_].nAttackedLen && this.draw.ENEMY[_loc2_].nPosX <= this.draw.player.nPosX + Player.MACE_FIRE_AREA + this.draw.ENEMY[_loc2_].nAttackedLen)
                        {
                           this.setAttacked(Player.ENEMYATTACKED,_loc2_,Drawing.HEROPOS);
                           this.draw.ENEMY[_loc2_].nHp -= 80 + 20 * (this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_);
                           if(this.draw.ENEMY[_loc2_].nHp <= 0)
                           {
                              this.draw.ENEMY[_loc2_].nHp = 0;
                              this.draw.ENEMY[_loc2_].bAlive = false;
                              this.draw.ENEMY[_loc2_].bMove = false;
                              this.draw.ENEMY[_loc2_].bIce = false;
                              this.draw.ENEMY[_loc2_].bPoison = false;
                              this.draw.ENEMY[_loc2_].bDieAni = true;
                              this.draw.ENEMY[_loc2_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                              this.getEnemyPoint(_loc2_,true);
                           }
                           else if(this.notKnockBackEnemy(_loc2_,false))
                           {
                              this.enemyKnockBack(_loc2_,Player.KNOCKBACKWIDTH);
                           }
                           _loc3_ = 0;
                           while(_loc3_ < Enemy.MAX_DMG)
                           {
                              if(this.draw.ENEMY[_loc2_].DMGKIND[_loc3_] == Drawing.INITDATA)
                              {
                                 this.draw.ENEMY[_loc2_].DMGKIND[_loc3_] = Drawing.MACE_FIRE;
                                 this.draw.ENEMY[_loc2_].DMGPOSX[_loc3_] = this.draw.ENEMY[_loc2_].nPosX;
                                 this.draw.ENEMY[_loc2_].DMGPOSY[_loc3_] = this.draw.ENEMY[_loc2_].nPosY + 10;
                                 this.draw.ENEMY[_loc2_].DMGANIFRAME[_loc3_] = 0;
                                 break;
                              }
                              _loc3_++;
                           }
                           _loc10_ = true;
                        }
                     }
                  }
                  _loc2_++;
               }
               if(this.draw.player.nEnemyStationHp > 0)
               {
                  if(this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS >= this.draw.player.nPosX && this.draw.player.nBgPosX + Player.BG_W - Player.ENEMYSTATIONATKPOS <= this.draw.player.nPosX + 180)
                  {
                     this.enemyStationDmg(80 + 20 * (this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_));
                  }
               }
               if(_loc10_)
               {
                  this.draw.lib.playEffect(14);
               }
               break;
            case Drawing.MACE_METEO:
               _loc6_ = false;
               _loc7_ = false;
               _loc2_ = 0;
               while(_loc2_ < Drawing.MAX_ENEMYNUM)
               {
                  if(this.draw.ENEMY[_loc2_].bAppear)
                  {
                     if(Boolean(this.draw.ENEMY[_loc2_].bAlive) && Boolean(!this.draw.ENEMY[_loc2_].bGhostMove) && !this.draw.ENEMY[_loc2_].bBabyGhostMove)
                     {
                        if(this.draw.ENEMY[_loc2_].nPosX >= this.draw.player.ATTACKPOSX[param1] - Player.MACE_METEO_DMGAREA - this.draw.ENEMY[_loc2_].nAttackedLen && this.draw.ENEMY[_loc2_].nPosX <= this.draw.player.ATTACKPOSX[param1] + Player.MACE_METEO_DMGAREA + this.draw.ENEMY[_loc2_].nAttackedLen)
                        {
                           if(this.draw.ENEMY[_loc2_].bDefense)
                           {
                              this.draw.lib.playEffect(59);
                           }
                           else
                           {
                              this.draw.lib.playEffect(56);
                           }
                           this.setAttacked(Player.ENEMYATTACKED,_loc2_,Drawing.HEROPOS);
                           this.draw.ENEMY[_loc2_].nHp -= 250 + 63 * (this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_);
                           if(this.draw.ENEMY[_loc2_].nHp <= 0)
                           {
                              this.draw.ENEMY[_loc2_].nHp = 0;
                              this.draw.ENEMY[_loc2_].bAlive = false;
                              this.draw.ENEMY[_loc2_].bMove = false;
                              this.draw.ENEMY[_loc2_].bIce = false;
                              this.draw.ENEMY[_loc2_].bPoison = false;
                              this.draw.ENEMY[_loc2_].bDieAni = true;
                              this.draw.ENEMY[_loc2_].nKnockDownDistance = Player.ENEMY_KNOCKDOWNDISTANCE;
                              this.getEnemyPoint(_loc2_,true);
                           }
                           else if(this.notKnockBackEnemy(_loc2_,false))
                           {
                              this.enemyKnockBack(_loc2_,Player.KNOCKBACKWIDTH);
                           }
                        }
                     }
                  }
                  _loc2_++;
               }
               if(this.draw.player.nEnemyStationHp > 0)
               {
                  if(this.draw.player.nBgPosX + Player.BG_W - (Player.ENEMYSTATIONATKPOS >> 1) >= this.draw.player.ATTACKPOSX[param1] - Player.MACE_METEO_DMGAREA - (Player.ENEMYSTATIONATKPOS >> 1) && this.draw.player.nBgPosX + Player.BG_W - (Player.ENEMYSTATIONATKPOS >> 1) <= this.draw.player.ATTACKPOSX[param1] + Player.MACE_METEO_DMGAREA + (Player.ENEMYSTATIONATKPOS >> 1))
                  {
                     this.draw.lib.playEffect(56);
                     this.enemyStationDmg(250 + 63 * (this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_));
                  }
               }
               break;
            case Drawing.MACE_WIND:
               _loc11_ = 3 + int((this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_) / 20);
               _loc2_ = 0;
               while(_loc2_ < Drawing.MAX_ENEMYNUM)
               {
                  if(this.draw.ENEMY[_loc2_].bAppear)
                  {
                     if(Boolean(this.draw.ENEMY[_loc2_].bAlive) && Boolean(!this.draw.ENEMY[_loc2_].bGhostMove) && !this.draw.ENEMY[_loc2_].bBabyGhostMove)
                     {
                        if(this.notKnockBackEnemy(_loc2_,true) && (this.draw.ENEMY[_loc2_].nPosX >= this.draw.player.nPosX - this.draw.ENEMY[_loc2_].nAttackedLen && this.draw.ENEMY[_loc2_].nPosX <= this.draw.player.nPosX + Player.MACE_WIND_AREA + this.draw.ENEMY[_loc2_].nAttackedLen))
                        {
                           this.draw.ENEMY[_loc2_].bAttack = false;
                           this.draw.ENEMY[_loc2_].nAttackUnit = Drawing.INITDATA;
                           this.draw.ENEMY[_loc2_].bMove = false;
                           this.draw.ENEMY[_loc2_].bKnockDown = true;
                           this.draw.ENEMY[_loc2_].nKnockDownDistance = Player.MACE_WIND_DMGAREA + 15 * (this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_);
                           this.draw.ENEMY[_loc2_].nKnockDownDistance /= 32;
                           this.draw.ENEMY[_loc2_].nKnockDownAniFrame = 0;
                           this.draw.lib.playEffect(57);
                           if(--_loc11_ <= 0)
                           {
                              break;
                           }
                        }
                     }
                  }
                  _loc2_++;
               }
               break;
            case Drawing.MACE_FOOD:
               break;
            case Drawing.MACE_POISON:
               _loc12_ = false;
               _loc2_ = 0;
               while(_loc2_ < Drawing.MAX_ENEMYNUM)
               {
                  if(this.draw.ENEMY[_loc2_].bAppear)
                  {
                     if(Boolean(this.draw.ENEMY[_loc2_].bAlive) && Boolean(!this.draw.ENEMY[_loc2_].bGhostMove) && !this.draw.ENEMY[_loc2_].bBabyGhostMove)
                     {
                        if(this.draw.ENEMY[_loc2_].nPosX >= this.draw.player.SUBATTACKARMSPOSX[param1] - this.draw.ENEMY[_loc2_].nAttackedLen && this.draw.ENEMY[_loc2_].nPosX <= this.draw.player.ATTACKARMSPOSX[param1] + this.draw.ENEMY[_loc2_].nAttackedLen)
                        {
                           this.draw.lib.playEffect(56);
                           this.draw.ENEMY[_loc2_].nPoisonDps = 80 + 12 * (this.draw.player.EQUIPINVEN[_loc4_ + Player.EQUIPINVEN_LEVELPOS] + _loc5_);
                           if(this.draw.ENEMY[_loc2_].bPoison)
                           {
                              this.draw.ENEMY[_loc2_].nPoisonStartTime = getTimer();
                              this.draw.ENEMY[_loc2_].nPoisonDpsTime = getTimer();
                              this.draw.ENEMY[_loc2_].nPoisonTime = 10000;
                           }
                           else
                           {
                              if(this.notKnockBackEnemy(_loc2_,false))
                              {
                                 this.enemyKnockBack(_loc2_,Player.KNOCKBACKWIDTH);
                              }
                              this.draw.ENEMY[_loc2_].bPoison = true;
                              this.draw.ENEMY[_loc2_].nPoisonStartTime = getTimer();
                              this.draw.ENEMY[_loc2_].nPoisonDpsTime = getTimer();
                              this.draw.ENEMY[_loc2_].nPoisonTime = 10000;
                           }
                           --this.draw.player.ATTACKARMSNUM[param1];
                           if(this.draw.player.ATTACKARMSNUM[param1] <= 0)
                           {
                              this.initPlayerAttackObj(param1);
                              break;
                           }
                        }
                     }
                  }
                  _loc2_++;
               }
         }
      }
      
      public function paladogSpeedUp() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc2_ = 0;
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            if(this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS] == Drawing.RING_SPEED)
            {
               _loc2_ += this.getRingAbility(this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS],this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS + Player.EQUIPINVEN_LEVELPOS]);
            }
            _loc1_++;
         }
         this.draw.player.nMoveWidth = (Drawing.FPS + this.draw.player.HEROSKILL[Player.SKILL_RIDING] * 20 + _loc2_) / Drawing.FPS * Player.WEB_SCALE;
      }
      
      public function levelUp() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
         {
            if(this.draw.player.nLevel < Player.MAX_SURVIVALHEROLEVEL)
            {
               this.draw.player.nExp -= this.nextExp();
               this.draw.lib.playEffect(83);
               this.draw.player.bLevelUp = true;
               this.draw.player.bDrawLevelUpTurn = false;
               this.draw.player.nLevelUpSkill = Drawing.INITDATA;
               this.draw.player.nLevelUpFrame = 0;
               ++this.draw.player.nLevel;
               _loc1_ = 0;
               while(_loc1_ < 3)
               {
                  this.draw.player.SKILLINDEX[_loc1_] = Drawing.INITDATA;
                  _loc1_++;
               }
               _loc3_ = true;
               _loc4_ = 0;
               _loc5_ = 0;
               _loc6_ = new Array(Drawing.MAX_UNITKIND);
               _loc1_ = 0;
               while(_loc1_ < Drawing.MAX_UNITKIND)
               {
                  _loc6_[_loc1_] = Drawing.INITDATA;
                  if(this.draw.player.UNITOPEN[_loc1_])
                  {
                     _loc4_++;
                  }
                  _loc1_++;
               }
               while(_loc3_)
               {
                  _loc7_ = 0;
                  _loc5_ = this.draw.lib.getRand(_loc4_);
                  _loc6_[_loc5_] = _loc5_;
                  _loc1_ = 0;
                  while(_loc1_ < Drawing.MAX_UNITKIND)
                  {
                     if(_loc6_[_loc1_] > Drawing.INITDATA)
                     {
                        _loc7_++;
                     }
                     _loc1_++;
                  }
                  if(this.draw.player.UNITUPGRADE[_loc5_] < Player.MAX_UNITSKILL)
                  {
                     _loc5_ += Player.SKILL_MOUSE;
                     _loc3_ = false;
                  }
                  if(_loc7_ >= Drawing.MAX_UNITKIND)
                  {
                     if(_loc3_)
                     {
                        _loc5_ = Drawing.INITDATA;
                        _loc3_ = false;
                     }
                  }
               }
               this.draw.player.SKILLINDEX[0] = _loc5_;
               if(this.draw.player.nLevel % 5 == 0)
               {
                  if(this.draw.player.nLevel % 10 == 5)
                  {
                     if(this.draw.player.HEROSKILL[Player.SKILL_FOOD] < this.draw.player.HEROMAXSKILL[Player.SKILL_FOOD])
                     {
                        this.draw.player.SKILLINDEX[1] = Player.SKILL_FOOD;
                     }
                  }
                  else if(this.draw.player.nLevel % 10 == 0)
                  {
                     if(this.draw.player.HEROSKILL[Player.SKILL_WISH] < this.draw.player.HEROMAXSKILL[Player.SKILL_WISH])
                     {
                        this.draw.player.SKILLINDEX[1] = Player.SKILL_WISH;
                     }
                  }
                  if(this.draw.player.nLevel % 15 == 5)
                  {
                     if(this.draw.player.HEROSKILL[Player.SKILL_AREAAURA] < this.draw.player.HEROMAXSKILL[Player.SKILL_AREAAURA])
                     {
                        this.draw.player.SKILLINDEX[2] = Player.SKILL_AREAAURA;
                     }
                  }
                  else if(this.draw.player.nLevel % 15 == 10)
                  {
                     if(this.draw.player.HEROSKILL[Player.SKILL_GRANARY] < this.draw.player.HEROMAXSKILL[Player.SKILL_GRANARY])
                     {
                        this.draw.player.SKILLINDEX[2] = Player.SKILL_GRANARY;
                     }
                  }
                  else if(this.draw.player.nLevel % 15 == 0)
                  {
                     if(this.draw.player.HEROSKILL[Player.SKILL_REGENAURA] < this.draw.player.HEROMAXSKILL[Player.SKILL_REGENAURA])
                     {
                        this.draw.player.SKILLINDEX[2] = Player.SKILL_REGENAURA;
                     }
                  }
               }
               _loc2_ = this.searchEmptySurvivalSkill();
               if(_loc2_ >= Player.VIEW_SKILLNUM)
               {
                  _loc2_ = Player.VIEW_SKILLNUM;
               }
               else if(_loc2_ == Player.VIEW_SKILLNUM - 1)
               {
                  _loc1_ = 0;
                  while(_loc1_ < Player.VIEW_SKILLNUM - 1)
                  {
                     if(this.draw.player.SKILLINDEX[_loc1_] == Drawing.INITDATA)
                     {
                        this.draw.player.SKILLINDEX[_loc1_] = this.draw.player.SKILLINDEX[_loc1_ + 1];
                        this.draw.player.SKILLINDEX[_loc1_ + 1] = Drawing.INITDATA;
                     }
                     _loc1_++;
                  }
               }
               else
               {
                  _loc1_ = 1;
                  while(_loc1_ < Player.VIEW_SKILLNUM)
                  {
                     if(this.draw.player.SKILLINDEX[_loc1_] != Drawing.INITDATA)
                     {
                        this.draw.player.SKILLINDEX[0] = this.draw.player.SKILLINDEX[_loc1_];
                        this.draw.player.SKILLINDEX[_loc1_] = Drawing.INITDATA;
                        break;
                     }
                     _loc1_++;
                  }
               }
               _loc1_ = 0;
               while(_loc1_ < _loc2_)
               {
                  if(this.draw.player.SKILLINDEX[_loc1_] <= Drawing.INITDATA)
                  {
                     this.setLevelUpSurvivalSkill(_loc1_);
                  }
                  _loc1_++;
               }
            }
            else
            {
               this.draw.player.nExp = this.nextExp();
            }
         }
         else if(this.draw.player.nLevel < Player.MAX_HEROLEVEL)
         {
            this.draw.player.nExp -= this.nextExp();
            this.draw.lib.playEffect(83);
            this.draw.player.bLevelUp = true;
            this.draw.player.bDrawLevelUpTurn = false;
            this.draw.player.nLevelUpSkill = Drawing.INITDATA;
            this.draw.player.nLevelUpFrame = 0;
            ++this.draw.player.nLevel;
            _loc1_ = 0;
            while(_loc1_ < 3)
            {
               this.draw.player.SKILLINDEX[_loc1_] = Drawing.INITDATA;
               _loc1_++;
            }
            if(this.draw.player.nLevel % 5 == 0)
            {
               if(this.draw.player.HEROSKILL[Player.SKILL_FOOD] < this.draw.player.HEROMAXSKILL[Player.SKILL_FOOD])
               {
                  this.draw.player.SKILLINDEX[0] = Player.SKILL_FOOD;
               }
               if(this.draw.player.HEROSKILL[Player.SKILL_WISH] < this.draw.player.HEROMAXSKILL[Player.SKILL_WISH])
               {
                  this.draw.player.SKILLINDEX[1] = Player.SKILL_WISH;
               }
               if(this.draw.player.nLevel % 15 == 5)
               {
                  if(this.draw.player.HEROSKILL[Player.SKILL_AREAAURA] < this.draw.player.HEROMAXSKILL[Player.SKILL_AREAAURA])
                  {
                     this.draw.player.SKILLINDEX[2] = Player.SKILL_AREAAURA;
                  }
               }
               else if(this.draw.player.nLevel % 15 == 10)
               {
                  if(this.draw.player.HEROSKILL[Player.SKILL_GRANARY] < this.draw.player.HEROMAXSKILL[Player.SKILL_GRANARY])
                  {
                     this.draw.player.SKILLINDEX[2] = Player.SKILL_GRANARY;
                  }
               }
               else if(this.draw.player.nLevel % 15 == 0)
               {
                  if(this.draw.player.HEROSKILL[Player.SKILL_REGENAURA] < this.draw.player.HEROMAXSKILL[Player.SKILL_REGENAURA])
                  {
                     this.draw.player.SKILLINDEX[2] = Player.SKILL_REGENAURA;
                  }
               }
            }
            _loc2_ = this.searchEmptySkill();
            if(_loc2_ >= Player.VIEW_SKILLNUM)
            {
               _loc2_ = Player.VIEW_SKILLNUM;
            }
            else if(_loc2_ == Player.VIEW_SKILLNUM - 1)
            {
               _loc1_ = 0;
               while(_loc1_ < Player.VIEW_SKILLNUM - 1)
               {
                  if(this.draw.player.SKILLINDEX[_loc1_] == Drawing.INITDATA)
                  {
                     this.draw.player.SKILLINDEX[_loc1_] = this.draw.player.SKILLINDEX[_loc1_ + 1];
                     this.draw.player.SKILLINDEX[_loc1_ + 1] = Drawing.INITDATA;
                  }
                  _loc1_++;
               }
            }
            else
            {
               _loc1_ = 1;
               while(_loc1_ < Player.VIEW_SKILLNUM)
               {
                  if(this.draw.player.SKILLINDEX[_loc1_] != Drawing.INITDATA)
                  {
                     this.draw.player.SKILLINDEX[0] = this.draw.player.SKILLINDEX[_loc1_];
                     this.draw.player.SKILLINDEX[_loc1_] = Drawing.INITDATA;
                     break;
                  }
                  _loc1_++;
               }
            }
            _loc1_ = 0;
            while(_loc1_ < _loc2_)
            {
               if(this.draw.player.SKILLINDEX[_loc1_] <= Drawing.INITDATA)
               {
                  this.setLevelUpSkill(_loc1_);
               }
               _loc1_++;
            }
         }
         else
         {
            this.draw.player.nExp = this.nextExp();
         }
      }
      
      public function searchEmptySkill() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc2_ = 0;
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_SKILL)
         {
            if(this.draw.player.HEROSKILL[_loc1_] < this.draw.player.HEROMAXSKILL[_loc1_])
            {
               _loc2_++;
            }
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function searchEmptySurvivalSkill() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc2_ = 0;
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_SKILL)
         {
            if(this.draw.player.HEROSKILL[_loc1_] < this.draw.player.HEROSURVIVALMAXSKILL[_loc1_])
            {
               _loc2_++;
            }
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function setLevelUpSkill(param1:int) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = true;
         _loc3_ = 1;
         _loc4_ = 2;
         if(param1 == 1)
         {
            _loc3_ = 0;
            _loc4_ = 2;
         }
         else if(param1 == 2)
         {
            _loc3_ = 0;
            _loc4_ = 1;
         }
         while(_loc2_)
         {
            this.draw.player.SKILLINDEX[param1] = this.draw.lib.getRand(23);
            if(this.draw.player.HEROSKILL[this.draw.player.SKILLINDEX[param1]] < this.draw.player.HEROMAXSKILL[this.draw.player.SKILLINDEX[param1]])
            {
               if(this.draw.player.SKILLINDEX[param1] != this.draw.player.SKILLINDEX[_loc3_] && this.draw.player.SKILLINDEX[param1] != this.draw.player.SKILLINDEX[_loc4_])
               {
                  _loc2_ = false;
               }
            }
         }
      }
      
      public function setLevelUpSurvivalSkill(param1:int) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = true;
         _loc3_ = 1;
         _loc4_ = 2;
         if(param1 == 1)
         {
            _loc3_ = 0;
            _loc4_ = 2;
         }
         else if(param1 == 2)
         {
            _loc3_ = 0;
            _loc4_ = 1;
         }
         while(_loc2_)
         {
            this.draw.player.SKILLINDEX[param1] = this.draw.lib.getRand(23);
            if(this.draw.player.HEROSKILL[this.draw.player.SKILLINDEX[param1]] < this.draw.player.HEROSURVIVALMAXSKILL[this.draw.player.SKILLINDEX[param1]])
            {
               if(this.draw.player.SKILLINDEX[param1] != this.draw.player.SKILLINDEX[_loc3_] && this.draw.player.SKILLINDEX[param1] != this.draw.player.SKILLINDEX[_loc4_])
               {
                  _loc2_ = false;
               }
            }
         }
      }
      
      public function playerHp() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc2_ = 2000 + this.draw.player.HEROSKILL[Player.SKILL_HP] * 1000;
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            if(this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS] == Drawing.RING_HP)
            {
               _loc2_ += this.getRingAbility(this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS],this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS + Player.EQUIPINVEN_LEVELPOS]);
            }
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function nextExp() : int
      {
         var _loc1_:int = 0;
         return int((this.draw.player.nLevel * this.draw.player.nLevel - (this.draw.player.nLevel - 1) * (this.draw.player.nLevel - 1)) * 100);
      }
      
      public function playerMana() : Number
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         _loc2_ = 100 + this.draw.player.HEROSKILL[Player.SKILL_GODLINESS] * 50;
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            if(this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS] == Drawing.RING_MANA)
            {
               _loc2_ += this.getRingAbility(this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS],this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS + Player.EQUIPINVEN_LEVELPOS]);
            }
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function playerFood() : Number
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         _loc2_ = 0;
         if(Drawing.GAME_RELEASE)
         {
            _loc2_ = 40 + this.draw.player.HEROSKILL[Player.SKILL_GRANARY] * 40;
         }
         else
         {
            _loc2_ = 400 + this.draw.player.HEROSKILL[Player.SKILL_GRANARY] * 40;
         }
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            if(this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS] == Drawing.RING_GRANARY)
            {
               _loc2_ += this.getRingAbility(this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS],this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS + Player.EQUIPINVEN_LEVELPOS]);
            }
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function regenHp() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc2_ = 0;
         this.draw.player.nNowTime = getTimer();
         if((this.draw.player.nNowTime - this.draw.player.nHpRegenTime) * (1 + this.draw.player.nGameSpeed) >= Player.HPREGENTIME)
         {
            _loc2_ = this.draw.player.HEROSKILL[Player.SKILL_HPREGEN] * 60;
            _loc1_ = 0;
            while(_loc1_ < 2)
            {
               if(this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS] == Drawing.RING_REGEN)
               {
                  _loc2_ += this.getRingAbility(this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS],this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS + Player.EQUIPINVEN_LEVELPOS]);
               }
               _loc1_++;
            }
            this.draw.player.nHpRegenTime = getTimer();
         }
         return _loc2_;
      }
      
      public function regenMana() : Number
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         _loc2_ = 0;
         this.draw.player.nNowTime = getTimer();
         _loc2_ = 1 + this.draw.player.HEROSKILL[Player.SKILL_WISH] * 0.25;
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            if(this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS] == Drawing.RING_WISH)
            {
               _loc2_ += this.getRingAbility(this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS],this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS + Player.EQUIPINVEN_LEVELPOS]);
            }
            _loc1_++;
         }
         _loc2_ = _loc2_ / Player.MANAREGENTIME * ((this.draw.player.nNowTime - this.draw.player.nManaRegenTime) * (1 + this.draw.player.nGameSpeed));
         this.draw.player.nManaRegenTime = getTimer();
         return _loc2_;
      }
      
      public function regenFood() : Number
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         _loc2_ = 0;
         this.draw.player.nNowTime = getTimer();
         _loc2_ = 1 + this.draw.player.HEROSKILL[Player.SKILL_FOOD] * 0.25;
         _loc1_ = 0;
         while(_loc1_ < 2)
         {
            if(this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS] == Drawing.RING_FARMER)
            {
               _loc2_ += this.getRingAbility(this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS],this.draw.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_RINGPOS + Player.EQUIPINVEN_LEVELPOS]);
            }
            _loc1_++;
         }
         _loc2_ = _loc2_ / Player.FOODREGENTIME * ((this.draw.player.nNowTime - this.draw.player.nFoodRegenTime) * (1 + this.draw.player.nGameSpeed));
         this.draw.player.nFoodRegenTime = getTimer();
         return _loc2_;
      }
      
      public function getRingAbility(param1:int, param2:int) : int
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         param2 += this.draw.player.HEROSKILL[Player.SKILL_RINGMASTER];
         switch(param1)
         {
            case Drawing.RING_EXP:
               _loc3_ = 10 + param2 * 5;
               break;
            case Drawing.RING_RICH:
               _loc3_ = 10 + param2 * 5;
               break;
            case Drawing.RING_TREASURE:
               _loc3_ = 1.5 + param2 * 0.75;
               break;
            case Drawing.RING_HP:
               _loc3_ = 500 + 250 * param2;
               break;
            case Drawing.RING_REGEN:
               _loc3_ = 30 + 15 * param2;
               break;
            case Drawing.RING_SPEED:
               _loc3_ = 10 + 5 * param2;
               break;
            case Drawing.RING_MANA:
               _loc3_ = 30 + 15 * param2;
               break;
            case Drawing.RING_WISH:
               _loc3_ = 0.01 + 0.005 * param2;
               break;
            case Drawing.RING_FARMER:
               _loc3_ = 0.01 + 0.005 * param2;
               break;
            case Drawing.RING_GRANARY:
               _loc3_ = 20 + 10 * param2;
         }
         return _loc3_;
      }
      
      public function getItemPrice(param1:int, param2:int) : int
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         switch(param1)
         {
            case Drawing.MACE_GODPUNCH:
               _loc3_ = 300 + 15 * param2 * param2;
               break;
            case Drawing.MACE_HEAL:
               _loc3_ = 500 + 25 * param2 * param2;
               break;
            case Drawing.MACE_TURNUNDEAD:
               _loc3_ = 1000 + 100 * param2 * param2;
               break;
            case Drawing.MACE_ICE:
               _loc3_ = 300 + 15 * param2 * param2;
               break;
            case Drawing.MACE_LIGHT:
               _loc3_ = 800 + 40 * param2 * param2;
               break;
            case Drawing.MACE_FIRE:
               _loc3_ = 700 + 35 * param2 * param2;
               break;
            case Drawing.MACE_METEO:
               _loc3_ = 1000 + 50 * param2 * param2;
               break;
            case Drawing.MACE_WIND:
               _loc3_ = 500 + 25 * param2 * param2;
               break;
            case Drawing.MACE_FOOD:
               _loc3_ = 1000 + 50 * param2 * param2;
               break;
            case Drawing.MACE_POISON:
               _loc3_ = 800 + 40 * param2 * param2;
               break;
            case Drawing.MACE_GOLD:
               break;
            case Drawing.RING_EXP:
               _loc3_ = 800 + 40 * param2 * param2;
               break;
            case Drawing.RING_RICH:
               _loc3_ = 700 + 35 * param2 * param2;
               break;
            case Drawing.RING_TREASURE:
               _loc3_ = 600 + 30 * param2 * param2;
               break;
            case Drawing.RING_HP:
               _loc3_ = 700 + 35 * param2 * param2;
               break;
            case Drawing.RING_REGEN:
               _loc3_ = 800 + 40 * param2 * param2;
               break;
            case Drawing.RING_SPEED:
               _loc3_ = 300 + 15 * param2 * param2;
               break;
            case Drawing.RING_MANA:
               _loc3_ = 600 + 30 * param2 * param2;
               break;
            case Drawing.RING_WISH:
               _loc3_ = 1000 + 50 * param2 * param2;
               break;
            case Drawing.RING_FARMER:
               _loc3_ = 1000 + 50 * param2 * param2;
               break;
            case Drawing.RING_GRANARY:
               _loc3_ = 500 + 25 * param2 * param2;
         }
         return _loc3_;
      }
      
      public function appearNextDestinyIcon() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc1_ = 1;
         this.draw.player.nNowTime = getTimer();
         if(this.draw.player.nDestinyIconAppear < Drawing.MAX_DESTINYICONNUM)
         {
            if((this.draw.player.nNowTime - this.draw.player.nDestinyIconSetTime) * (1 + this.draw.player.nGameSpeed) >= this.draw.DESTINYDB[int(this.draw.player.nStage / 7) + this.draw.player.nChapter * 4].nCreateTime * 1000 / _loc1_)
            {
               _loc5_ = this.draw.lib.getRand(100);
               if(_loc5_ < 50)
               {
                  _loc3_ = DestinyIcon.ICON_MACE;
                  if(this.draw.player.nDestinyTotalMaceIconAppear > 0 && this.draw.player.nDestinyTotalMaceIconAppear % this.draw.DESTINYDB[int(this.draw.player.nStage / 7) + this.draw.player.nChapter * 4].APPEARDATACHANCE[4] == 0)
                  {
                     _loc4_ = int(this.draw.DESTINYDB[int(this.draw.player.nStage / 7) + this.draw.player.nChapter * 4].APPEARDATAKIND[4]);
                  }
                  else
                  {
                     _loc5_ = this.draw.lib.getRand(100);
                     _loc2_ = 0;
                     while(_loc2_ < 4)
                     {
                        if(_loc5_ < this.draw.DESTINYDB[int(this.draw.player.nStage / 7) + this.draw.player.nChapter * 4].APPEARDATACHANCE[_loc2_])
                        {
                           _loc4_ = int(this.draw.DESTINYDB[int(this.draw.player.nStage / 7) + this.draw.player.nChapter * 4].APPEARDATAKIND[_loc2_]);
                           break;
                        }
                        _loc2_++;
                     }
                  }
                  ++this.draw.player.nDestinyTotalMaceIconAppear;
               }
               else
               {
                  _loc3_ = DestinyIcon.ICON_UNIT;
                  if(this.draw.player.nDestinyTotalUnitIconAppear > 0 && this.draw.player.nDestinyTotalUnitIconAppear % this.draw.DESTINYDB[int(this.draw.player.nStage / 7) + this.draw.player.nChapter * 4 + 1].APPEARDATACHANCE[4] == 0)
                  {
                     _loc4_ = int(this.draw.DESTINYDB[int(this.draw.player.nStage / 7) + this.draw.player.nChapter * 4 + 1].APPEARDATAKIND[4]);
                  }
                  else
                  {
                     _loc5_ = this.draw.lib.getRand(100);
                     _loc2_ = 0;
                     while(_loc2_ < 4)
                     {
                        if(_loc5_ < this.draw.DESTINYDB[int(this.draw.player.nStage / 7) + this.draw.player.nChapter * 4 + 1].APPEARDATACHANCE[_loc2_])
                        {
                           _loc4_ = int(this.draw.DESTINYDB[int(this.draw.player.nStage / 7) + this.draw.player.nChapter * 4 + 1].APPEARDATAKIND[_loc2_]);
                           break;
                        }
                        _loc2_++;
                     }
                  }
                  ++this.draw.player.nDestinyTotalUnitIconAppear;
               }
               this.draw.DESTINYICON[this.draw.player.nDestinyIconAppear].nType = _loc3_;
               this.draw.DESTINYICON[this.draw.player.nDestinyIconAppear].nKind = _loc4_ - 1;
               this.draw.DESTINYICON[this.draw.player.nDestinyIconAppear].nPosX = this.draw.nLcdW;
               this.draw.DESTINYICON[this.draw.player.nDestinyIconAppear].nPosY = 431;
               this.draw.DESTINYICON[this.draw.player.nDestinyIconAppear].bAppear = true;
               this.draw.DESTINYICON[this.draw.player.nDestinyIconAppear].bMove = true;
               ++this.draw.player.nDestinyIconAppear;
               this.draw.player.nDestinyIconSetTime = getTimer();
            }
         }
      }
      
      public function setAppearEnemyTime() : int
      {
         var _loc1_:Number = NaN;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc2_ = int(int(this.draw.player.nAppearTotalEnemy / this.draw.player.nEnemyTurningPoint) % 2);
         switch(this.draw.player.nGameMode)
         {
            case Drawing.MODE_NORMAL:
            case Drawing.MODE_BOSS:
               if(this.draw.player.nEnemyStationHp <= this.draw.player.nEnemyStationMaxHp >> 1)
               {
                  if(this.draw.player.nScaleMobNum[0] > 0 || this.draw.player.nScaleMobNum[1] > 0)
                  {
                     _loc2_ = 1;
                  }
               }
               break;
            case Drawing.MODE_DESTINY:
               if(this.draw.player.nDestinyTotalDieEnemy >= Player.DESTINYTOTALENEMYNUM >> 1)
               {
                  if(!this.draw.player.bDestinyCrash)
                  {
                     this.draw.lib.playEffect(19);
                     this.draw.player.bDestinyCrash = true;
                  }
                  _loc2_ = 1;
               }
               break;
            case Drawing.MODE_WAGON:
               break;
            case Drawing.MODE_WARROAD:
               if(int(this.draw.player.nAppearTotalEnemy % this.draw.player.nEnemyTurningPoint) == 0 && this.draw.player.nAppearTotalEnemy > 0)
               {
                  _loc5_ = this.draw.lib.getRand(10000);
                  if(_loc5_ < 5000)
                  {
                     this.draw.player.bVerticalAppear = true;
                  }
                  else
                  {
                     this.draw.player.bHorizonAppear = true;
                  }
                  _loc2_ = 1;
               }
         }
         _loc1_ = 1;
         _loc3_ = this.draw.player.nCreateTime[_loc2_ * 2] * 1000 / _loc1_;
         _loc4_ = this.draw.player.nCreateTime[_loc2_ * 2 + 1] * 1000 / _loc1_;
         _loc4_ = _loc4_ + 1000;
         return _loc3_ + this.draw.lib.getRand(_loc4_ - _loc3_);
      }
      
      public function appearNextEnemy() : void
      {
         var _loc1_:int = 0;
         this.draw.player.nNowTime = getTimer();
         if((this.draw.player.nNowTime - this.draw.player.nEnemySetTime) * (1 + this.draw.player.nGameSpeed) >= this.draw.player.nAppearTime)
         {
            switch(this.draw.player.nGameMode)
            {
               case Drawing.MODE_WARROAD:
                  if(this.draw.player.bVerticalAppear)
                  {
                     _loc1_ = 0;
                     while(_loc1_ < 5)
                     {
                        this.setAppearEnemy(_loc1_,false,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA);
                        _loc1_++;
                     }
                     this.draw.player.nAppearTotalEnemy -= Player.NUM_WARROAD - 1;
                     this.draw.player.bVerticalAppear = false;
                     this.draw.lib.playEffect(19);
                  }
                  else if(this.draw.player.bHorizonAppear)
                  {
                     _loc1_ = 0;
                     while(_loc1_ < 5)
                     {
                        this.setAppearEnemy(_loc1_,false,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA);
                        _loc1_++;
                     }
                     this.draw.player.nAppearTotalEnemy -= Player.NUM_WARROAD - 1;
                     this.draw.player.bHorizonAppear = false;
                     this.draw.lib.playEffect(19);
                  }
                  else
                  {
                     this.setAppearEnemy(Drawing.INITDATA,false,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA);
                  }
                  break;
               default:
                  this.setAppearEnemy(Drawing.INITDATA,false,Drawing.INITDATA,Drawing.INITDATA,Drawing.INITDATA);
            }
         }
      }
      
      public function setBossEnemyType() : int
      {
         var _loc1_:int = 0;
         return int(Drawing.ENEMY_BOSSZOMBIE + 1 + int(this.draw.player.nStage / 12) + this.draw.player.nChapter * 2);
      }
      
      public function setEnemyType() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc3_ = false;
         _loc4_ = Drawing.INITDATA;
         _loc5_ = this.draw.lib.getRand(100);
         this.draw.player.bScaleMob = false;
         switch(this.draw.player.nGameMode)
         {
            case Drawing.MODE_NORMAL:
            case Drawing.MODE_BOSS:
               if(this.draw.player.nEnemyStationHp <= this.draw.player.nEnemyStationMaxHp >> 1)
               {
                  if(this.draw.player.nScaleMobNum[0] > 0)
                  {
                     if(this.draw.player.nScaleMobNum[1] > 0)
                     {
                        _loc5_ = this.draw.lib.getRand(1000);
                        if(_loc5_ < 500)
                        {
                           _loc2_ = int(this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].APPEARMOBKIND[1]);
                           this.draw.player.bScaleMob = true;
                           --this.draw.player.nScaleMobNum[0];
                        }
                        else
                        {
                           _loc2_ = int(this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].APPEARMOBKIND[2]);
                           this.draw.player.bScaleMob = true;
                           --this.draw.player.nScaleMobNum[1];
                        }
                     }
                     else
                     {
                        _loc2_ = int(this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].APPEARMOBKIND[1]);
                        this.draw.player.bScaleMob = true;
                        --this.draw.player.nScaleMobNum[0];
                     }
                     _loc3_ = true;
                  }
                  else if(this.draw.player.nScaleMobNum[1] > 0)
                  {
                     _loc2_ = int(this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].APPEARMOBKIND[2]);
                     this.draw.player.bScaleMob = true;
                     --this.draw.player.nScaleMobNum[1];
                     _loc3_ = true;
                  }
               }
         }
         if(!_loc3_)
         {
            if(this.draw.player.nAppearTotalEnemy > 0 && this.draw.player.nAppearTotalEnemy % this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].APPEARMOBCHANCE[4] == 0)
            {
               _loc2_ = int(this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].APPEARMOBKIND[4]);
            }
            else
            {
               _loc1_ = 0;
               while(_loc1_ < 4)
               {
                  if(_loc5_ < this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].APPEARMOBCHANCE[_loc1_])
                  {
                     _loc2_ = int(this.draw.STAGEDB[this.draw.player.nChapter * Player.MAX_STAGE + this.draw.player.nStage].APPEARMOBKIND[_loc1_]);
                     _loc4_ = _loc1_;
                     break;
                  }
                  _loc1_++;
               }
               if(_loc4_ == Player.SCALEPOS)
               {
                  _loc5_ = this.draw.lib.getRand(1000);
                  if(_loc5_ < 100)
                  {
                     this.draw.player.bScaleMob = true;
                  }
               }
            }
         }
         if(_loc2_ > Player.DB_BOSSINDEX)
         {
            _loc2_ = _loc2_ - Player.DB_BOSSINDEX + Player.TYPE_SETBOSSINDEX;
         }
         return _loc2_;
      }
      
      public function appearNextBossEnemy() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc2_ = this.setBossEnemyType();
         this.draw.player.nBossEnemyIndex = this.draw.player.nAppearEnemy;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nType = _loc2_ - 1 + Player.TYPE_SETBOSSINDEX;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType = this.draw.ENEMY[this.draw.player.nAppearEnemy].nType - Player.TYPE_SETBOSSINDEX;
         if(this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType == Drawing.ENEMY_BOSSPALADOG)
         {
            _loc1_ = 0;
            while(_loc1_ < Player.BOSSPALADOGNUM)
            {
               if(this.draw.player.BOSSPALADOGPOS[_loc1_] == Drawing.INITDATA)
               {
                  this.draw.player.BOSSPALADOGPOS[_loc1_] = this.draw.player.nBossEnemyIndex;
                  this.draw.ENEMY[this.draw.player.nBossEnemyIndex].nBossPaladogEffectPos = _loc1_;
                  break;
               }
               _loc1_++;
            }
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nSizeScale = 100;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nLoopEffSnd = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].n3DMaxAniFrame = 0;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBaby = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bGhostMove = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBabyGhostMoving = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bInvisible = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bVisible = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nGhostStartTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nGhostTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nBabyGhostMoveDistance = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBabyGhostMove = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBabyInvisible = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBabyVisible = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBabyGhostMoveOk = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nBabyGhostStartTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nBabyGhostTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBomb = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bAppear = true;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bAlive = true;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bMove = true;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBoss = true;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bStageBoss = true;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bDefense = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bPoison = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nPoisonStartTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nPoisonTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nPoisonDps = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nPoisonDpsTime = Drawing.INITDATA;
         _loc1_ = 0;
         while(_loc1_ < Enemy.MAX_ENEMYATTACK)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].ATTACKANI[_loc1_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].ATTACKANI[_loc1_ + Enemy.MAX_ENEMYATTACK] = 0;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].ATTACKPOSX[_loc1_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].ATTACKPOSY[_loc1_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].ATTACKARMSPOSX[_loc1_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].ATTACKARMSPOSY[_loc1_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].SUBATTACKARMSPOSX[_loc1_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].ATTACKARMSNUM[_loc1_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].ATTACKENEMY[_loc1_] = Drawing.INITDATA;
            _loc1_++;
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAtkFrame = 0;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAtkTotalFrame = this.draw.player.ENEMYATKTOTALFRAME[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType];
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bIce = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nIceStartTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nIceTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nIceAniFrame = 0;
         _loc1_ = 0;
         while(_loc1_ < Enemy.MAX_DMG)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].DMGKIND[_loc1_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].DMGPOSX[_loc1_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].DMGPOSY[_loc1_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].DMGANIFRAME[_loc1_] = 0;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].DMGFROMUNIT[_loc1_] = Drawing.INITDATA;
            _loc1_++;
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nPosX = Player.BG_W + this.draw.player.nBgPosX - 50;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nPosY = Player.BG_BASEPOSY + Player.PLAYER_BASEPOSY;
         this.sortObjPos();
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nHp;
         if(this.draw.nGameLevel == Drawing.LEVEL_EASY)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp = this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp * 75 / 100;
         }
         else if(this.draw.nGameLevel == Drawing.LEVEL_HARD)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp = this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp * 150 / 100;
         }
         else if(this.draw.nGameLevel == Drawing.LEVEL_HELL)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp = this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp * 200 / 100;
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nHp = this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nMoney = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nMoney;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nExp = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nExp;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttack = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nAttack;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackDelay = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nAttackDelay + 25;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackDelayStartTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackLen = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nAttackDistance * Player.WEB_SCALE + Player.KNOCKBACKWIDTH;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackedLen = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nAttackedRange * Player.WEB_SCALE;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackNum = this.draw.player.ENEMYATTACKNUM[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType];
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bAttacked = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackedFrame = 0;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nBattleLen = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nAttackDistance * Player.WEB_SCALE;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bLastAttackFrame = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bAttackReady = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nPps = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nMove_pps * Player.WEB_SCALE;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nStep = 0;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nDieFrame = 0;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nArmsPosX = 0;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nArmsPosY = 0;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bAttack = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackUnit = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackedUnit = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bDieAni = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBombDie = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bKnockDown = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nKnockDownAniFrame = 0;
         ++this.draw.player.nAppearEnemy;
         if(this.draw.player.nAppearEnemy >= Drawing.MAX_ENEMYNUM)
         {
            this.draw.player.nAppearEnemy = 0;
         }
      }
      
      public function setAppearEnemy(param1:int, param2:Boolean, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Boolean = false;
         var _loc10_:int = 0;
         _loc8_ = 0;
         _loc9_ = false;
         if(this.draw.player.nBossEnemyIndex == this.draw.player.nAppearEnemy)
         {
            ++this.draw.player.nAppearEnemy;
            if(this.draw.player.nAppearEnemy >= Drawing.MAX_ENEMYNUM)
            {
               this.draw.player.nAppearEnemy = 0;
            }
         }
         while(Boolean(this.draw.ENEMY[this.draw.player.nAppearEnemy].bAppear) || Boolean(this.draw.ENEMY[this.draw.player.nAppearEnemy].bArrive))
         {
            ++this.draw.player.nAppearEnemy;
            if(this.draw.player.nAppearEnemy >= Drawing.MAX_ENEMYNUM)
            {
               this.draw.player.nAppearEnemy = 0;
            }
            if(++_loc8_ >= Drawing.MAX_ENEMYNUM)
            {
               _loc9_ = true;
               break;
            }
         }
         if(_loc9_)
         {
            return;
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBaby = false;
         if(!param2)
         {
            _loc7_ = this.setEnemyType();
         }
         else
         {
            switch(param3)
            {
               case Drawing.ENEMY_BOSSZOMBIE:
                  _loc7_ = Drawing.ENEMY_ZOMBIE + 1;
                  this.draw.ENEMY[this.draw.player.nAppearEnemy].bBaby = true;
                  break;
               case Drawing.ENEMY_BOSSMUMMY:
                  _loc7_ = Drawing.ENEMY_MUMMY + 1;
                  this.draw.ENEMY[this.draw.player.nAppearEnemy].bBaby = true;
                  break;
               default:
                  return;
            }
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nBossPaladogEffectPos = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nType = _loc7_ - 1;
         if(this.draw.ENEMY[this.draw.player.nAppearEnemy].nType >= Player.TYPE_BOSS)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType = this.draw.ENEMY[this.draw.player.nAppearEnemy].nType - Player.TYPE_SETBOSSINDEX;
            if(this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType == Drawing.ENEMY_BOSSPALADOG)
            {
               _loc6_ = 0;
               while(_loc6_ < Player.BOSSPALADOGNUM)
               {
                  if(this.draw.player.BOSSPALADOGPOS[_loc6_] == Drawing.INITDATA)
                  {
                     this.draw.player.BOSSPALADOGPOS[_loc6_] = this.draw.player.nAppearEnemy;
                     this.draw.ENEMY[this.draw.player.nAppearEnemy].nBossPaladogEffectPos = _loc6_;
                     break;
                  }
                  _loc6_++;
               }
            }
         }
         else
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType = this.draw.ENEMY[this.draw.player.nAppearEnemy].nType % 20;
         }
         if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nSizeScale = Player.ENEMY_SCALE_WARROAD;
         }
         else
         {
            if(this.draw.player.bScaleMob)
            {
               this.draw.ENEMY[this.draw.player.nAppearEnemy].nSizeScale = Player.ENEMY_SCALE_UP;
            }
            else
            {
               this.draw.ENEMY[this.draw.player.nAppearEnemy].nSizeScale = Player.ENEMY_SCALE_NORMAL;
            }
            if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
            {
               this.draw.ENEMY[this.draw.player.nAppearEnemy].nSizeScale *= 1 + (this.draw.player.nSurvivalRotation - 1) * 0.1;
            }
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nLoopEffSnd = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].n3DMaxAniFrame = 0;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bGhostMove = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBabyGhostMoving = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bInvisible = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bVisible = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nGhostStartTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nGhostTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nBabyGhostMoveDistance = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBabyGhostMove = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBabyInvisible = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBabyVisible = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBabyGhostMoveOk = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nBabyGhostStartTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nBabyGhostTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bAppear = true;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bAlive = true;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bMove = true;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBomb = false;
         if(this.draw.ENEMY[this.draw.player.nAppearEnemy].nType >= Player.TYPE_BOSS)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].bBoss = true;
         }
         else
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].bBoss = false;
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bStageBoss = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bDefense = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bPoison = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nPoisonStartTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nPoisonTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nPoisonDps = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nPoisonDpsTime = Drawing.INITDATA;
         _loc6_ = 0;
         while(_loc6_ < Enemy.MAX_ENEMYATTACK)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].ATTACKANI[_loc6_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].ATTACKANI[_loc6_ + Enemy.MAX_ENEMYATTACK] = 0;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].ATTACKPOSX[_loc6_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].ATTACKPOSY[_loc6_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].ATTACKARMSPOSX[_loc6_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].ATTACKARMSPOSY[_loc6_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].SUBATTACKARMSPOSX[_loc6_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].ATTACKARMSNUM[_loc6_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].ATTACKENEMY[_loc6_] = Drawing.INITDATA;
            _loc6_++;
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAtkFrame = 0;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAtkTotalFrame = this.draw.player.ENEMYATKTOTALFRAME[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType];
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bIce = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nIceStartTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nIceTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nIceAniFrame = 0;
         _loc6_ = 0;
         while(_loc6_ < Enemy.MAX_DMG)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].DMGKIND[_loc6_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].DMGPOSX[_loc6_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].DMGPOSY[_loc6_] = Drawing.INITDATA;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].DMGANIFRAME[_loc6_] = 0;
            this.draw.ENEMY[this.draw.player.nAppearEnemy].DMGFROMUNIT[_loc6_] = Drawing.INITDATA;
            _loc6_++;
         }
         switch(this.draw.player.nGameMode)
         {
            case Drawing.MODE_NORMAL:
            case Drawing.MODE_WAGON:
            case Drawing.MODE_BOSS:
            case Drawing.MODE_SURVIVAL:
               if(!param2)
               {
                  this.draw.ENEMY[this.draw.player.nAppearEnemy].nPosX = Player.BG_W + this.draw.player.nBgPosX;
               }
               else
               {
                  this.draw.ENEMY[this.draw.player.nAppearEnemy].nPosX = param4;
               }
               break;
            case Drawing.MODE_DESTINY:
               this.draw.ENEMY[this.draw.player.nAppearEnemy].nPosX = this.draw.nLcdW + 10;
               break;
            case Drawing.MODE_WARROAD:
               if(this.draw.player.bHorizonAppear)
               {
                  this.draw.ENEMY[this.draw.player.nAppearEnemy].nPosX = this.draw.nLcdW + 10 + param1 * 50;
               }
               else
               {
                  this.draw.ENEMY[this.draw.player.nAppearEnemy].nPosX = this.draw.nLcdW + 10;
               }
         }
         if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
         {
            _loc10_ = 0;
            if(this.draw.player.bVerticalAppear)
            {
               this.draw.ENEMY[this.draw.player.nAppearEnemy].nPosY = this.draw.player.nWarRoadAppearPosY[param1];
            }
            else if(this.draw.player.bHorizonAppear)
            {
               if(param1 == 0)
               {
                  this.draw.player.nWarRoadGroupPosY = this.draw.lib.getRand(Player.NUM_WARROAD);
               }
               this.draw.ENEMY[this.draw.player.nAppearEnemy].nPosY = this.draw.player.nWarRoadAppearPosY[this.draw.player.nWarRoadGroupPosY];
            }
            else
            {
               _loc10_ = this.draw.lib.getRand(Player.NUM_WARROAD);
               this.draw.ENEMY[this.draw.player.nAppearEnemy].nPosY = this.draw.player.nWarRoadAppearPosY[_loc10_];
            }
         }
         else if(!param2)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nPosY = this.draw.ENEMY[this.draw.player.nAppearEnemy].BASEPOSY + this.draw.lib.getRand(Player.OBJ_BASE_RANGE);
         }
         else
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nPosY = param5;
         }
         this.sortObjPos();
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nHp;
         if(this.draw.nGameLevel == Drawing.LEVEL_EASY)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp = this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp * 75 / 100;
         }
         else if(this.draw.nGameLevel == Drawing.LEVEL_HARD)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp = this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp * 150 / 100;
         }
         else if(this.draw.nGameLevel == Drawing.LEVEL_HELL)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp = this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp * 200 / 100;
         }
         if(this.draw.ENEMY[this.draw.player.nAppearEnemy].nType >= 20 && this.draw.ENEMY[this.draw.player.nAppearEnemy].nType < Player.TYPE_BOSS)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp = this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp * 13 / 10;
         }
         if(this.draw.player.bScaleMob)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp = this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp * 33 / 10;
         }
         if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp = int(this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp * 1.1 * (1.1 + 7 * (this.draw.player.nSurvivalRotation - 1) * (this.draw.player.nSurvivalRotation - 1)));
            if(this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType >= Drawing.ENEMY_BOSSZOMBIE)
            {
               this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp *= 0.2;
               if(this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType == Drawing.ENEMY_BOSSMANDEVIL)
               {
                  this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp *= 0.5;
               }
            }
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nHp = this.draw.ENEMY[this.draw.player.nAppearEnemy].nMaxHp;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nMoney = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nMoney;
         if(this.draw.ENEMY[this.draw.player.nAppearEnemy].nType >= 20 && this.draw.ENEMY[this.draw.player.nAppearEnemy].nType < Player.TYPE_BOSS)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nMoney = this.draw.ENEMY[this.draw.player.nAppearEnemy].nMoney * 13 / 10;
         }
         if(this.draw.player.bScaleMob)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nMoney = this.draw.ENEMY[this.draw.player.nAppearEnemy].nMoney * 33 / 10;
         }
         if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nMoney = int(this.draw.ENEMY[this.draw.player.nAppearEnemy].nMoney * 1.1 * (1.1 + 7 * (this.draw.player.nSurvivalRotation - 1)));
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nExp = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nExp;
         if(this.draw.ENEMY[this.draw.player.nAppearEnemy].nType >= 20 && this.draw.ENEMY[this.draw.player.nAppearEnemy].nType < Player.TYPE_BOSS)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nExp = this.draw.ENEMY[this.draw.player.nAppearEnemy].nExp * 13 / 10;
         }
         if(this.draw.player.bScaleMob)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nExp = this.draw.ENEMY[this.draw.player.nAppearEnemy].nExp * 33 / 10;
         }
         if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nExp = int(this.draw.ENEMY[this.draw.player.nAppearEnemy].nExp * 1.1 * (1 + (this.draw.player.nSurvivalRotation - 1)) * 27);
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttack = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nAttack;
         if(this.draw.ENEMY[this.draw.player.nAppearEnemy].nType >= 20 && this.draw.ENEMY[this.draw.player.nAppearEnemy].nType < Player.TYPE_BOSS)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttack = this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttack * 13 / 10;
         }
         if(this.draw.player.bScaleMob)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttack = this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttack * 33 / 10;
         }
         if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttack = int(this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttack * 1.1 * (1.1 + 7 * (this.draw.player.nSurvivalRotation - 1) * (this.draw.player.nSurvivalRotation - 1)));
            if(this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType == Drawing.ENEMY_BOSSDRAGON)
            {
               this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttack *= 0.5;
            }
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackDelay = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nAttackDelay + 25;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackDelayStartTime = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackLen = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nAttackDistance * Player.WEB_SCALE + Player.KNOCKBACKWIDTH;
         if(this.draw.player.bScaleMob)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackLen = this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackLen * 12 / 10;
         }
         if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackLen >>= 1;
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackedLen = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nAttackedRange * Player.WEB_SCALE;
         if(this.draw.player.bScaleMob)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackedLen = this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackedLen * 12 / 10;
         }
         if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackedLen >>= 1;
         }
         if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackedLen *= 1 + (this.draw.player.nSurvivalRotation - 1) * 0.1;
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackNum = this.draw.player.ENEMYATTACKNUM[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType];
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bAttacked = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackedFrame = 0;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bLastAttackFrame = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bAttackReady = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bDrawAttackedEff = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nDrawAttackedEffFrame = 0;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nBattleLen = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nAttackDistance * Player.WEB_SCALE;
         if(this.draw.player.bScaleMob)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nBattleLen = this.draw.ENEMY[this.draw.player.nAppearEnemy].nBattleLen * 12 / 10;
         }
         if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nBattleLen >>= 1;
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nPps = this.draw.ENEMYDB[this.draw.ENEMY[this.draw.player.nAppearEnemy].nBaseType].nMove_pps * Player.WEB_SCALE;
         if(this.draw.player.bScaleMob)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nPps = this.draw.ENEMY[this.draw.player.nAppearEnemy].nPps * 12 / 10;
         }
         if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nPps >>= 1;
         }
         if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
         {
            this.draw.ENEMY[this.draw.player.nAppearEnemy].nPps *= 1 + (this.draw.player.nSurvivalRotation - 1) * 0.1;
         }
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nStep = 0;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nDieFrame = 0;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nArmsPosX = 0;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nArmsPosY = 0;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bAttack = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackUnit = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nAttackedUnit = Drawing.INITDATA;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bDieAni = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bBombDie = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].bKnockDown = false;
         this.draw.ENEMY[this.draw.player.nAppearEnemy].nKnockDownAniFrame = 0;
         ++this.draw.player.nAppearTotalEnemy;
         ++this.draw.player.nAppearEnemy;
         if(this.draw.player.nAppearEnemy >= Drawing.MAX_ENEMYNUM)
         {
            this.draw.player.nAppearEnemy = 0;
         }
         this.draw.player.nEnemySetTime = getTimer();
         this.draw.player.nAppearTime = this.setAppearEnemyTime();
         this.draw.player.bScaleMob = false;
      }
      
      public function appearNextUnit(param1:int, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(!param2)
         {
            if(this.draw.lib.getRand(10000) < 2000)
            {
               this.draw.lib.playEffect(68);
            }
            this.setUnitAppearCost(param1);
         }
         this.draw.UNIT[this.draw.player.nAppearUnit].nType = param1;
         if(this.draw.player.nNotUseUnitIndex > Drawing.INITDATA)
         {
            if(this.draw.player.nNotUseUnitIndex == this.draw.UNIT[this.draw.player.nAppearUnit].nType)
            {
               ++this.draw.player.nNotUseUnitNum;
            }
         }
         if(this.draw.player.nUseUnitIndex > Drawing.INITDATA)
         {
            if(this.draw.player.nUseUnitIndex == this.draw.UNIT[this.draw.player.nAppearUnit].nType)
            {
               ++this.draw.player.nUseUnitNum;
            }
         }
         this.draw.UNIT[this.draw.player.nAppearUnit].n3DMaxAniFrame = 0;
         this.draw.UNIT[this.draw.player.nAppearUnit].bWarningHp = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].bAppear = true;
         this.draw.UNIT[this.draw.player.nAppearUnit].bAlive = true;
         this.draw.UNIT[this.draw.player.nAppearUnit].bMove = true;
         this.draw.UNIT[this.draw.player.nAppearUnit].bArrive = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].bFrog = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].bReturnFromFrog = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].nFrogStartTime = Drawing.INITDATA;
         this.draw.UNIT[this.draw.player.nAppearUnit].nFrogTime = Drawing.INITDATA;
         this.draw.UNIT[this.draw.player.nAppearUnit].nFrogAniFrame = 0;
         this.draw.UNIT[this.draw.player.nAppearUnit].bHealing = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].nHealingFrame = 0;
         _loc4_ = 0;
         while(_loc4_ < Unit.MAX_UNITATTACK)
         {
            this.draw.UNIT[this.draw.player.nAppearUnit].ATTACKANI[_loc4_] = Drawing.INITDATA;
            this.draw.UNIT[this.draw.player.nAppearUnit].ATTACKANI[_loc4_ + Unit.MAX_UNITATTACK] = 0;
            this.draw.UNIT[this.draw.player.nAppearUnit].ATTACKPOSX[_loc4_] = Drawing.INITDATA;
            this.draw.UNIT[this.draw.player.nAppearUnit].ATTACKPOSY[_loc4_] = Drawing.INITDATA;
            this.draw.UNIT[this.draw.player.nAppearUnit].ATTACKARMSPOSX[_loc4_] = Drawing.INITDATA;
            this.draw.UNIT[this.draw.player.nAppearUnit].ATTACKARMSPOSY[_loc4_] = Drawing.INITDATA;
            this.draw.UNIT[this.draw.player.nAppearUnit].SUBATTACKARMSPOSX[_loc4_] = Drawing.INITDATA;
            this.draw.UNIT[this.draw.player.nAppearUnit].ATTACKARMSNUM[_loc4_] = Drawing.INITDATA;
            _loc5_ = 0;
            while(_loc5_ < Unit.MAX_ATTACKENEMY)
            {
               this.draw.UNIT[this.draw.player.nAppearUnit].ATTACKENEMY[_loc4_ * Unit.MAX_ATTACKENEMY + _loc5_] = Drawing.INITDATA;
               _loc5_++;
            }
            this.draw.UNIT[this.draw.player.nAppearUnit].nAttackEnemyPos[_loc4_] = 0;
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < Unit.MAX_DMG)
         {
            this.draw.UNIT[this.draw.player.nAppearUnit].DMGKIND[_loc4_] = Drawing.INITDATA;
            this.draw.UNIT[this.draw.player.nAppearUnit].DMGPOSX[_loc4_] = Drawing.INITDATA;
            this.draw.UNIT[this.draw.player.nAppearUnit].DMGPOSY[_loc4_] = Drawing.INITDATA;
            this.draw.UNIT[this.draw.player.nAppearUnit].DMGANIFRAME[_loc4_] = 0;
            this.draw.UNIT[this.draw.player.nAppearUnit].DMGFROMENEMY[_loc4_] = Drawing.INITDATA;
            _loc4_++;
         }
         if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
         {
            this.draw.UNIT[this.draw.player.nAppearUnit].nPosX = this.draw.player.nBgPosX - 10;
            if(this.draw.player.nAttackHorizonPosX > Drawing.INITDATA)
            {
               this.draw.UNIT[this.draw.player.nAppearUnit].nPosX -= this.draw.player.nAttackHorizonPosX * 50;
            }
            this.draw.UNIT[this.draw.player.nAppearUnit].nPosY = this.draw.player.nWarRoadAppearPosY[this.draw.player.nWarRoadUnitPos];
         }
         else
         {
            this.draw.UNIT[this.draw.player.nAppearUnit].nPosX = this.draw.player.nBgPosX - 50;
            this.draw.UNIT[this.draw.player.nAppearUnit].nPosY = this.setUnitPosY(this.draw.UNITDB[this.draw.UNIT[this.draw.player.nAppearUnit].nType].nCreateLine - 1);
         }
         this.sortObjPos();
         if(param3)
         {
            this.draw.UNIT[this.draw.player.nAppearUnit].nMaxHp = this.draw.player.UNITUPGRADEHP[param1 * Drawing.MAX_UNITLEVEL + ((int(this.draw.player.nStage / 14) + this.draw.player.nChapter * 2) * 2 + 1) - 1];
         }
         else if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
         {
            this.draw.UNIT[this.draw.player.nAppearUnit].nMaxHp = this.draw.player.UNITUPGRADEHP[param1 * Drawing.MAX_UNITLEVEL];
            _loc6_ = (this.draw.player.UNITUPGRADE[param1] - 1) * 0.2;
            _loc6_ = _loc6_ * this.draw.player.UNITUPGRADEHP[param1 * Drawing.MAX_UNITLEVEL];
            this.draw.UNIT[this.draw.player.nAppearUnit].nMaxHp += _loc6_;
         }
         else
         {
            this.draw.UNIT[this.draw.player.nAppearUnit].nMaxHp = this.draw.player.UNITUPGRADEHP[param1 * Drawing.MAX_UNITLEVEL + this.draw.player.UNITUPGRADE[param1] - 1];
         }
         this.draw.UNIT[this.draw.player.nAppearUnit].nHp = this.draw.UNIT[this.draw.player.nAppearUnit].nMaxHp;
         this.draw.UNIT[this.draw.player.nAppearUnit].nHpRegenTime = getTimer();
         this.draw.UNIT[this.draw.player.nAppearUnit].nBattleLen = this.draw.UNITDB[this.draw.UNIT[this.draw.player.nAppearUnit].nType].nAttackDistance * Player.WEB_SCALE;
         if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
         {
            this.draw.UNIT[this.draw.player.nAppearUnit].nBattleLen >>= 1;
         }
         this.draw.UNIT[this.draw.player.nAppearUnit].bIce = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].nIceStartTime = Drawing.INITDATA;
         this.draw.UNIT[this.draw.player.nAppearUnit].nIceTime = Drawing.INITDATA;
         this.draw.UNIT[this.draw.player.nAppearUnit].nIceAniFrame = 0;
         this.draw.UNIT[this.draw.player.nAppearUnit].bPoison = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].nPoisonStartTime = Drawing.INITDATA;
         this.draw.UNIT[this.draw.player.nAppearUnit].nPoisonTime = Drawing.INITDATA;
         this.draw.UNIT[this.draw.player.nAppearUnit].nPoisonDps = Drawing.INITDATA;
         this.draw.UNIT[this.draw.player.nAppearUnit].nPoisonDpsTime = Drawing.INITDATA;
         if(param3)
         {
            this.draw.UNIT[this.draw.player.nAppearUnit].nAttack = this.draw.player.UNITUPGRADEATTACK[param1 * Drawing.MAX_UNITLEVEL + ((int(this.draw.player.nStage / 14) + this.draw.player.nChapter * 2) * 2 + 1) - 1];
         }
         else if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
         {
            this.draw.UNIT[this.draw.player.nAppearUnit].nAttack = this.draw.player.UNITUPGRADEATTACK[param1 * Drawing.MAX_UNITLEVEL];
            _loc7_ = (this.draw.player.UNITUPGRADE[param1] - 1) * 0.2;
            _loc7_ = _loc7_ * this.draw.player.UNITUPGRADEATTACK[param1 * Drawing.MAX_UNITLEVEL];
            this.draw.UNIT[this.draw.player.nAppearUnit].nAttack += _loc7_;
         }
         else
         {
            this.draw.UNIT[this.draw.player.nAppearUnit].nAttack = this.draw.player.UNITUPGRADEATTACK[param1 * Drawing.MAX_UNITLEVEL + this.draw.player.UNITUPGRADE[param1] - 1];
         }
         this.draw.UNIT[this.draw.player.nAppearUnit].nAttackDelay = this.draw.UNITDB[this.draw.UNIT[this.draw.player.nAppearUnit].nType].nAttackDelay + 25;
         this.draw.UNIT[this.draw.player.nAppearUnit].nAttackDelayStartTime = Drawing.INITDATA;
         this.draw.UNIT[this.draw.player.nAppearUnit].bLastAttackFrame = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].bAttackReady = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].nAttackLen = this.draw.UNITDB[this.draw.UNIT[this.draw.player.nAppearUnit].nType].nAttackDistance * Player.WEB_SCALE + Player.KNOCKBACKWIDTH;
         if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
         {
            this.draw.UNIT[this.draw.player.nAppearUnit].nAttackLen >>= 1;
         }
         this.draw.UNIT[this.draw.player.nAppearUnit].nAttackedLen = this.draw.UNITDB[this.draw.UNIT[this.draw.player.nAppearUnit].nType].nAttackedRange * Player.WEB_SCALE;
         if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
         {
            this.draw.UNIT[this.draw.player.nAppearUnit].nAttackedLen >>= 1;
         }
         this.draw.UNIT[this.draw.player.nAppearUnit].nAttackNum = this.draw.player.UNITATTACKNUM[this.draw.UNIT[this.draw.player.nAppearUnit].nType];
         this.draw.UNIT[this.draw.player.nAppearUnit].bAttacked = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].nAttackedFrame = 0;
         this.draw.UNIT[this.draw.player.nAppearUnit].bAttackedStop = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].nAttackedTime = Drawing.INITDATA;
         this.draw.UNIT[this.draw.player.nAppearUnit].nDiePos = Drawing.INITDATA;
         this.draw.UNIT[this.draw.player.nAppearUnit].bDrawAttackedEff = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].nDrawAttackedEffFrame = 0;
         this.draw.UNIT[this.draw.player.nAppearUnit].nSkillAttackLen = this.draw.UNITDB[this.draw.UNIT[this.draw.player.nAppearUnit].nType].nSkillDistance * Player.WEB_SCALE;
         if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
         {
            this.draw.UNIT[this.draw.player.nAppearUnit].nSkillAttackLen >>= 1;
         }
         this.draw.UNIT[this.draw.player.nAppearUnit].nSkillAttackNum = this.draw.player.UNITSKILLATTACKNUM[this.draw.UNIT[this.draw.player.nAppearUnit].nType];
         this.draw.UNIT[this.draw.player.nAppearUnit].nSkillAttack = this.draw.UNITDB[this.draw.UNIT[this.draw.player.nAppearUnit].nType].nSkillAttack;
         this.draw.UNIT[this.draw.player.nAppearUnit].nSkillChance = this.draw.UNITDB[this.draw.UNIT[this.draw.player.nAppearUnit].nType].nSkillChance;
         this.draw.UNIT[this.draw.player.nAppearUnit].nSkillKnockDownChance = this.draw.UNITDB[this.draw.UNIT[this.draw.player.nAppearUnit].nType].nSkillKnockDownChance;
         this.draw.UNIT[this.draw.player.nAppearUnit].bSkillAtk = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].bInAura = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].bDefense = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].nAtkFrame = 0;
         this.draw.UNIT[this.draw.player.nAppearUnit].nAtk1TotalFrame = this.draw.player.UNITATKTOTALFRAME[this.draw.UNIT[this.draw.player.nAppearUnit].nType];
         this.draw.UNIT[this.draw.player.nAppearUnit].nAtk2TotalFrame = this.draw.player.UNITATKTOTALFRAME[this.draw.UNIT[this.draw.player.nAppearUnit].nType + 9];
         this.draw.UNIT[this.draw.player.nAppearUnit].nPps = this.draw.UNITDB[this.draw.UNIT[this.draw.player.nAppearUnit].nType].nMove_pps;
         if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
         {
            this.draw.UNIT[this.draw.player.nAppearUnit].nPps >>= 1;
         }
         this.draw.UNIT[this.draw.player.nAppearUnit].nStep = 0;
         this.draw.UNIT[this.draw.player.nAppearUnit].nDieFrame = 0;
         this.draw.UNIT[this.draw.player.nAppearUnit].nArmsPosX = 0;
         this.draw.UNIT[this.draw.player.nAppearUnit].nArmsPosY = 0;
         this.draw.UNIT[this.draw.player.nAppearUnit].bAttack = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].nAttackEnemy = Drawing.INITDATA;
         this.draw.UNIT[this.draw.player.nAppearUnit].nAttackedEnemy = Drawing.INITDATA;
         this.draw.UNIT[this.draw.player.nAppearUnit].bDieAni = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].bBombDie = false;
         this.draw.UNIT[this.draw.player.nAppearUnit].bKnockDown = false;
         ++this.draw.player.nAppearUnit;
         if(this.draw.player.nAppearUnit >= Player.WAGONPOS)
         {
            this.draw.player.nAppearUnit = 0;
         }
      }
      
      public function setUnitAppearCost(param1:int) : void
      {
         this.draw.player.nFood -= this.draw.player.UNITCHARGEFOOD[param1];
         this.draw.player.UNITCHARGED[param1] = false;
         this.draw.player.UNITCOOLING[param1] = true;
         this.draw.player.UNITCOOLINGTIME[param1] = getTimer();
      }
      
      public function resetWarRoadUnitIcon() : void
      {
         this.draw.player.bWarRoadSelectUnit = false;
         this.draw.player.nSetWarRoadUnit = Drawing.INITDATA;
         this.draw.player.nWarRoadUnitPos = Drawing.INITDATA;
      }
      
      public function setWarRoadUnitIcon(param1:int) : void
      {
         var _loc2_:int = 0;
         if(!this.draw.player.bWarRoadSelectUnit)
         {
            this.draw.player.bWarRoadSelectUnit = true;
            _loc2_ = 0;
            while(_loc2_ < Player.NUM_WARROAD)
            {
               this.draw.player.nWarRoadPosX[_loc2_] = 0;
               this.draw.player.nWarRoadPosX[_loc2_ + Player.NUM_WARROAD] = -this.draw.nLcdW;
               _loc2_++;
            }
         }
         this.draw.player.nSetWarRoadUnit = param1;
         this.draw.player.UNITBTN[param1] = true;
      }
      
      public function setUnitPosY(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = Player.BG_BASEPOSY + Player.OBJ_BASEPOSY;
         switch(param1)
         {
            case 0:
               _loc3_ = Player.OBJ_BASE_RANGE >> 1;
               _loc4_ = _loc2_ + (Player.OBJ_BASE_RANGE >> 1);
               break;
            case 1:
               _loc3_ = Player.OBJ_BASE_RANGE >> 1;
               _loc4_ = _loc2_ + (Player.OBJ_BASE_RANGE >> 2);
               break;
            case 2:
               _loc3_ = Player.OBJ_BASE_RANGE >> 1;
               _loc4_ = _loc2_;
         }
         return _loc4_ + this.draw.lib.getRand(_loc3_);
      }
      
      public function sortObjPos() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.draw.nTotalDrawObjNum = 0;
         this.draw.nDrawEnemyNum = 0;
         this.draw.nDrawUnitNum = 0;
         _loc1_ = 0;
         while(_loc1_ < Drawing.MAX_ENEMYNUM)
         {
            if(Boolean(this.draw.ENEMY[_loc1_].bAppear) || Boolean(this.draw.ENEMY[_loc1_].bArrive) || Boolean(this.draw.ENEMY[_loc1_].bFence))
            {
               this.draw.nObjDrawPos[this.draw.nDrawEnemyNum] = _loc1_;
               ++this.draw.nDrawEnemyNum;
            }
            _loc1_++;
         }
         _loc1_ = this.draw.nDrawEnemyNum;
         while(_loc1_ < Drawing.MAX_UNITNUM + this.draw.nDrawEnemyNum)
         {
            if(Boolean(this.draw.UNIT[_loc1_ - this.draw.nDrawEnemyNum].bAppear) || Boolean(this.draw.UNIT[_loc1_ - this.draw.nDrawEnemyNum].bArrive))
            {
               this.draw.nObjDrawPos[this.draw.nDrawEnemyNum + this.draw.nDrawUnitNum] = _loc1_ - this.draw.nDrawEnemyNum + Drawing.MAX_ENEMYNUM;
               ++this.draw.nDrawUnitNum;
            }
            _loc1_++;
         }
         this.draw.nTotalDrawObjNum = this.draw.nDrawEnemyNum + this.draw.nDrawUnitNum;
         this.draw.nObjDrawPos[this.draw.nTotalDrawObjNum] = Drawing.HEROPOS;
         _loc1_ = 0;
         while(_loc1_ < this.draw.nDrawEnemyNum - 1)
         {
            _loc2_ = _loc1_ + 1;
            while(_loc2_ < this.draw.nDrawEnemyNum)
            {
               if(this.draw.ENEMY[this.draw.nObjDrawPos[_loc1_]].nPosY > this.draw.ENEMY[this.draw.nObjDrawPos[_loc2_]].nPosY)
               {
                  _loc5_ = int(this.draw.nObjDrawPos[_loc2_]);
                  this.draw.nObjDrawPos[_loc2_] = this.draw.nObjDrawPos[_loc1_];
                  this.draw.nObjDrawPos[_loc1_] = _loc5_;
               }
               _loc2_++;
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.draw.nDrawEnemyNum + this.draw.nDrawUnitNum - 1)
         {
            _loc2_ = _loc1_ + 1;
            while(_loc2_ < this.draw.nDrawEnemyNum + this.draw.nDrawUnitNum)
            {
               if(this.draw.nObjDrawPos[_loc1_] < Drawing.MAX_ENEMYNUM)
               {
                  _loc3_ = int(this.draw.ENEMY[this.draw.nObjDrawPos[_loc1_]].nPosY);
               }
               else
               {
                  _loc3_ = int(this.draw.UNIT[this.draw.nObjDrawPos[_loc1_] - Drawing.MAX_ENEMYNUM].nPosY);
               }
               if(this.draw.nObjDrawPos[_loc2_] < Drawing.MAX_ENEMYNUM)
               {
                  _loc4_ = int(this.draw.ENEMY[this.draw.nObjDrawPos[_loc2_]].nPosY);
               }
               else
               {
                  _loc4_ = int(this.draw.UNIT[this.draw.nObjDrawPos[_loc2_] - Drawing.MAX_ENEMYNUM].nPosY);
               }
               if(_loc3_ > _loc4_)
               {
                  _loc5_ = int(this.draw.nObjDrawPos[_loc2_]);
                  this.draw.nObjDrawPos[_loc2_] = this.draw.nObjDrawPos[_loc1_];
                  this.draw.nObjDrawPos[_loc1_] = _loc5_;
               }
               _loc2_++;
            }
            _loc1_++;
         }
         _loc1_ = this.draw.nTotalDrawObjNum;
         while(_loc1_ > 0)
         {
            if(this.draw.nObjDrawPos[_loc1_ - 1] < Drawing.MAX_ENEMYNUM)
            {
               _loc3_ = int(this.draw.ENEMY[this.draw.nObjDrawPos[_loc1_ - 1]].nPosY);
            }
            else
            {
               _loc3_ = int(this.draw.UNIT[this.draw.nObjDrawPos[_loc1_ - 1] - Drawing.MAX_ENEMYNUM].nPosY);
            }
            if(this.draw.player.nPosY < _loc3_)
            {
               _loc5_ = int(this.draw.nObjDrawPos[_loc1_ - 1]);
               this.draw.nObjDrawPos[_loc1_ - 1] = this.draw.nObjDrawPos[_loc1_];
               this.draw.nObjDrawPos[_loc1_] = _loc5_;
            }
            _loc1_--;
         }
      }
      
      public function bFullBag() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:Boolean = false;
         _loc2_ = true;
         _loc1_ = 0;
         while(_loc1_ < Player.INVENDATA_LEVELPOS)
         {
            if(this.draw.player.INVENDATA[_loc1_] <= Drawing.INITDATA)
            {
               _loc2_ = false;
               break;
            }
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function addItem(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         _loc5_ = false;
         _loc6_ = false;
         if(!_loc5_)
         {
            _loc6_ = true;
         }
         if(_loc6_)
         {
            _loc3_ = 0;
            while(_loc3_ < Player.MAX_BAGNUM)
            {
               _loc4_ = _loc3_ * Player.ONEBAG_MAXNUM;
               while(_loc4_ < _loc3_ * Player.ONEBAG_MAXNUM + Player.ONEBAG_MAXNUM)
               {
                  if(this.draw.player.INVENDATA[_loc4_] == Drawing.INITDATA)
                  {
                     this.draw.player.INVENDATA[_loc4_] = param1;
                     this.draw.player.INVENDATA[_loc4_ + Player.INVENDATA_LEVELPOS] = param2;
                     _loc5_ = true;
                     break;
                  }
                  _loc4_++;
               }
               if(_loc5_)
               {
                  this.draw.bEquipItemSelect = false;
                  this.draw.bInvenItemSelect = false;
                  this.draw.bStoreItemSelect = false;
                  this.draw.bItemEquipBtnSelect = false;
                  this.draw.bBagSelect = true;
                  this.draw.player.nInvenPosX = -(74 * _loc4_);
                  if(this.draw.player.nInvenPosX >= Player.INVEN_STARTPOS)
                  {
                     this.draw.player.nInvenPosX = Player.INVEN_STARTPOS;
                  }
                  if(this.draw.player.nInvenPosX <= -Player.INVEN_ENDPOS)
                  {
                     this.draw.player.nInvenPosX = -Player.INVEN_ENDPOS;
                  }
                  break;
               }
               _loc3_++;
            }
         }
         return _loc5_;
      }
      
      public function unEquipItem(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         _loc4_ = false;
         _loc5_ = false;
         if(!_loc4_)
         {
            _loc5_ = true;
         }
         if(_loc5_)
         {
            _loc2_ = 0;
            while(_loc2_ < Player.MAX_BAGNUM)
            {
               _loc3_ = _loc2_ * Player.ONEBAG_MAXNUM;
               while(_loc3_ < _loc2_ * Player.ONEBAG_MAXNUM + Player.ONEBAG_MAXNUM)
               {
                  if(this.draw.player.INVENDATA[_loc3_] == Drawing.INITDATA)
                  {
                     this.draw.player.INVENDATA[_loc3_] = this.draw.player.EQUIPINVEN[param1];
                     this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS] = this.draw.player.EQUIPINVEN[param1 + Player.EQUIPINVEN_LEVELPOS];
                     this.draw.player.EQUIPINVEN[param1] = Drawing.INITDATA;
                     this.draw.player.EQUIPINVEN[param1 + Player.EQUIPINVEN_LEVELPOS] = Drawing.INITDATA;
                     this.draw.player.SAVEEQUIPINVEN[param1] = this.draw.player.EQUIPINVEN[param1];
                     this.draw.player.SAVEEQUIPINVEN[param1 + Player.EQUIPINVEN_LEVELPOS] = this.draw.player.EQUIPINVEN[param1 + Player.EQUIPINVEN_LEVELPOS];
                     _loc4_ = true;
                     break;
                  }
                  _loc3_++;
               }
               if(_loc4_)
               {
                  this.draw.bEquipItemSelect = false;
                  this.draw.bInvenItemSelect = false;
                  this.draw.bStoreItemSelect = false;
                  this.draw.bItemEquipBtnSelect = false;
                  this.draw.bBagSelect = true;
                  break;
               }
               _loc2_++;
            }
         }
         return _loc4_;
      }
      
      public function deleteItem(param1:int) : void
      {
         this.draw.player.INVENDATA[param1] = Drawing.INITDATA;
         this.draw.player.INVENDATA[param1 + Player.INVENDATA_LEVELPOS] = Drawing.INITDATA;
         this.draw.bInvenItemSelect = false;
         this.draw.nInvenItemSelectPos = Drawing.INITDATA;
      }
      
      public function deleteEquipItem(param1:int) : void
      {
         this.draw.player.EQUIPINVEN[param1] = Drawing.INITDATA;
         this.draw.player.EQUIPINVEN[param1 + Player.EQUIPINVEN_LEVELPOS] = Drawing.INITDATA;
         this.draw.bEquipItemSelect = false;
         this.draw.nEquipItemSelectPos = Drawing.INITDATA;
      }
      
      public function moveEquipItemInBag(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         _loc4_ = false;
         _loc3_ = param2 * Player.ONEBAG_MAXNUM;
         while(_loc3_ < param2 * Player.ONEBAG_MAXNUM + Player.ONEBAG_MAXNUM)
         {
            if(this.draw.player.INVENDATA[_loc3_] == Drawing.INITDATA)
            {
               if(this.draw.player.EQUIPINVEN[param1] < Drawing.RING_EXP)
               {
                  this.draw.lib.playEffect(44);
               }
               else
               {
                  this.draw.lib.playEffect(45);
               }
               this.draw.player.INVENDATA[_loc3_] = this.draw.player.EQUIPINVEN[param1];
               this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS] = this.draw.player.EQUIPINVEN[param1 + Player.EQUIPINVEN_LEVELPOS];
               this.draw.player.EQUIPINVEN[param1] = Drawing.INITDATA;
               this.draw.player.EQUIPINVEN[param1 + Player.EQUIPINVEN_LEVELPOS] = Drawing.INITDATA;
               _loc4_ = true;
               break;
            }
            _loc3_++;
         }
         return _loc4_;
      }
      
      public function moveItemInBag(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         _loc4_ = false;
         _loc3_ = param2 * Player.ONEBAG_MAXNUM;
         while(_loc3_ < param2 * Player.ONEBAG_MAXNUM + Player.ONEBAG_MAXNUM)
         {
            if(this.draw.player.INVENDATA[_loc3_] == Drawing.INITDATA)
            {
               if(this.draw.player.INVENDATA[param1] < Drawing.RING_EXP)
               {
                  this.draw.lib.playEffect(44);
               }
               else
               {
                  this.draw.lib.playEffect(45);
               }
               this.draw.player.INVENDATA[_loc3_] = this.draw.player.INVENDATA[param1];
               this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS] = this.draw.player.INVENDATA[param1 + Player.INVENDATA_LEVELPOS];
               this.draw.player.INVENDATA[param1] = Drawing.INITDATA;
               this.draw.player.INVENDATA[param1 + Player.INVENDATA_LEVELPOS] = Drawing.INITDATA;
               _loc4_ = true;
               break;
            }
            _loc3_++;
         }
         return _loc4_;
      }
      
      public function sortInven(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         switch(param1)
         {
            case Player.SORTING_MACE:
               _loc2_ = 0;
               while(_loc2_ < Player.INVENDATA_LEVELPOS - 1)
               {
                  _loc3_ = _loc2_ + 1;
                  while(_loc3_ < Player.INVENDATA_LEVELPOS)
                  {
                     if(this.draw.player.INVENDATA[_loc3_] != Drawing.INITDATA && (this.draw.player.INVENDATA[_loc2_] > this.draw.player.INVENDATA[_loc3_] || this.draw.player.INVENDATA[_loc2_] == Drawing.INITDATA))
                     {
                        _loc4_ = int(this.draw.player.INVENDATA[_loc3_]);
                        _loc5_ = int(this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS]);
                        this.draw.player.INVENDATA[_loc3_] = this.draw.player.INVENDATA[_loc2_];
                        this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS] = this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS];
                        this.draw.player.INVENDATA[_loc2_] = _loc4_;
                        this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS] = _loc5_;
                     }
                     _loc3_++;
                  }
                  _loc2_++;
               }
               _loc2_ = 0;
               while(_loc2_ < Player.INVENDATA_LEVELPOS)
               {
                  if(this.draw.player.INVENDATA[_loc2_] >= Drawing.RING_EXP)
                  {
                     _loc6_ = _loc2_;
                     break;
                  }
                  _loc2_++;
               }
               _loc2_ = _loc6_;
               while(_loc2_ < Player.INVENDATA_LEVELPOS - 1)
               {
                  _loc3_ = _loc2_ + 1;
                  while(_loc3_ < Player.INVENDATA_LEVELPOS)
                  {
                     if(this.draw.player.INVENDATA[_loc3_] != Drawing.INITDATA && (this.draw.player.INVENDATA[_loc2_] > this.draw.player.INVENDATA[_loc3_] || this.draw.player.INVENDATA[_loc2_] == Drawing.INITDATA))
                     {
                        _loc4_ = int(this.draw.player.INVENDATA[_loc3_]);
                        _loc5_ = int(this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS]);
                        this.draw.player.INVENDATA[_loc3_] = this.draw.player.INVENDATA[_loc2_];
                        this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS] = this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS];
                        this.draw.player.INVENDATA[_loc2_] = _loc4_;
                        this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS] = _loc5_;
                     }
                     _loc3_++;
                  }
                  _loc2_++;
               }
               _loc2_ = 0;
               while(_loc2_ < _loc6_ - 1)
               {
                  _loc3_ = _loc2_ + 1;
                  while(_loc3_ < _loc6_)
                  {
                     if(this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS] < this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS] && this.draw.player.INVENDATA[_loc2_] == this.draw.player.INVENDATA[_loc3_])
                     {
                        _loc4_ = int(this.draw.player.INVENDATA[_loc3_]);
                        _loc5_ = int(this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS]);
                        this.draw.player.INVENDATA[_loc3_] = this.draw.player.INVENDATA[_loc2_];
                        this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS] = this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS];
                        this.draw.player.INVENDATA[_loc2_] = _loc4_;
                        this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS] = _loc5_;
                     }
                     _loc3_++;
                  }
                  _loc2_++;
               }
               _loc2_ = _loc6_;
               while(_loc2_ < Player.INVENDATA_LEVELPOS - 1)
               {
                  _loc3_ = _loc2_ + 1;
                  while(_loc3_ < Player.INVENDATA_LEVELPOS)
                  {
                     if(this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS] < this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS] && this.draw.player.INVENDATA[_loc2_] == this.draw.player.INVENDATA[_loc3_])
                     {
                        _loc4_ = int(this.draw.player.INVENDATA[_loc3_]);
                        _loc5_ = int(this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS]);
                        this.draw.player.INVENDATA[_loc3_] = this.draw.player.INVENDATA[_loc2_];
                        this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS] = this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS];
                        this.draw.player.INVENDATA[_loc2_] = _loc4_;
                        this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS] = _loc5_;
                     }
                     _loc3_++;
                  }
                  _loc2_++;
               }
               break;
            case Player.SORTING_RING:
               _loc2_ = 0;
               while(_loc2_ < Player.INVENDATA_LEVELPOS - 1)
               {
                  _loc3_ = _loc2_ + 1;
                  while(_loc3_ < Player.INVENDATA_LEVELPOS)
                  {
                     if(this.draw.player.INVENDATA[_loc3_] != Drawing.INITDATA && (this.draw.player.INVENDATA[_loc2_] < this.draw.player.INVENDATA[_loc3_] || this.draw.player.INVENDATA[_loc2_] == Drawing.INITDATA))
                     {
                        _loc4_ = int(this.draw.player.INVENDATA[_loc3_]);
                        _loc5_ = int(this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS]);
                        this.draw.player.INVENDATA[_loc3_] = this.draw.player.INVENDATA[_loc2_];
                        this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS] = this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS];
                        this.draw.player.INVENDATA[_loc2_] = _loc4_;
                        this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS] = _loc5_;
                     }
                     _loc3_++;
                  }
                  _loc2_++;
               }
               _loc2_ = 0;
               while(_loc2_ < Player.INVENDATA_LEVELPOS)
               {
                  if(this.draw.player.INVENDATA[_loc2_] < Drawing.RING_EXP)
                  {
                     _loc6_ = _loc2_;
                     break;
                  }
                  _loc2_++;
               }
               _loc2_ = _loc6_;
               while(_loc2_ < Player.INVENDATA_LEVELPOS - 1)
               {
                  _loc3_ = _loc2_ + 1;
                  while(_loc3_ < Player.INVENDATA_LEVELPOS)
                  {
                     if(this.draw.player.INVENDATA[_loc3_] != Drawing.INITDATA && (this.draw.player.INVENDATA[_loc2_] > this.draw.player.INVENDATA[_loc3_] || this.draw.player.INVENDATA[_loc2_] == Drawing.INITDATA))
                     {
                        _loc4_ = int(this.draw.player.INVENDATA[_loc3_]);
                        _loc5_ = int(this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS]);
                        this.draw.player.INVENDATA[_loc3_] = this.draw.player.INVENDATA[_loc2_];
                        this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS] = this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS];
                        this.draw.player.INVENDATA[_loc2_] = _loc4_;
                        this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS] = _loc5_;
                     }
                     _loc3_++;
                  }
                  _loc2_++;
               }
               _loc2_ = 0;
               while(_loc2_ < _loc6_ - 1)
               {
                  _loc3_ = _loc2_ + 1;
                  while(_loc3_ < _loc6_)
                  {
                     if(this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS] < this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS] && this.draw.player.INVENDATA[_loc2_] == this.draw.player.INVENDATA[_loc3_])
                     {
                        _loc4_ = int(this.draw.player.INVENDATA[_loc3_]);
                        _loc5_ = int(this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS]);
                        this.draw.player.INVENDATA[_loc3_] = this.draw.player.INVENDATA[_loc2_];
                        this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS] = this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS];
                        this.draw.player.INVENDATA[_loc2_] = _loc4_;
                        this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS] = _loc5_;
                     }
                     _loc3_++;
                  }
                  _loc2_++;
               }
               _loc2_ = _loc6_;
               while(_loc2_ < Player.INVENDATA_LEVELPOS - 1)
               {
                  _loc3_ = _loc2_ + 1;
                  while(_loc3_ < Player.INVENDATA_LEVELPOS)
                  {
                     if(this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS] < this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS] && this.draw.player.INVENDATA[_loc2_] == this.draw.player.INVENDATA[_loc3_])
                     {
                        _loc4_ = int(this.draw.player.INVENDATA[_loc3_]);
                        _loc5_ = int(this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS]);
                        this.draw.player.INVENDATA[_loc3_] = this.draw.player.INVENDATA[_loc2_];
                        this.draw.player.INVENDATA[_loc3_ + Player.INVENDATA_LEVELPOS] = this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS];
                        this.draw.player.INVENDATA[_loc2_] = _loc4_;
                        this.draw.player.INVENDATA[_loc2_ + Player.INVENDATA_LEVELPOS] = _loc5_;
                     }
                     _loc3_++;
                  }
                  _loc2_++;
               }
         }
         this.draw.player.nInvenPosX = 0;
         this.draw.lib.saveFile(Drawing.DB_SLOT,"paladog_slot" + this.draw.nGameSlot);
         this.draw.lib.saveFile(Drawing.DB_GAME,"paladog_game" + this.draw.nGameSlot);
      }
      
      public function changeEquipItem(param1:int, param2:int) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc3_ = false;
         if(param2 < Player.EQUIPINVEN_RINGPOS)
         {
            this.draw.lib.playEffect(44);
         }
         else
         {
            this.draw.lib.playEffect(45);
         }
         if(this.draw.player.EQUIPINVEN[param2] > Drawing.INITDATA)
         {
            _loc4_ = int(this.draw.player.EQUIPINVEN[param2]);
            _loc5_ = int(this.draw.player.EQUIPINVEN[param2 + Player.EQUIPINVEN_LEVELPOS]);
            _loc3_ = true;
         }
         this.draw.player.EQUIPINVEN[param2] = this.draw.player.EQUIPINVEN[param1];
         this.draw.player.EQUIPINVEN[param2 + Player.EQUIPINVEN_LEVELPOS] = this.draw.player.EQUIPINVEN[param1 + Player.EQUIPINVEN_LEVELPOS];
         this.draw.player.SAVEEQUIPINVEN[param2] = this.draw.player.EQUIPINVEN[param2];
         this.draw.player.SAVEEQUIPINVEN[param2 + Player.EQUIPINVEN_LEVELPOS] = this.draw.player.EQUIPINVEN[param2 + Player.EQUIPINVEN_LEVELPOS];
         if(_loc3_)
         {
            this.draw.player.EQUIPINVEN[param1] = _loc4_;
            this.draw.player.EQUIPINVEN[param1 + Player.EQUIPINVEN_LEVELPOS] = _loc5_;
            this.draw.player.SAVEEQUIPINVEN[param1] = this.draw.player.EQUIPINVEN[param1];
            this.draw.player.SAVEEQUIPINVEN[param1 + Player.EQUIPINVEN_LEVELPOS] = this.draw.player.EQUIPINVEN[param1 + Player.EQUIPINVEN_LEVELPOS];
         }
         else
         {
            this.draw.player.EQUIPINVEN[param1] = Drawing.INITDATA;
            this.draw.player.EQUIPINVEN[param1 + Player.EQUIPINVEN_LEVELPOS] = Drawing.INITDATA;
         }
         this.draw.bInvenItemSelect = false;
         this.draw.nInvenItemSelectPos = Drawing.INITDATA;
      }
      
      public function equipItem(param1:int, param2:int) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc3_ = false;
         if(param2 < Player.EQUIPINVEN_RINGPOS)
         {
            this.draw.lib.playEffect(44);
         }
         else
         {
            this.draw.lib.playEffect(45);
         }
         if(this.draw.player.EQUIPINVEN[param2] > Drawing.INITDATA)
         {
            _loc4_ = int(this.draw.player.EQUIPINVEN[param2]);
            _loc5_ = int(this.draw.player.EQUIPINVEN[param2 + Player.EQUIPINVEN_LEVELPOS]);
            _loc3_ = true;
         }
         this.draw.player.EQUIPINVEN[param2] = this.draw.player.INVENDATA[param1];
         this.draw.player.EQUIPINVEN[param2 + Player.EQUIPINVEN_LEVELPOS] = this.draw.player.INVENDATA[param1 + Player.INVENDATA_LEVELPOS];
         this.draw.player.SAVEEQUIPINVEN[param2] = this.draw.player.EQUIPINVEN[param2];
         this.draw.player.SAVEEQUIPINVEN[param2 + Player.EQUIPINVEN_LEVELPOS] = this.draw.player.EQUIPINVEN[param2 + Player.EQUIPINVEN_LEVELPOS];
         if(_loc3_)
         {
            this.draw.player.INVENDATA[param1] = _loc4_;
            this.draw.player.INVENDATA[param1 + Player.INVENDATA_LEVELPOS] = _loc5_;
         }
         else
         {
            this.draw.player.INVENDATA[param1] = Drawing.INITDATA;
            this.draw.player.INVENDATA[param1 + Player.INVENDATA_LEVELPOS] = Drawing.INITDATA;
         }
         this.draw.bInvenItemSelect = false;
         this.draw.nInvenItemSelectPos = Drawing.INITDATA;
      }
      
      public function armsCharge() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < Player.EQUIPARMS_NUM)
         {
            if(this.draw.player.EQUIPINVEN[_loc1_] > Drawing.INITDATA)
            {
               if(this.draw.player.nMana >= this.getArmsChargeMana(this.draw.player.EQUIPINVEN[_loc1_]))
               {
                  this.draw.player.ARMSCHARGED[_loc1_] = true;
               }
               else
               {
                  this.draw.player.ARMSCHARGED[_loc1_] = false;
               }
            }
            _loc1_++;
         }
      }
      
      public function getArmsChargeMana(param1:int) : Number
      {
         var _loc2_:Number = NaN;
         _loc2_ = 0;
         if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
         {
            switch(param1)
            {
               case Drawing.ATTACK_VERTICAL:
                  _loc2_ = 90;
                  break;
               case Drawing.ATTACK_HORIZON:
                  _loc2_ = 90;
                  break;
               case Drawing.ATTACK_HEAL:
                  _loc2_ = 30;
            }
            return _loc2_;
         }
         switch(param1)
         {
            case Drawing.MACE_GODPUNCH:
               _loc2_ = 10;
               break;
            case Drawing.MACE_HEAL:
               _loc2_ = 30;
               break;
            case Drawing.MACE_TURNUNDEAD:
               _loc2_ = 50;
               break;
            case Drawing.MACE_ICE:
               _loc2_ = 10;
               break;
            case Drawing.MACE_LIGHT:
               _loc2_ = 30;
               break;
            case Drawing.MACE_FIRE:
               _loc2_ = 15;
               break;
            case Drawing.MACE_METEO:
               _loc2_ = 55;
               break;
            case Drawing.MACE_WIND:
               _loc2_ = 20;
               break;
            case Drawing.MACE_FOOD:
               _loc2_ = 20;
               break;
            case Drawing.MACE_POISON:
               _loc2_ = 5;
         }
         return _loc2_ * (1 - this.draw.player.HEROSKILL[Player.SKILL_MAGICMASTER] / 10);
      }
      
      public function unitCharge() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < Drawing.MAX_UNITKIND)
         {
            if(this.draw.player.UNITEQUIP[_loc1_])
            {
               if(this.draw.player.nFood >= this.draw.player.UNITCHARGEFOOD[_loc1_])
               {
                  if(!this.draw.player.UNITCOOLING[_loc1_])
                  {
                     if(!this.draw.player.UNITCHARGED[_loc1_])
                     {
                        if(this.draw.player.nGameMode != Drawing.MODE_DESTINY)
                        {
                           this.draw.lib.playEffect(97);
                        }
                     }
                     this.draw.player.UNITCHARGED[_loc1_] = true;
                  }
               }
               else
               {
                  this.draw.player.UNITCHARGED[_loc1_] = false;
               }
            }
            _loc1_++;
         }
      }
      
      public function resetAttacked(param1:int, param2:int) : void
      {
         switch(param1)
         {
            case Player.PALADOGATTACKED:
               if(this.draw.player.bAttacked)
               {
                  this.draw.player.nAttackedFrame += 1 + this.draw.nLeakFrame;
                  if(this.draw.player.nAttackedFrame >= Player.ATTACKEDTOTALFRAME)
                  {
                     this.draw.player.nAttackedFrame = 0;
                     this.draw.player.bAttacked = false;
                  }
               }
               break;
            case Player.UNITATTACKED:
               if(this.draw.UNIT[param2].bAttacked)
               {
                  this.draw.UNIT[param2].nAttackedFrame += 1 + this.draw.nLeakFrame;
                  if(this.draw.UNIT[param2].nAttackedFrame >= Player.ATTACKEDTOTALFRAME)
                  {
                     this.draw.UNIT[param2].nAttackedFrame = 0;
                     this.draw.UNIT[param2].bAttacked = false;
                  }
               }
               break;
            case Player.ENEMYATTACKED:
               if(this.draw.ENEMY[param2].bAttacked)
               {
                  this.draw.ENEMY[param2].nAttackedFrame += 1 + this.draw.nLeakFrame;
                  if(this.draw.ENEMY[param2].nAttackedFrame >= Player.ATTACKEDTOTALFRAME)
                  {
                     this.draw.ENEMY[param2].nAttackedFrame = 0;
                     this.draw.ENEMY[param2].bAttacked = false;
                  }
               }
         }
      }
      
      public function detoxication(param1:int, param2:int) : void
      {
         switch(param1)
         {
            case Player.PALADOGATTACKED:
               this.draw.player.bPoison = false;
               this.draw.player.nPoisonStartTime = Drawing.INITDATA;
               this.draw.player.nPoisonTime = Drawing.INITDATA;
               this.draw.player.nPoisonDpsTime = Drawing.INITDATA;
               this.draw.player.nPoisonDps = Drawing.INITDATA;
               break;
            case Player.UNITATTACKED:
               this.draw.UNIT[param2].bPoison = false;
               this.draw.UNIT[param2].nPoisonStartTime = Drawing.INITDATA;
               this.draw.UNIT[param2].nPoisonTime = Drawing.INITDATA;
               this.draw.UNIT[param2].nPoisonDpsTime = Drawing.INITDATA;
               this.draw.UNIT[param2].nPoisonDps = Drawing.INITDATA;
               break;
            case Player.ENEMYATTACKED:
               this.draw.ENEMY[param2].bPoison = false;
               this.draw.ENEMY[param2].nPoisonStartTime = Drawing.INITDATA;
               this.draw.ENEMY[param2].nPoisonTime = Drawing.INITDATA;
               this.draw.ENEMY[param2].nPoisonDpsTime = Drawing.INITDATA;
               this.draw.ENEMY[param2].nPoisonDps = Drawing.INITDATA;
         }
      }
      
      public function drawEnemyMaceDmg(param1:int) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < Enemy.MAX_DMG)
         {
            switch(this.draw.ENEMY[param1].DMGKIND[_loc2_])
            {
               case Drawing.MACE_GODPUNCH:
                  this.draw.lib.drawImgZoomDodge(Drawing.imgExplosion_a + int(this.draw.ENEMY[param1].DMGANIFRAME[_loc2_] >> 1),this.draw.ENEMY[param1].DMGPOSX[_loc2_],this.draw.ENEMY[param1].DMGPOSY[_loc2_],this.draw.ENEMY[param1].nSizeScale,this.draw.ENEMY[param1].nSizeScale,BlendMode.NORMAL,Drawing.BOTTOM | Drawing.HCENTER);
                  if(!this.draw.bGameMenu)
                  {
                     this.enemyDmgEffProcess(param1,_loc2_);
                  }
                  break;
               case Drawing.MACE_TURNUNDEAD:
                  this.draw.lib.drawImgZoomDodge(this.draw.player.ARMSANIIMG[this.draw.ENEMY[param1].DMGKIND[_loc2_] * Player.MACEACT_NUM + Player.MACEACT_EFFB] + int(this.draw.ENEMY[param1].DMGANIFRAME[_loc2_] >> 1),this.draw.ENEMY[param1].DMGPOSX[_loc2_],this.draw.ENEMY[param1].DMGPOSY[_loc2_],this.draw.ENEMY[param1].nSizeScale,this.draw.ENEMY[param1].nSizeScale,BlendMode.ADD,Drawing.BOTTOM | Drawing.HCENTER);
                  if(!this.draw.bGameMenu)
                  {
                     this.enemyDmgEffProcess(param1,_loc2_);
                  }
                  break;
               case Drawing.MACE_LIGHT:
                  this.draw.lib.drawImgZoomDodge(this.draw.player.ARMSANIIMG[this.draw.ENEMY[param1].DMGKIND[_loc2_] * Player.MACEACT_NUM + Player.MACEACT_EFFB] + int(this.draw.ENEMY[param1].DMGANIFRAME[_loc2_] >> 1),this.draw.ENEMY[param1].DMGPOSX[_loc2_],this.draw.ENEMY[param1].DMGPOSY[_loc2_],this.draw.ENEMY[param1].nSizeScale,this.draw.ENEMY[param1].nSizeScale,BlendMode.ADD,Drawing.BOTTOM | Drawing.HCENTER);
                  this.draw.ENEMY[param1].DMGPOSX[_loc2_] = this.draw.ENEMY[param1].nPosX;
                  this.draw.ENEMY[param1].DMGPOSY[_loc2_] = this.draw.ENEMY[param1].nPosY;
                  if(!this.draw.bGameMenu)
                  {
                     this.enemyDmgEffProcess(param1,_loc2_);
                  }
                  break;
               case Drawing.MACE_FIRE:
                  this.draw.lib.drawImgZoomDodge(Drawing.imgBurn + int(this.draw.ENEMY[param1].DMGANIFRAME[_loc2_] >> 1),this.draw.ENEMY[param1].DMGPOSX[_loc2_],this.draw.ENEMY[param1].DMGPOSY[_loc2_],this.draw.ENEMY[param1].nSizeScale,this.draw.ENEMY[param1].nSizeScale,BlendMode.ADD,Drawing.BOTTOM | Drawing.HCENTER);
                  this.draw.ENEMY[param1].DMGPOSX[_loc2_] = this.draw.ENEMY[param1].nPosX;
                  this.draw.ENEMY[param1].DMGPOSY[_loc2_] = this.draw.ENEMY[param1].nPosY;
                  if(!this.draw.bGameMenu)
                  {
                     this.enemyDmgEffProcess(param1,_loc2_);
                  }
            }
            _loc2_++;
         }
      }
      
      public function enemyDmgEffProcess(param1:int, param2:int) : void
      {
         this.draw.ENEMY[param1].DMGANIFRAME[param2] += 1 + this.draw.nLeakFrame;
         if(this.draw.ENEMY[param1].DMGANIFRAME[param2] >= this.draw.player.ENEMYDAMAGETOTALFRAME[this.draw.ENEMY[param1].DMGKIND[param2]])
         {
            this.draw.ENEMY[param1].DMGKIND[param2] = Drawing.INITDATA;
            this.draw.ENEMY[param1].DMGPOSX[param2] = Drawing.INITDATA;
            this.draw.ENEMY[param1].DMGPOSY[param2] = Drawing.INITDATA;
            this.draw.ENEMY[param1].DMGANIFRAME[param2] = 0;
         }
      }
      
      public function resetEnemyAttack(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         if(this.draw.ENEMY[param1].nBaseType == Drawing.ENEMY_BOMB)
         {
            if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
            {
               if(!this.draw.ENEMY[param1].bBaby)
               {
                  ++this.draw.player.nSurvivalDieMob;
               }
               if(this.draw.player.nSurvivalDieMob >= this.draw.player.nSurvivalMobMaxNum)
               {
                  this.draw.player.bStageClear = true;
                  this.draw.nGameFrame = 0;
               }
            }
         }
         this.draw.ENEMY[param1].ATTACKANI[param2 + Enemy.MAX_ENEMYATTACK] = 0;
         this.draw.ENEMY[param1].ATTACKANI[param2] = Drawing.INITDATA;
         this.draw.ENEMY[param1].ATTACKPOSX[param2] = Drawing.INITDATA;
         this.draw.ENEMY[param1].ATTACKPOSY[param2] = Drawing.INITDATA;
         this.draw.ENEMY[param1].ATTACKARMSPOSX[param2] = Drawing.INITDATA;
         this.draw.ENEMY[param1].ATTACKARMSPOSY[param2] = Drawing.INITDATA;
         this.draw.ENEMY[param1].SUBATTACKARMSPOSX[param2] = Drawing.INITDATA;
         this.draw.ENEMY[param1].ATTACKARMSNUM[param2] = Drawing.INITDATA;
         this.draw.ENEMY[param1].ATTACKARRIVEPOS[param2] = Drawing.INITDATA;
         this.draw.ENEMY[param1].ATTACKENEMY[param2] = Drawing.INITDATA;
         _loc3_ = 0;
         while(_loc3_ < Enemy.MAX_ATTACKUNIT)
         {
            this.draw.ENEMY[param1].ATTACKUNIT[param2 * Enemy.MAX_ATTACKUNIT + _loc3_] = Drawing.INITDATA;
            _loc3_++;
         }
         this.draw.ENEMY[param1].nAttackUnitPos[param2] = 0;
      }
      
      public function resetUnitDmgEff(param1:int, param2:int) : void
      {
         this.draw.UNIT[param1].DMGKIND[param2] = Drawing.INITDATA;
         this.draw.UNIT[param1].DMGPOSX[param2] = Drawing.INITDATA;
         this.draw.UNIT[param1].DMGPOSY[param2] = Drawing.INITDATA;
         this.draw.UNIT[param1].DMGANIFRAME[param2] = 0;
      }
      
      public function resetUnitAttack(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         this.draw.UNIT[param1].ATTACKANI[param2 + Unit.MAX_UNITATTACK] = 0;
         this.draw.UNIT[param1].ATTACKANI[param2] = Drawing.INITDATA;
         this.draw.UNIT[param1].ATTACKPOSX[param2] = Drawing.INITDATA;
         this.draw.UNIT[param1].ATTACKPOSY[param2] = Drawing.INITDATA;
         this.draw.UNIT[param1].ATTACKARMSPOSX[param2] = Drawing.INITDATA;
         this.draw.UNIT[param1].ATTACKARMSPOSY[param2] = Drawing.INITDATA;
         this.draw.UNIT[param1].SUBATTACKARMSPOSX[param2] = Drawing.INITDATA;
         this.draw.UNIT[param1].ATTACKARMSNUM[param2] = Drawing.INITDATA;
         this.draw.UNIT[param1].ATTACKARRIVEPOS[param2] = Drawing.INITDATA;
         _loc3_ = 0;
         while(_loc3_ < Unit.MAX_ATTACKENEMY)
         {
            this.draw.UNIT[param1].ATTACKENEMY[param2 * Unit.MAX_ATTACKENEMY + _loc3_] = Drawing.INITDATA;
            _loc3_++;
         }
         this.draw.UNIT[param1].nAttackEnemyPos[param2] = 0;
      }
      
      public function setAttacked(param1:int, param2:int, param3:int) : void
      {
         switch(param1)
         {
            case Player.PALADOGATTACKED:
               if(!this.draw.player.bAttacked)
               {
                  this.draw.player.bAttacked = true;
                  this.draw.player.nAttackedFrame = 0;
               }
               break;
            case Player.UNITATTACKED:
               if(!this.draw.UNIT[param2].bAttacked)
               {
                  this.draw.UNIT[param2].bAttacked = true;
                  this.draw.UNIT[param2].nAttackedFrame = 0;
               }
               if(this.draw.UNIT[param2].nType == Drawing.UNIT_WAGON)
               {
                  this.draw.UNIT[param2].bAttackedStop = true;
                  this.draw.UNIT[param2].nAttackedTime = getTimer();
               }
               break;
            case Player.ENEMYATTACKED:
               if(!this.draw.ENEMY[param2].bAttacked)
               {
                  this.draw.ENEMY[param2].bAttacked = true;
                  this.draw.ENEMY[param2].nAttackedFrame = 0;
               }
         }
      }
      
      public function bDrawEnemyStationDmgEff() : Boolean
      {
         if(this.draw.player.bEnemyStationAttacked)
         {
            if((this.draw.player.nEnemyStationAttackedFrame >> 1) % 2 == 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function bDrawDmgEff(param1:int, param2:int) : Boolean
      {
         switch(param1)
         {
            case Player.PALADOGATTACKED:
               if(this.draw.player.nAttackedFrame == 0)
               {
                  if(!this.draw.player.bDrawAttackedEff)
                  {
                     this.draw.player.bDrawAttackedEff = true;
                     this.draw.player.nDrawAttackedEffKind = this.draw.lib.getRand(2);
                     this.draw.player.nDrawAttackedEffPosX = this.draw.player.nPosX;
                     this.draw.player.nDrawAttackedEffPosY = this.draw.player.nPosY;
                     this.draw.player.nDrawAttackedEffFrame = 0;
                  }
               }
               if((this.draw.player.nAttackedFrame >> 1) % 2 == 0)
               {
                  return true;
               }
               break;
            case Player.UNITATTACKED:
               if(this.draw.UNIT[param2].nAttackedFrame == 0)
               {
                  if(!this.draw.UNIT[param2].bDrawAttackedEff)
                  {
                     this.draw.UNIT[param2].bDrawAttackedEff = true;
                     this.draw.UNIT[param2].nDrawAttackedEffKind = this.draw.lib.getRand(2);
                     this.draw.UNIT[param2].nDrawAttackedEffPosX = this.draw.UNIT[param2].nPosX;
                     this.draw.UNIT[param2].nDrawAttackedEffPosY = this.draw.UNIT[param2].nPosY;
                     this.draw.UNIT[param2].nDrawAttackedEffFrame = 0;
                  }
               }
               if((this.draw.UNIT[param2].nAttackedFrame >> 1) % 2 == 0)
               {
                  return true;
               }
               break;
            case Player.ENEMYATTACKED:
               if(this.draw.ENEMY[param2].nAttackedFrame == 0)
               {
                  if(!this.draw.ENEMY[param2].bDrawAttackedEff)
                  {
                     this.draw.ENEMY[param2].bDrawAttackedEff = true;
                     this.draw.ENEMY[param2].nDrawAttackedEffKind = this.draw.lib.getRand(2);
                     this.draw.ENEMY[param2].nDrawAttackedEffPosX = this.draw.ENEMY[param2].nPosX;
                     this.draw.ENEMY[param2].nDrawAttackedEffPosY = this.draw.ENEMY[param2].nPosY;
                     this.draw.ENEMY[param2].nDrawAttackedEffFrame = 0;
                  }
               }
               if((this.draw.ENEMY[param2].nAttackedFrame >> 1) % 2 == 0)
               {
                  return true;
               }
         }
         return false;
      }
      
      public function destinyClear() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Boolean = false;
         if(this.draw.player.nAppearTotalEnemy >= Player.DESTINYTOTALENEMYNUM)
         {
            _loc2_ = true;
            _loc1_ = 0;
            while(_loc1_ < Player.DESTINYTOTALENEMYNUM)
            {
               if(this.draw.ENEMY[_loc1_].bAlive)
               {
                  _loc2_ = false;
                  break;
               }
               _loc1_++;
            }
            if(_loc2_)
            {
               this.draw.player.bStageClear = true;
               this.draw.nGameFrame = 0;
            }
         }
      }
      
      public function wagonClear() : void
      {
         var _loc1_:int = 0;
         if(this.draw.UNIT[Player.WAGONPOS].nPosX + Player.WAGONDMGWIDTH >= Player.BG_W - Player.WAGON_GOALPOS + this.draw.player.nBgPosX)
         {
            this.enemyAllDie();
            this.draw.player.bStageClear = true;
            this.draw.nGameFrame = 0;
         }
      }
      
      public function warRoadClear() : void
      {
         var _loc1_:int = 0;
         if(this.draw.player.nWarRoadEnemyHp <= 0)
         {
            this.enemyAllDie();
            this.draw.player.bStageClear = true;
            this.draw.nGameFrame = 0;
         }
      }
      
      public function enemyAlreadyAttackUnit(param1:int, param2:int, param3:int) : Boolean
      {
         var _loc4_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < Enemy.MAX_ATTACKUNIT)
         {
            if(this.draw.ENEMY[param1].ATTACKUNIT[param2 * Enemy.MAX_ATTACKUNIT + _loc4_] == param3)
            {
               return false;
            }
            _loc4_++;
         }
         return true;
      }
      
      public function unitAlreadyAttackEnemy(param1:int, param2:int, param3:int) : Boolean
      {
         var _loc4_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < Unit.MAX_ATTACKENEMY)
         {
            if(this.draw.UNIT[param1].ATTACKENEMY[param2 * Unit.MAX_ATTACKENEMY + _loc4_] == param3)
            {
               return false;
            }
            _loc4_++;
         }
         return true;
      }
      
      public function playerAlreadyAttackEnemy(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < Player.MAX_ATTACKENEMY)
         {
            if(this.draw.player.ATTACKENEMY[param1 * Player.MAX_ATTACKENEMY + _loc3_] == param2)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public function initStageSelect() : void
      {
         var _loc1_:int = 0;
         this.draw.bUnitBtn = false;
         this.draw.bUnitTabOver = false;
         this.draw.bEquipBtn = false;
         this.draw.bStoreBtn = false;
         this.draw.bSortingBtn = false;
         this.draw.bDrawSortingList = false;
         this.draw.bEquipTabOver = false;
         this.draw.bStageSelectBtn = false;
         this.draw.bStageSelectTabOver = false;
         this.draw.bMaceSortingBtn = false;
         this.draw.bRingSortingBtn = false;
         this.draw.bNextChapterBtnOver = false;
         this.draw.bBeforeChapterBtnOver = false;
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_STAGE)
         {
            this.draw.STAGESELECTNUMBEROVER[_loc1_] = false;
            _loc1_++;
         }
         this.draw.bUnitUpgradeAct = false;
         this.draw.nUnitUpgradeActFrame = 0;
         this.draw.bMaceEquipAct = false;
         this.draw.nMaceEquipActFrame = 0;
         this.draw.nMenuPos = 0;
         this.draw.nSubMenuPos = 0;
         this.draw.bUpgradeBtn = false;
         this.draw.bEquipTabMouseDown = false;
         this.draw.bEquipTabMouseMove = false;
         this.draw.bBuySellBtn = false;
         this.draw.bStoreItemSelect = false;
         this.draw.bInvenItemSelect = false;
         this.draw.bEquipItemSelect = false;
         this.draw.bItemUnEquipBtn = false;
         this.draw.bBagSelect = false;
         this.draw.bItemEquipBtn = false;
         this.draw.bItemEquipBtnSelect = false;
         this.draw.nBagSortType = Drawing.SORT_KIND;
         this.draw.nStoreItemSelectPos = 0;
         this.draw.nInvenItemSelectPos = Drawing.INITDATA;
         this.draw.nEquipItemSelectPos = Drawing.INITDATA;
         this.draw.nStoreSelectItem = Drawing.INITDATA;
         this.draw.nInvenSelectItem = Drawing.INITDATA;
         this.draw.nEquipSelectItem = Drawing.INITDATA;
         this.draw.nDragItemPosX = Drawing.INITDATA;
         this.draw.nDragItemPosY = Drawing.INITDATA;
         this.draw.player.bInvenMouseMove = false;
         this.draw.player.nInvenPosX = 0;
         this.draw.player.nInvenMovePosX = Drawing.INITDATA;
         this.draw.player.bInvenLeftArrowBtn = false;
         this.draw.player.bInvenRightArrowBtn = false;
         this.draw.nBagPos = 0;
         this.draw.nItemInBag = 0;
         this.setArms(true,Drawing.INITDATA);
      }
      
      public function enemyKnockBack(param1:int, param2:int) : void
      {
         if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
         {
            param2 >>= 1;
         }
         this.draw.ENEMY[param1].nPosX += param2 * (1 + this.draw.nLeakFrame);
         if(this.draw.player.nGameMode == Drawing.MODE_DESTINY || this.draw.player.nGameMode == Drawing.MODE_WARROAD)
         {
            if(this.draw.ENEMY[param1].nPosX >= this.draw.nLcdW + 10)
            {
               this.draw.ENEMY[param1].nPosX = this.draw.nLcdW + 10;
            }
         }
         else if(this.draw.ENEMY[param1].nPosX >= this.draw.player.nBgPosX + Player.BG_W)
         {
            this.draw.ENEMY[param1].nPosX = this.draw.player.nBgPosX + Player.BG_W;
         }
      }
      
      public function onlyOneMace() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc2_ = 0;
         _loc1_ = 0;
         while(_loc1_ < Player.EQUIPINVEN_RINGPOS)
         {
            if(this.draw.player.EQUIPINVEN[_loc1_] > Drawing.INITDATA)
            {
               _loc2_++;
            }
            _loc1_++;
         }
         if(_loc2_ <= 1)
         {
            return true;
         }
         return false;
      }
      
      public function unitDieSnd(param1:int) : void
      {
         switch(this.draw.UNIT[param1].nType)
         {
            case Drawing.UNIT_WAGON:
               this.draw.lib.playEffect(99);
               break;
            default:
               this.draw.lib.playEffect(31 + this.draw.UNIT[param1].nType);
         }
      }
      
      public function unitUpgradeActSnd(param1:int) : void
      {
         switch(param1)
         {
            case Drawing.UNIT_MOUSE:
               if(this.draw.nUnitUpgradeActFrame == 2)
               {
                  this.draw.lib.playEffect(79);
               }
               break;
            case Drawing.UNIT_RABBIT:
               break;
            case Drawing.UNIT_BEAR:
               if(this.draw.nUnitUpgradeActFrame == 10)
               {
                  this.draw.lib.playEffect(77);
               }
               break;
            case Drawing.UNIT_KANGAROO:
               if(this.draw.nUnitUpgradeActFrame == 10)
               {
                  this.draw.lib.playEffect(75);
               }
               break;
            case Drawing.UNIT_TURTLE:
               break;
            case Drawing.UNIT_MONKEY:
               if(this.draw.nUnitUpgradeActFrame == 6)
               {
                  this.draw.lib.playEffect(79);
               }
               break;
            case Drawing.UNIT_RHINO:
               if(this.draw.nUnitUpgradeActFrame == 8)
               {
                  this.draw.lib.playEffect(79);
               }
               break;
            case Drawing.UNIT_PENGUIN:
               if(this.draw.nUnitUpgradeActFrame == 22)
               {
                  this.draw.lib.playEffect(62);
               }
               break;
            case Drawing.UNIT_DRAGON:
               if(this.draw.nUnitUpgradeActFrame == 0)
               {
                  this.draw.lib.playEffect(41);
               }
         }
      }
      
      public function unitAtkSnd(param1:int) : void
      {
         switch(this.draw.UNIT[param1].nType)
         {
            case Drawing.UNIT_MOUSE:
               if(this.draw.UNIT[param1].bSkillAtk)
               {
                  if(this.draw.UNIT[param1].nAtkFrame == 0)
                  {
                     this.draw.lib.playEffect(88);
                  }
                  else if(this.draw.UNIT[param1].nAtkFrame == 12)
                  {
                     this.draw.lib.playEffect(80);
                  }
               }
               else if(this.draw.UNIT[param1].nAtkFrame == 2)
               {
                  this.draw.lib.playEffect(79);
               }
               break;
            case Drawing.UNIT_RABBIT:
               break;
            case Drawing.UNIT_BEAR:
               if(this.draw.UNIT[param1].bSkillAtk)
               {
                  if(this.draw.UNIT[param1].nAtkFrame == 0)
                  {
                     this.draw.lib.playEffect(90);
                  }
                  else if(this.draw.UNIT[param1].nAtkFrame == 18)
                  {
                     this.draw.lib.playEffect(77);
                  }
               }
               else if(this.draw.UNIT[param1].nAtkFrame == 10)
               {
                  this.draw.lib.playEffect(77);
               }
               break;
            case Drawing.UNIT_KANGAROO:
               if(this.draw.UNIT[param1].bSkillAtk)
               {
                  if(this.draw.UNIT[param1].nAtkFrame == 0)
                  {
                     this.draw.lib.playEffect(91);
                  }
               }
               else if(this.draw.UNIT[param1].nAtkFrame == 10)
               {
                  this.draw.lib.playEffect(75);
               }
               break;
            case Drawing.UNIT_TURTLE:
               break;
            case Drawing.UNIT_MONKEY:
               if(this.draw.UNIT[param1].bSkillAtk)
               {
                  if(this.draw.UNIT[param1].nAtkFrame == 0)
                  {
                     this.draw.lib.playEffect(92);
                  }
                  else if(this.draw.UNIT[param1].nAtkFrame == 6)
                  {
                     this.draw.lib.playEffect(92);
                  }
               }
               else if(this.draw.UNIT[param1].nAtkFrame == 6)
               {
                  this.draw.lib.playEffect(79);
               }
               break;
            case Drawing.UNIT_RHINO:
               if(this.draw.UNIT[param1].bSkillAtk)
               {
                  if(this.draw.UNIT[param1].nAtkFrame == 18)
                  {
                     this.draw.lib.playEffect(93);
                  }
               }
               else if(this.draw.UNIT[param1].nAtkFrame == 8)
               {
                  this.draw.lib.playEffect(79);
               }
               break;
            case Drawing.UNIT_PENGUIN:
               if(this.draw.UNIT[param1].bSkillAtk)
               {
                  if(this.draw.UNIT[param1].nAtkFrame == 22)
                  {
                     this.draw.lib.playEffect(94);
                  }
               }
               else if(this.draw.UNIT[param1].nAtkFrame == 22)
               {
                  this.draw.lib.playEffect(62);
               }
               break;
            case Drawing.UNIT_DRAGON:
               if(this.draw.UNIT[param1].bSkillAtk)
               {
                  if(this.draw.UNIT[param1].nAtkFrame == 0)
                  {
                     this.draw.lib.playEffect(95);
                  }
               }
               else if(this.draw.UNIT[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(41);
               }
         }
      }
      
      public function enemyAtkSnd(param1:int) : void
      {
         switch(this.draw.ENEMY[param1].nBaseType)
         {
            case Drawing.ENEMY_ZOMBIE:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(103);
               }
               break;
            case Drawing.ENEMY_WOMANSKELETON:
               if(this.draw.ENEMY[param1].nAtkFrame == 24)
               {
                  this.draw.lib.playEffect(65);
               }
               break;
            case Drawing.ENEMY_WITCH:
               if(this.draw.ENEMY[param1].nAtkFrame == 14)
               {
                  this.draw.lib.playEffect(79);
               }
               break;
            case Drawing.ENEMY_DEVIL:
               if(this.draw.ENEMY[param1].nAtkFrame == 14)
               {
                  this.draw.lib.playEffect(77);
               }
               break;
            case Drawing.ENEMY_RINGGHOST:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(87);
               }
               break;
            case Drawing.ENEMY_MANSKELETON:
               if(this.draw.ENEMY[param1].nAtkFrame == 34)
               {
                  this.draw.lib.playEffect(1);
               }
               break;
            case Drawing.ENEMY_MUMMY:
               if(this.draw.ENEMY[param1].nAtkFrame == 12)
               {
                  this.draw.lib.playEffect(75);
               }
               break;
            case Drawing.ENEMY_FRANKEN:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(51);
               }
               break;
            case Drawing.ENEMY_GHOST:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(53);
               }
               break;
            case Drawing.ENEMY_DARKZOMBIE:
               if(this.draw.ENEMY[param1].nAtkFrame == 14)
               {
                  this.draw.lib.playEffect(85);
               }
               break;
            case Drawing.ENEMY_KNIGHTSKELETON:
               if(this.draw.ENEMY[param1].nAtkFrame == 8)
               {
                  this.draw.lib.playEffect(80);
               }
               break;
            case Drawing.ENEMY_STONE:
            case Drawing.ENEMY_ARMORSHIELD:
               break;
            case Drawing.ENEMY_MINERZOMBIE:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(67);
               }
               break;
            case Drawing.ENEMY_PUMPKIN:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(74);
               }
               break;
            case Drawing.ENEMY_ONEEYEDPERSON:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(26);
               }
               break;
            case Drawing.ENEMY_ARMORAXE:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(0);
               }
               break;
            case Drawing.ENEMY_BOMB:
               if(this.draw.ENEMY[param1].nAtkFrame < 148)
               {
                  if(this.draw.ENEMY[param1].nAtkFrame % 15 == 0)
                  {
                     this.draw.lib.playEffect(13);
                  }
               }
               else if(this.draw.ENEMY[param1].nAtkFrame == 148)
               {
                  this.draw.lib.playEffect(46);
               }
               break;
            case Drawing.ENEMY_ONEEYEDMONSTER:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(12);
               }
               break;
            case Drawing.ENEMY_LANCEZOMBIE:
               if(this.draw.ENEMY[param1].nAtkFrame == 14)
               {
                  this.draw.lib.playEffect(77);
               }
               break;
            case Drawing.ENEMY_BOSSZOMBIE:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(2);
               }
               break;
            case Drawing.ENEMY_BOSSWITCH:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(3);
               }
               break;
            case Drawing.ENEMY_BOSSSOCCER:
               if(this.draw.ENEMY[param1].nAtkFrame == 40)
               {
                  this.draw.lib.playEffect(4);
               }
               break;
            case Drawing.ENEMY_BOSSMUMMY:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(5);
               }
               break;
            case Drawing.ENEMY_BOSSGHOST:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(53);
               }
               break;
            case Drawing.ENEMY_BOSSBIGMOUTH:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffectLoop(7,2);
               }
               break;
            case Drawing.ENEMY_BOSSPALADOG:
               break;
            case Drawing.ENEMY_BOSSDRAGON:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(8);
               }
               break;
            case Drawing.ENEMY_BOSSWOMANDEVIL:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(9);
               }
               if(this.draw.ENEMY[param1].nAtkFrame == 28)
               {
                  this.draw.lib.playEffect(83);
               }
               break;
            case Drawing.ENEMY_BOSSMANDEVIL:
               if(this.draw.ENEMY[param1].nAtkFrame == 0)
               {
                  this.draw.lib.playEffect(10);
               }
               else if(this.draw.ENEMY[param1].nAtkFrame == 30)
               {
                  this.draw.lib.playEffect(65);
               }
         }
      }
      
      public function playerStop() : void
      {
         this.draw.player.bMoveLeft = false;
         this.draw.player.bBgLeft = false;
         this.draw.player.bMoveRight = false;
         this.draw.player.bBgRight = false;
         this.draw.player.nMoveDirection = Drawing.INITDATA;
         this.draw.player.nMoveBgPosX = Drawing.INITDATA;
      }
      
      public function resetMouseDrag() : void
      {
         var _loc1_:Number = NaN;
         if(this.draw.player.nSubBgPosX < Drawing.BGINITX)
         {
            _loc1_ = this.draw.player.nBgPosX;
            this.draw.player.nBgPosX = this.draw.player.nSubBgPosX;
            this.draw.player.nBg2PosX = this.draw.player.nSubBg2PosX;
            this.draw.player.nSubBgPosX = Drawing.BGINITX;
            this.draw.player.nSubBg2PosX = Drawing.BGINITX;
            if(this.draw.player.nPosX == this.draw.player.nMoveBg)
            {
               this.draw.player.nPosX = this.draw.player.nMoveBg;
            }
            else
            {
               this.draw.player.nPosX = this.draw.player.nSubPosX;
            }
            this.draw.player.nSubPosX = Drawing.BGINITX;
            _loc1_ = this.draw.player.nBgPosX - _loc1_;
            this.playerControlMove(_loc1_);
         }
      }
      
      public function setGamePlayTime(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1)
         {
            this.draw.player.nGamePlayStartTime = getTimer();
         }
         else
         {
            this.draw.player.nNowTime = getTimer();
            this.draw.player.nGamePlayTime += (this.draw.player.nNowTime - this.draw.player.nGamePlayStartTime) / 1000 * (1 + this.draw.player.nGameSpeed);
            this.draw.player.nGamePlayStartTime = 0;
         }
         this.draw.nTotalStarNum = 0;
         _loc2_ = 0;
         while(_loc2_ < Player.MAX_STAGE * Player.MAX_CHAPTER)
         {
            this.draw.nTotalStarNum += this.draw.player.STAGECLEARRESULTSTAR[_loc2_];
            _loc2_++;
         }
      }
      
      public function unitDmg(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         _loc4_ = 0;
         _loc4_ = param2;
         if(this.draw.UNIT[param1].bInAura)
         {
            _loc4_ = param2 * (1 - this.draw.player.HEROSKILL[Player.SKILL_DEFAURA] / 10);
         }
         if(this.draw.UNIT[param1].bDefense)
         {
            this.draw.lib.playEffect(59);
            _loc4_ >>= 1;
         }
         else
         {
            this.draw.lib.playEffect(56);
         }
         this.setAttacked(Player.UNITATTACKED,param1,param3);
         this.draw.UNIT[param1].nHp -= _loc4_;
         if(this.draw.UNIT[param1].nHp <= 0)
         {
            this.draw.UNIT[param1].nHp = 0;
            this.draw.UNIT[param1].bAlive = false;
            this.draw.UNIT[param1].bMove = false;
            this.draw.UNIT[param1].bIce = false;
            this.draw.UNIT[param1].bPoison = false;
            this.draw.UNIT[param1].bDieAni = true;
            ++this.draw.player.nUnitDieNum;
            this.draw.UNIT[param1].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
            if(this.draw.player.nGameMode == Drawing.MODE_WAGON)
            {
               if(param1 == Player.WAGONPOS)
               {
                  this.setGameOver();
               }
            }
         }
         else if(this.draw.UNIT[param1].nHp < this.draw.UNIT[param1].nMaxHp * 20 / 100 && !this.draw.UNIT[param1].bWarningHp)
         {
            this.draw.UNIT[param1].bAttack = false;
            this.draw.UNIT[param1].nAttackEnemy = Drawing.INITDATA;
            this.draw.UNIT[param1].nAtkFrame = 0;
            this.draw.UNIT[param1].bMove = false;
            this.draw.UNIT[param1].bKnockDown = true;
            this.draw.UNIT[param1].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
            this.draw.UNIT[param1].nKnockDownAniFrame = 0;
            this.draw.UNIT[param1].bWarningHp = true;
            this.draw.lib.playEffect(57);
         }
         else if(this.draw.UNIT[param1].nType != Drawing.UNIT_TURTLE)
         {
            this.draw.UNIT[param1].nPosX -= Player.KNOCKBACKWIDTH;
         }
      }
      
      public function setStageQuest() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         _loc4_ = this.draw.player.nChapter * Player.MAX_STAGE + (this.draw.player.nTouchStage - 1);
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_QUEST * Player.MAX_STRQUESTLINE)
         {
            this.draw.player.STRQUEST[_loc1_] = null;
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_QUEST)
         {
            this.draw.player.STRQUESTLINE[_loc1_] = 0;
            this.draw.player.QUESTCOMPLETE[_loc1_] = Player.QUEST_NONE;
            _loc1_++;
         }
         this.draw.player.nNotUseUnitIndex = Drawing.INITDATA;
         this.draw.player.nUseUnitIndex = Drawing.INITDATA;
         this.draw.player.nNotUseMaceIndex = Drawing.INITDATA;
         this.draw.player.nUseMaceIndex = Drawing.INITDATA;
         _loc1_ = 0;
         while(_loc1_ < this.draw.QUESTICONDB.length)
         {
            if(this.draw.QUESTICONDB[_loc1_].strChaNameIndex == "b01")
            {
               _loc8_ = _loc1_;
            }
            else if(this.draw.QUESTICONDB[_loc1_].strChaNameIndex == "m01")
            {
               _loc9_ = _loc1_;
            }
            else if(this.draw.QUESTICONDB[_loc1_].strChaNameIndex == "x01")
            {
               _loc10_ = _loc1_;
            }
            else if(this.draw.QUESTICONDB[_loc1_].strChaNameIndex == "n01")
            {
               _loc7_ = _loc1_;
            }
            else if(this.draw.QUESTICONDB[_loc1_].strChaNameIndex == "u01")
            {
               _loc6_ = _loc1_;
            }
            _loc1_++;
         }
         this.draw.player.nStrValuePos = 0;
         _loc5_ = int(this.draw.QUESTDB[_loc4_].nMainQuestIndex);
         this.draw.player.QUESTTYPE[0] = _loc5_;
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_QUESTREWARD)
         {
            this.draw.player.QUESTREWARD[_loc1_] = this.draw.QUESTDB[_loc4_].MAINQUESTREWARD[_loc1_];
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < QuestDB.MAX_QUESTVALUE)
         {
            switch(this.draw.player.QUESTTYPE[0])
            {
               case 8:
               case 12:
               case 13:
               case 15:
               case 16:
                  if(_loc1_ == 0)
                  {
                     _loc2_ = 0;
                     while(_loc2_ < this.draw.QUESTICONDB.length)
                     {
                        if(this.draw.QUESTDB[_loc4_].MAINQUESTVALUE[0] == this.draw.QUESTICONDB[_loc2_].strChaName)
                        {
                           switch(this.draw.player.QUESTTYPE[0])
                           {
                              case 8:
                                 this.draw.player.QUESTPROCESS[_loc1_] = _loc2_ - _loc8_;
                                 break;
                              case 12:
                                 this.draw.player.QUESTPROCESS[_loc1_] = _loc2_ - _loc7_;
                                 this.draw.player.nNotUseUnitIndex = this.draw.player.QUESTPROCESS[_loc1_];
                                 break;
                              case 13:
                                 this.draw.player.QUESTPROCESS[_loc1_] = _loc2_ - _loc7_;
                                 this.draw.player.nUseUnitIndex = this.draw.player.QUESTPROCESS[_loc1_];
                                 break;
                              case 15:
                                 this.draw.player.QUESTPROCESS[_loc1_] = _loc2_ - _loc9_;
                                 this.draw.player.nNotUseMaceIndex = this.draw.player.QUESTPROCESS[_loc1_];
                                 break;
                              case 16:
                                 this.draw.player.QUESTPROCESS[_loc1_] = _loc2_ - _loc9_;
                                 this.draw.player.nUseMaceIndex = this.draw.player.QUESTPROCESS[_loc1_];
                           }
                           break;
                        }
                        _loc2_++;
                     }
                  }
                  else
                  {
                     this.draw.player.QUESTPROCESS[_loc1_] = this.draw.lib.strToInt(this.draw.QUESTDB[_loc4_].MAINQUESTVALUE[_loc1_]);
                  }
                  break;
               default:
                  this.draw.player.QUESTPROCESS[_loc1_] = this.draw.lib.strToInt(this.draw.QUESTDB[_loc4_].MAINQUESTVALUE[_loc1_]);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_STRQUESTLINE)
         {
            if(this.draw.QUESTTYPEDB[_loc5_].STRQUESTTYPE[_loc1_] != null)
            {
               this.draw.player.STRQUEST[_loc1_] = "" + this.draw.QUESTTYPEDB[_loc5_].STRQUESTTYPE[_loc1_];
               this.draw.player.STRQUEST[_loc1_] = "" + this.setStrQuest(this.draw.player.STRQUEST[_loc1_],this.draw.QUESTDB[_loc4_].MAINQUESTVALUE);
            }
            _loc1_++;
         }
         this.draw.player.QUESTICON[0] = this.draw.QUESTDB[_loc4_].nMainQuestIcon;
         this.draw.player.nStrValuePos = 0;
         _loc5_ = int(this.draw.QUESTDB[_loc4_].nSubQuest1Index);
         this.draw.player.QUESTTYPE[1] = _loc5_;
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_QUESTREWARD)
         {
            this.draw.player.QUESTREWARD[_loc1_ + Player.MAX_QUESTREWARD] = this.draw.QUESTDB[_loc4_].SUBQUEST1REWARD[_loc1_];
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < QuestDB.MAX_QUESTVALUE)
         {
            switch(this.draw.player.QUESTTYPE[1])
            {
               case 8:
               case 12:
               case 13:
               case 15:
               case 16:
                  if(_loc1_ == 0)
                  {
                     _loc2_ = 0;
                     while(_loc2_ < this.draw.QUESTICONDB.length)
                     {
                        if(this.draw.QUESTDB[_loc4_].SUBQUEST1VALUE[0] == this.draw.QUESTICONDB[_loc2_].strChaName)
                        {
                           switch(this.draw.player.QUESTTYPE[1])
                           {
                              case 8:
                                 this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE] = _loc2_ - _loc8_;
                                 break;
                              case 12:
                                 this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE] = _loc2_ - _loc7_;
                                 this.draw.player.nNotUseUnitIndex = this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE];
                                 break;
                              case 13:
                                 this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE] = _loc2_ - _loc7_;
                                 this.draw.player.nUseUnitIndex = this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE];
                                 break;
                              case 15:
                                 this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE] = _loc2_ - _loc9_;
                                 this.draw.player.nNotUseMaceIndex = this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE];
                                 break;
                              case 16:
                                 this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE] = _loc2_ - _loc9_;
                                 this.draw.player.nUseMaceIndex = this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE];
                           }
                           break;
                        }
                        _loc2_++;
                     }
                  }
                  else
                  {
                     this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE] = this.draw.lib.strToInt(this.draw.QUESTDB[_loc4_].SUBQUEST1VALUE[_loc1_]);
                  }
                  break;
               default:
                  this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE] = this.draw.lib.strToInt(this.draw.QUESTDB[_loc4_].SUBQUEST1VALUE[_loc1_]);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_STRQUESTLINE)
         {
            if(this.draw.QUESTTYPEDB[_loc5_].STRQUESTTYPE[_loc1_] != null)
            {
               this.draw.player.STRQUEST[_loc1_ + Player.MAX_STRQUESTLINE] = this.draw.QUESTTYPEDB[_loc5_].STRQUESTTYPE[_loc1_];
               this.draw.player.STRQUEST[_loc1_ + Player.MAX_STRQUESTLINE] = "" + this.setStrQuest(this.draw.player.STRQUEST[_loc1_ + Player.MAX_STRQUESTLINE],this.draw.QUESTDB[_loc4_].SUBQUEST1VALUE);
            }
            _loc1_++;
         }
         this.draw.player.QUESTICON[1] = this.draw.QUESTDB[_loc4_].nSubQuest1Icon;
         this.draw.player.nStrValuePos = 0;
         _loc5_ = int(this.draw.QUESTDB[_loc4_].nSubQuest2Index);
         this.draw.player.QUESTTYPE[2] = _loc5_;
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_QUESTREWARD)
         {
            this.draw.player.QUESTREWARD[_loc1_ + Player.MAX_QUESTREWARD * 2] = this.draw.QUESTDB[_loc4_].SUBQUEST2REWARD[_loc1_];
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < QuestDB.MAX_QUESTVALUE)
         {
            switch(this.draw.player.QUESTTYPE[2])
            {
               case 8:
               case 12:
               case 13:
               case 15:
               case 16:
                  if(_loc1_ == 0)
                  {
                     _loc2_ = 0;
                     while(_loc2_ < this.draw.QUESTICONDB.length)
                     {
                        if(this.draw.QUESTDB[_loc4_].SUBQUEST2VALUE[0] == this.draw.QUESTICONDB[_loc2_].strChaName)
                        {
                           switch(this.draw.player.QUESTTYPE[2])
                           {
                              case 8:
                                 this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE * 2] = _loc2_ - _loc8_;
                                 break;
                              case 12:
                                 this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE * 2] = _loc2_ - _loc7_;
                                 this.draw.player.nNotUseUnitIndex = this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE * 2];
                                 break;
                              case 13:
                                 this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE * 2] = _loc2_ - _loc7_;
                                 this.draw.player.nUseUnitIndex = this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE * 2];
                                 break;
                              case 15:
                                 this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE * 2] = _loc2_ - _loc9_;
                                 this.draw.player.nNotUseMaceIndex = this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE * 2];
                                 break;
                              case 16:
                                 this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE * 2] = _loc2_ - _loc9_;
                                 this.draw.player.nUseMaceIndex = this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE * 2];
                           }
                           break;
                        }
                        _loc2_++;
                     }
                  }
                  else
                  {
                     this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE * 2] = this.draw.lib.strToInt(this.draw.QUESTDB[_loc4_].SUBQUEST2VALUE[_loc1_]);
                  }
                  break;
               default:
                  this.draw.player.QUESTPROCESS[_loc1_ + QuestDB.MAX_QUESTVALUE * 2] = this.draw.lib.strToInt(this.draw.QUESTDB[_loc4_].SUBQUEST2VALUE[_loc1_]);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_STRQUESTLINE)
         {
            if(this.draw.QUESTTYPEDB[_loc5_].STRQUESTTYPE[_loc1_] != null)
            {
               this.draw.player.STRQUEST[_loc1_ + Player.MAX_STRQUESTLINE * 2] = this.draw.QUESTTYPEDB[_loc5_].STRQUESTTYPE[_loc1_];
               this.draw.player.STRQUEST[_loc1_ + Player.MAX_STRQUESTLINE * 2] = "" + this.setStrQuest(this.draw.player.STRQUEST[_loc1_ + Player.MAX_STRQUESTLINE * 2],this.draw.QUESTDB[_loc4_].SUBQUEST2VALUE);
            }
            _loc1_++;
         }
         this.draw.player.QUESTICON[2] = this.draw.QUESTDB[_loc4_].nSubQuest2Icon;
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_QUEST)
         {
            _loc3_ = 0;
            _loc2_ = 0;
            while(_loc2_ < Player.MAX_STRQUESTLINE)
            {
               if(this.draw.player.STRQUEST[_loc2_ + _loc1_ * Player.MAX_STRQUESTLINE] != null)
               {
                  _loc3_++;
               }
               _loc2_++;
            }
            this.draw.player.STRQUESTLINE[_loc1_] = _loc3_;
            this.draw.player.QUESTCOMPLETE[_loc1_] = Player.QUEST_NONE;
            _loc1_++;
         }
      }
      
      public function setStrQuest(param1:String, param2:Array) : String
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         _loc5_ = 7;
         _loc6_ = "";
         _loc7_ = new Array(_loc5_);
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc7_[_loc3_] = null;
            _loc3_++;
         }
         _loc8_ = 0;
         _loc9_ = 0;
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1.charCodeAt(_loc3_);
            if(_loc4_ == 64)
            {
               _loc7_[_loc8_] = this.setCString(param1,_loc9_,_loc3_);
               _loc7_[_loc8_] += param2[this.draw.player.nStrValuePos];
               _loc8_++;
               ++this.draw.player.nStrValuePos;
               _loc9_ = _loc3_ + 2;
            }
            _loc3_++;
         }
         _loc7_[_loc8_] = this.setCString(param1,_loc9_,_loc3_);
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            if(_loc7_[_loc3_] != null)
            {
               _loc6_ += _loc7_[_loc3_];
            }
            _loc3_++;
         }
         return _loc6_;
      }
      
      public function setCString(param1:String, param2:int, param3:int) : String
      {
         var _loc4_:String = null;
         return param1.substring(param2,param3);
      }
      
      public function drawQuestProcess(param1:Boolean, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         _loc6_ = 0;
         _loc7_ = 0;
         _loc8_ = 42;
         _loc9_ = 8;
         _loc10_ = 0;
         if(param1)
         {
            _loc6_ = param4 * 64;
         }
         else
         {
            _loc7_ = param4 * 110;
            _loc8_ = 70;
            _loc9_ = 8;
         }
         switch(this.draw.player.QUESTTYPE[param4])
         {
            case 0:
               this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * (this.draw.player.nEnemyStationMaxHp - this.draw.player.nEnemyStationHp) / this.draw.player.nEnemyStationMaxHp,_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               break;
            case 2:
               this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * this.draw.player.nDestinyTotalDieEnemy / Player.DESTINYTOTALENEMYNUM,_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               break;
            case 4:
               _loc10_ = _loc8_ * (this.draw.UNIT[Player.WAGONPOS].nPosX + Player.WAGON_STARTPOS - this.draw.player.nBgPosX) / Player.BG_W;
               if(param1)
               {
                  if(_loc10_ >= 42)
                  {
                     _loc10_ = 42;
                  }
               }
               else if(_loc10_ >= 70)
               {
                  _loc10_ = 70;
               }
               this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc10_,_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               break;
            case 6:
               _loc11_ = Player.nWarRoadEnemyMaxHp >> 1;
               _loc12_ = 20 - this.draw.player.nWarRoadEnemyHp;
               if(_loc12_ <= 0)
               {
                  _loc12_ = 0;
               }
               this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * _loc12_ / _loc11_,_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               break;
            case 8:
               if(this.draw.player.bEnemyStationCrashed || this.draw.player.bBossEnemyAppear)
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * (this.draw.ENEMY[this.draw.player.nBossEnemyIndex].nMaxHp - this.draw.ENEMY[this.draw.player.nBossEnemyIndex].nHp) / this.draw.ENEMY[this.draw.player.nBossEnemyIndex].nMaxHp,_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
               break;
            case 1:
               if(this.draw.player.nHp >= this.playerHp() / 100 * this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4])
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * this.draw.player.nHp / this.playerHp(),_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
               else
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * this.draw.player.nHp / this.playerHp(),_loc9_,16711680,Drawing.TOP | Drawing.LEFT);
               }
               break;
            case 3:
               _loc13_ = 0;
               _loc5_ = 0;
               while(_loc5_ < Drawing.MAX_DESTINYICONNUM)
               {
                  if(this.draw.DESTINYICON[_loc5_].bAppear)
                  {
                     _loc13_++;
                  }
                  _loc5_++;
               }
               if(_loc13_ >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4])
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * _loc13_ / Drawing.MAX_DESTINYICONNUM,_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
               else
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * _loc13_ / Drawing.MAX_DESTINYICONNUM,_loc9_,16711680,Drawing.TOP | Drawing.LEFT);
               }
               break;
            case 5:
               if(this.draw.UNIT[Player.WAGONPOS].nHp >= this.draw.UNIT[Player.WAGONPOS].nMaxHp / 100 * this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4])
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * this.draw.UNIT[Player.WAGONPOS].nHp / this.draw.UNIT[Player.WAGONPOS].nMaxHp,_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
               else
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * this.draw.UNIT[Player.WAGONPOS].nHp / this.draw.UNIT[Player.WAGONPOS].nMaxHp,_loc9_,16711680,Drawing.TOP | Drawing.LEFT);
               }
               break;
            case 7:
               if(this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4] - this.draw.player.nWarRoadArriveEnemy >= 0)
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * (this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4] - this.draw.player.nWarRoadArriveEnemy) / this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4],_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
               break;
            case 9:
               _loc14_ = this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4] * 60 + this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4 + 1];
               if(_loc14_ - this.draw.player.nPlayTime >= 0)
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * (_loc14_ - this.draw.player.nPlayTime) / _loc14_,_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
               break;
            case 10:
               if(this.draw.player.nStageEatMoney >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4])
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_,_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
               else
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * this.draw.player.nStageEatMoney / this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4],_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
               break;
            case 11:
               if(this.draw.player.nStageDieEnemy >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4])
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_,_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
               else
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * this.draw.player.nStageDieEnemy / this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4],_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
               break;
            case 12:
               if(this.draw.player.nNotUseUnitNum <= 0)
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_,_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
               break;
            case 13:
               if(this.draw.player.nUseUnitNum >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4 + 1])
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_,_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
               else
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * this.draw.player.nUseUnitNum / this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4 + 1],_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
               break;
            case 14:
               if(this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4] - this.draw.player.nUnitDieNum > 0)
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * (this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4] - this.draw.player.nUnitDieNum) / this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4],_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
               break;
            case 15:
               if(this.draw.player.nNotUseMace <= 0)
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_,_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
               break;
            case 16:
               if(this.draw.player.nUseMaceNum >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4 + 1])
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_,_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
               else
               {
                  this.draw.lib.fillRect(param2 + _loc6_,param3 + _loc7_,_loc8_ * this.draw.player.nUseMaceNum / this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param4 + 1],_loc9_,2096897,Drawing.TOP | Drawing.LEFT);
               }
         }
      }
      
      public function searchQuestComplete() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_QUEST)
         {
            this.drawQuestProcess(true,579,63,_loc1_);
            this.questComplete(_loc1_);
            switch(this.draw.player.QUESTCOMPLETE[_loc1_])
            {
               case Player.QUEST_COMPLETE:
                  this.draw.lib.drawImg(Drawing.imgUi + 68,_loc1_ * 64,0,Drawing.TOP | Drawing.LEFT);
                  break;
               case Player.QUEST_WARNING:
                  this.draw.lib.drawImg(Drawing.imgUi + 65,_loc1_ * 64,0,Drawing.TOP | Drawing.LEFT);
                  break;
               case Player.QUEST_FAIL:
                  this.draw.lib.drawImg(Drawing.imgUi + 66,_loc1_ * 64,0,Drawing.TOP | Drawing.LEFT);
            }
            _loc1_++;
         }
      }
      
      public function questComplete(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         switch(this.draw.player.QUESTTYPE[param1])
         {
            case 0:
               if(this.draw.player.nEnemyStationHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
               }
               else if(this.draw.player.nHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               break;
            case 2:
               if(this.draw.player.nDestinyTotalDieEnemy >= Player.DESTINYTOTALENEMYNUM)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
               }
               else if(this.draw.player.nHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               break;
            case 4:
               if(this.draw.UNIT[Player.WAGONPOS].nPosX + Player.WAGONDMGWIDTH >= Player.BG_W + this.draw.player.nBgPosX - 60)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
               }
               else if(this.draw.player.nHp <= 0 || this.draw.UNIT[Player.WAGONPOS].nHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               break;
            case 6:
               if(this.draw.player.nWarRoadEnemyHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
               }
               else if(this.draw.player.nWarRoadEnemyHp >= Player.nWarRoadEnemyMaxHp)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               break;
            case 8:
               if(this.draw.player.bEnemyStationCrashed || this.draw.player.bBossEnemyAppear)
               {
                  if(this.draw.ENEMY[this.draw.player.nBossEnemyIndex].nHp <= 0)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
               }
               if(this.draw.player.nHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               break;
            case 1:
               if(this.draw.player.nGameMode == Drawing.MODE_WAGON)
               {
                  if(this.draw.player.nHp <= 0 || this.draw.UNIT[Player.WAGONPOS].nHp <= 0)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.bStageClear)
                  {
                     if(this.draw.player.nHp >= this.playerHp() / 100 * this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
                     {
                        if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                        {
                           this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                        }
                        this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                     }
                     else
                     {
                        if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                        {
                           this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                        }
                        this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                     }
                  }
                  else if(this.draw.player.nHp >= this.playerHp() / 100 * this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
                  {
                     if(!this.draw.player.bQuestSnd_paladogHp)
                     {
                        this.draw.player.bQuestSnd_paladogHp = true;
                     }
                     else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_WARNING)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTWARNING);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_WARNING;
                  }
               }
               else if(this.draw.player.nHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               else if(this.draw.player.bStageClear)
               {
                  if(this.draw.player.nHp >= this.playerHp() / 100 * this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nHp >= this.playerHp() / 100 * this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
               {
                  if(!this.draw.player.bQuestSnd_paladogHp)
                  {
                     this.draw.player.bQuestSnd_paladogHp = true;
                  }
                  else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
               }
               else
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_WARNING)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTWARNING);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_WARNING;
               }
               break;
            case 3:
               _loc3_ = 0;
               if(this.draw.player.nHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               else if(this.draw.player.bStageClear)
               {
                  _loc2_ = 0;
                  while(_loc2_ < Drawing.MAX_DESTINYICONNUM)
                  {
                     if(this.draw.DESTINYICON[_loc2_].bAppear)
                     {
                        _loc3_++;
                     }
                     _loc2_++;
                  }
                  if(_loc3_ >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else
               {
                  _loc2_ = 0;
                  while(_loc2_ < Drawing.MAX_DESTINYICONNUM)
                  {
                     if(this.draw.DESTINYICON[_loc2_].bAppear)
                     {
                        _loc3_++;
                     }
                     _loc2_++;
                  }
                  if(_loc3_ >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else
                  {
                     if(!this.draw.player.bQuestSnd_destinyIcon)
                     {
                        this.draw.player.bQuestSnd_destinyIcon = true;
                     }
                     else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_WARNING)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTWARNING);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_WARNING;
                  }
               }
               break;
            case 5:
               if(this.draw.player.nHp <= 0 || this.draw.UNIT[Player.WAGONPOS].nHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               else if(this.draw.player.bStageClear)
               {
                  if(this.draw.UNIT[Player.WAGONPOS].nHp >= this.draw.UNIT[Player.WAGONPOS].nMaxHp / 100 * this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.UNIT[Player.WAGONPOS].nHp >= this.draw.UNIT[Player.WAGONPOS].nMaxHp / 100 * this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
               {
                  if(!this.draw.player.bQuestSnd_wagonHp)
                  {
                     this.draw.player.bQuestSnd_wagonHp = true;
                  }
                  else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
               }
               else
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_WARNING)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTWARNING);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_WARNING;
               }
               break;
            case 7:
               if(this.draw.player.nWarRoadEnemyHp >= Player.nWarRoadEnemyMaxHp)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               else if(this.draw.player.nWarRoadArriveEnemy <= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
               {
                  if(!this.draw.player.bQuestSnd_arriveMob)
                  {
                     this.draw.player.bQuestSnd_arriveMob = true;
                  }
                  else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
               }
               else
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               break;
            case 9:
               _loc4_ = this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1] * 60 + this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1 + 1];
               if(this.draw.player.nGameMode == Drawing.MODE_WAGON)
               {
                  if(this.draw.player.nHp <= 0 || this.draw.UNIT[Player.WAGONPOS].nHp <= 0)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.nPlayTime <= _loc4_)
                  {
                     if(!this.draw.player.bQuestSnd_clearTime)
                     {
                        this.draw.player.bQuestSnd_clearTime = true;
                     }
                     else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
               {
                  if(this.draw.player.nWarRoadEnemyHp >= Player.nWarRoadEnemyMaxHp)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.nPlayTime <= _loc4_)
                  {
                     if(!this.draw.player.bQuestSnd_clearTime)
                     {
                        this.draw.player.bQuestSnd_clearTime = true;
                     }
                     else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               else if(this.draw.player.nPlayTime <= _loc4_)
               {
                  if(!this.draw.player.bQuestSnd_clearTime)
                  {
                     this.draw.player.bQuestSnd_clearTime = true;
                  }
                  else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
               }
               else
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               break;
            case 10:
               if(this.draw.player.nGameMode == Drawing.MODE_WAGON)
               {
                  if(this.draw.player.nHp <= 0 || this.draw.UNIT[Player.WAGONPOS].nHp <= 0)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.nStageEatMoney >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else if(this.draw.player.bStageClear)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
               {
                  if(this.draw.player.nWarRoadEnemyHp >= Player.nWarRoadEnemyMaxHp)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.nStageEatMoney >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else if(this.draw.player.bStageClear)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               else if(this.draw.player.nStageEatMoney >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
               }
               else if(this.draw.player.bStageClear)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               break;
            case 11:
               if(this.draw.player.nGameMode == Drawing.MODE_WAGON)
               {
                  if(this.draw.player.nHp <= 0 || this.draw.UNIT[Player.WAGONPOS].nHp <= 0)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.nStageDieEnemy >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else if(this.draw.player.bStageClear)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
               {
                  if(this.draw.player.nWarRoadEnemyHp >= Player.nWarRoadEnemyMaxHp)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.nStageDieEnemy >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else if(this.draw.player.bStageClear)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               else if(this.draw.player.nStageDieEnemy >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
               }
               else if(this.draw.player.bStageClear)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               break;
            case 12:
               if(this.draw.player.nGameMode == Drawing.MODE_WAGON)
               {
                  if(this.draw.player.nHp <= 0 || this.draw.UNIT[Player.WAGONPOS].nHp <= 0)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.nNotUseUnitNum <= 0)
                  {
                     if(!this.draw.player.bQuestSnd_notUseUnit)
                     {
                        this.draw.player.bQuestSnd_notUseUnit = true;
                     }
                     else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
               {
                  if(this.draw.player.nWarRoadEnemyHp >= Player.nWarRoadEnemyMaxHp)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.nNotUseUnitNum <= 0)
                  {
                     if(!this.draw.player.bQuestSnd_notUseUnit)
                     {
                        this.draw.player.bQuestSnd_notUseUnit = true;
                     }
                     else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               else if(this.draw.player.nNotUseUnitNum <= 0)
               {
                  if(!this.draw.player.bQuestSnd_notUseUnit)
                  {
                     this.draw.player.bQuestSnd_notUseUnit = true;
                  }
                  else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
               }
               else
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               break;
            case 13:
               if(this.draw.player.nGameMode == Drawing.MODE_WAGON)
               {
                  if(this.draw.player.nHp <= 0 || this.draw.UNIT[Player.WAGONPOS].nHp <= 0)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.nUseUnitNum >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1 + 1])
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else if(this.draw.player.bStageClear)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
               {
                  if(this.draw.player.nWarRoadEnemyHp >= Player.nWarRoadEnemyMaxHp)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.nUseUnitNum >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1 + 1])
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else if(this.draw.player.bStageClear)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               else if(this.draw.player.nUseUnitNum >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1 + 1])
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
               }
               else if(this.draw.player.bStageClear)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               break;
            case 14:
               if(this.draw.player.nGameMode == Drawing.MODE_WAGON)
               {
                  if(this.draw.player.nHp <= 0 || this.draw.UNIT[Player.WAGONPOS].nHp <= 0)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.nUnitDieNum < this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
                  {
                     if(!this.draw.player.bQuestSnd_unitDie)
                     {
                        this.draw.player.bQuestSnd_unitDie = true;
                     }
                     else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
               {
                  if(this.draw.player.nWarRoadEnemyHp >= Player.nWarRoadEnemyMaxHp)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.nUnitDieNum < this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
                  {
                     if(!this.draw.player.bQuestSnd_unitDie)
                     {
                        this.draw.player.bQuestSnd_unitDie = true;
                     }
                     else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               else if(this.draw.player.nUnitDieNum < this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1])
               {
                  if(!this.draw.player.bQuestSnd_unitDie)
                  {
                     this.draw.player.bQuestSnd_unitDie = true;
                  }
                  else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
               }
               else
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               break;
            case 15:
               if(this.draw.player.nGameMode == Drawing.MODE_WAGON)
               {
                  if(this.draw.player.nHp <= 0 || this.draw.UNIT[Player.WAGONPOS].nHp <= 0)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.nNotUseMace <= 0)
                  {
                     if(!this.draw.player.bQuestSnd_notUseMace)
                     {
                        this.draw.player.bQuestSnd_notUseMace = true;
                     }
                     else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
               {
                  if(this.draw.player.nWarRoadEnemyHp >= Player.nWarRoadEnemyMaxHp)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.nNotUseMace <= 0)
                  {
                     if(!this.draw.player.bQuestSnd_notUseMace)
                     {
                        this.draw.player.bQuestSnd_notUseMace = true;
                     }
                     else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               else if(this.draw.player.nNotUseMace <= 0)
               {
                  if(!this.draw.player.bQuestSnd_notUseMace)
                  {
                     this.draw.player.bQuestSnd_notUseMace = true;
                  }
                  else if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
               }
               else
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               break;
            case 16:
               if(this.draw.player.nGameMode == Drawing.MODE_WAGON)
               {
                  if(this.draw.player.nHp <= 0 || this.draw.UNIT[Player.WAGONPOS].nHp <= 0)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.nUseMaceNum >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1 + 1])
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else if(this.draw.player.bStageClear)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nGameMode == Drawing.MODE_WARROAD)
               {
                  if(this.draw.player.nWarRoadEnemyHp >= Player.nWarRoadEnemyMaxHp)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
                  else if(this.draw.player.nUseMaceNum >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1 + 1])
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
                  }
                  else if(this.draw.player.bStageClear)
                  {
                     if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                     {
                        this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                     }
                     this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
                  }
               }
               else if(this.draw.player.nHp <= 0)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
               else if(this.draw.player.nUseMaceNum >= this.draw.player.QUESTPROCESS[QuestDB.MAX_QUESTVALUE * param1 + 1])
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_COMPLETE)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTCOMPLETE);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_COMPLETE;
               }
               else if(this.draw.player.bStageClear)
               {
                  if(this.draw.player.QUESTCOMPLETE[param1] != Player.QUEST_FAIL)
                  {
                     this.draw.lib.playEffect(Library.SND_QUESTFAIL);
                  }
                  this.draw.player.QUESTCOMPLETE[param1] = Player.QUEST_FAIL;
               }
         }
      }
      
      public function eatQuestStar() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc2_ = 0;
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_QUEST)
         {
            if(this.draw.player.QUESTCOMPLETE[_loc1_] == Player.QUEST_COMPLETE)
            {
               _loc2_++;
            }
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function eatQuestReward() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_QUEST)
         {
            if(this.draw.player.QUESTCOMPLETE[_loc1_] == Player.QUEST_COMPLETE)
            {
               _loc4_ = this.draw.lib.strToInt(this.draw.player.QUESTREWARD[_loc1_ * Player.MAX_QUESTREWARD]);
               if(_loc4_ > 0)
               {
                  this.draw.player.nMoney += _loc4_;
               }
               _loc6_ = 0;
               _loc7_ = 0;
               _loc3_ = Number(this.draw.player.QUESTREWARD[_loc1_ * Player.MAX_QUESTREWARD + 1].charCodeAt(0));
               if(_loc3_ != 48)
               {
                  if(_loc3_ == 109)
                  {
                     _loc5_ = Drawing.MACE_GODPUNCH;
                  }
                  else
                  {
                     _loc5_ = Drawing.RING_EXP;
                  }
                  _loc2_ = 1;
                  while(_loc2_ < 3)
                  {
                     _loc3_ = Number(this.draw.player.QUESTREWARD[_loc1_ * Player.MAX_QUESTREWARD + 1].charCodeAt(_loc2_));
                     _loc6_ *= 10;
                     _loc6_ = _loc6_ + (_loc3_ - 48);
                     _loc2_++;
                  }
                  _loc2_ = 4;
                  while(_loc2_ < 6)
                  {
                     _loc3_ = Number(this.draw.player.QUESTREWARD[_loc1_ * Player.MAX_QUESTREWARD + 1].charCodeAt(_loc2_));
                     _loc7_ *= 10;
                     _loc7_ = _loc7_ + (_loc3_ - 48);
                     _loc2_++;
                  }
                  this.eatItem(_loc5_ + (_loc6_ - 1),_loc7_);
               }
            }
            _loc1_++;
         }
      }
      
      public function setLoading(param1:Boolean, param2:int) : void
      {
         this.draw.player.nPlayTime = 0;
         if(param1)
         {
            this.draw.nLoadChaImg = this.draw.lib.getRand(Drawing.LOADING_CHANUM);
            this.draw.nLoadFrame = 0;
            this.draw.nLoadingState = param2;
         }
         else
         {
            this.draw.nLoadingState = Drawing.INITDATA;
         }
      }
   }
}

