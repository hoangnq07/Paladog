package com.fazecat.web.paladog
{
   import flash.display.*;
   import flash.media.*;
   import flash.text.*;
   import flash.utils.*;
   
   public class TouchAction
   {
      
      private var draw:Drawing;
      
      public var bDownEvent:Boolean;
      
      public var bUpEvent:Boolean;
      
      public var bMoveEvent:Boolean;
      
      private var nDistance:int;
      
      public function TouchAction(param1:Drawing)
      {
         super();
         this.draw = param1;
         this.bDownEvent = false;
         this.bUpEvent = false;
         this.bMoveEvent = false;
      }
      
      public function touched(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         if(this.draw.nTouchX >= param1 && this.draw.nTouchX <= param1 + param3 && (this.draw.nTouchY >= param2 && this.draw.nTouchY <= param2 + param4))
         {
            return true;
         }
         return false;
      }
      
      public function moveTouched(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         if(this.draw.nTouchMoveX >= param1 && this.draw.nTouchMoveX <= param1 + param3 && (this.draw.nTouchMoveY >= param2 && this.draw.nTouchMoveY <= param2 + param4))
         {
            return true;
         }
         return false;
      }
      
      public function touchResult() : void
      {
         switch(this.draw.nMainState)
         {
            case Drawing.MAIN_TITLEANI:
               if(this.bDownEvent)
               {
                  this.titleAniTouch();
               }
               break;
            case Drawing.MAIN_TITLE:
               if(this.bDownEvent)
               {
                  this.titleTouch();
               }
               break;
            case Drawing.MAIN_MENU:
               if(this.bDownEvent)
               {
                  this.menuTouch();
               }
               break;
            case Drawing.MAIN_OPTION:
               if(this.bDownEvent)
               {
                  this.optionTouch();
               }
               break;
            case Drawing.MAIN_HELP:
               if(this.bDownEvent)
               {
                  this.helpTouch();
               }
               break;
            case Drawing.MAIN_INTRO:
               if(this.bDownEvent)
               {
                  this.introTouch();
               }
               break;
            case Drawing.MAIN_STAGESELECT:
               if(this.bDownEvent)
               {
                  this.stageselectDownTouch();
               }
               break;
            case Drawing.MAIN_TUTORIAL:
               if(this.bDownEvent)
               {
                  this.tutorialTouch();
               }
               break;
            case Drawing.MAIN_GAME:
               if(this.bDownEvent)
               {
                  this.gameDownTouch();
               }
               if(this.bUpEvent)
               {
                  this.gameUpTouch();
               }
               if(this.bMoveEvent)
               {
                  this.gameMoveTouch();
               }
               break;
            case Drawing.MAIN_SURVIVAL:
               if(this.bDownEvent)
               {
                  this.survivalTouch();
               }
               break;
            case Drawing.MAIN_AD:
               if(this.bDownEvent)
               {
                  this.adTouch();
               }
         }
         this.draw.nTouchX = Drawing.INITDATA;
         this.draw.nTouchY = Drawing.INITDATA;
         this.draw.nTouchMoveX = Drawing.INITDATA;
         this.draw.nTouchMoveY = Drawing.INITDATA;
         this.bDownEvent = false;
         this.bUpEvent = false;
         this.bMoveEvent = false;
      }
      
      public function adTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 0:
                  if(this.touched(627,11,124,51))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bOkBtn = true;
                  }
                  else if(this.touched(383,503,179,60))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bAppStoreBtn = true;
                  }
                  else if(this.touched(570,503,179,60))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bGooglePlayBtn = true;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function topUiDownTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nTopUiScene)
            {
               case 0:
                  if(this.touched(16,6,49,43))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bCardBtn = true;
                     this.draw.bActive = true;
                  }
            }
         }
      }
      
      public function topUiMoveTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nTopUiScene)
            {
               case 0:
                  if(this.moveTouched(16,6,49,43))
                  {
                     if(!this.draw.bCardOver)
                     {
                        this.draw.bCardOver = true;
                        this.draw.lib.playEffect(Library.SND_MOUSEOVER);
                     }
                  }
                  else
                  {
                     this.draw.bCardOver = false;
                  }
                  if(this.moveTouched(77,7,52,42))
                  {
                     if(!this.draw.bEmblemOver)
                     {
                        this.draw.bEmblemOver = true;
                        this.draw.lib.playEffect(Library.SND_MOUSEOVER);
                     }
                  }
                  else
                  {
                     this.draw.bEmblemOver = false;
                  }
                  if(this.moveTouched(137,10,52,38))
                  {
                     if(!this.draw.bAchieveOver)
                     {
                        this.draw.bAchieveOver = true;
                        this.draw.lib.playEffect(Library.SND_MOUSEOVER);
                     }
                  }
                  else
                  {
                     this.draw.bAchieveOver = false;
                  }
                  if(this.moveTouched(199,10,55,35))
                  {
                     if(!this.draw.bRankingOver)
                     {
                        this.draw.bRankingOver = true;
                        this.draw.lib.playEffect(Library.SND_MOUSEOVER);
                     }
                  }
                  else
                  {
                     this.draw.bRankingOver = false;
                  }
                  length;
            }
         }
      }
      
      public function topUiCardTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nTopUiScene)
            {
               case 0:
                  if(this.touched(692,92,57,53))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nTopUiState = Drawing.TOPUI_DRAW;
                  }
                  else if(this.touched(10,291,57,53))
                  {
                     this.draw.lib.playEffect(15);
                     if(--this.draw.player.nCardBookPage < 0)
                     {
                        this.draw.player.nCardBookPage = Player.CARDBOOK_PAGE - 1;
                     }
                  }
                  else if(this.touched(693,291,57,53))
                  {
                     this.draw.lib.playEffect(15);
                     if(++this.draw.player.nCardBookPage > Player.CARDBOOK_PAGE - 1)
                     {
                        this.draw.player.nCardBookPage = 0;
                     }
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function titleAniTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 0:
               case 1:
                  if(this.touched(0,0,this.draw.nLcdW,this.draw.nLcdH))
                  {
                     this.draw.lib.playEffect(70);
                     this.draw.nMainState = Drawing.MAIN_TITLE;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function titleTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 0:
                  if(this.draw.bOtherWindow)
                  {
                     this.draw.bOtherWindow = false;
                     this.draw.lib.nMusicVolume = this.draw.lib.nSaveMusicVolume;
                     this.draw.lib.setMusicVolume();
                  }
                  if(this.touched(13,417,202,137))
                  {
                     if(!this.draw.bPasswordLock)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.bOkBtn = true;
                        this.draw.nRinkType = 0;
                     }
                  }
                  else if(this.touched(682,483,72,72))
                  {
                     if(!this.draw.bPasswordLock)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.bOptionBtn = true;
                     }
                  }
                  else if(this.touched(612,274,140,50))
                  {
                     if(!this.draw.bPasswordLock)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.bOkBtn = true;
                        this.draw.nRinkType = 1;
                     }
                  }
                  else if(this.touched(612,333,140,50))
                  {
                     if(!this.draw.bPasswordLock)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.bOkBtn = true;
                        this.draw.nRinkType = 2;
                     }
                  }
                  else if(this.touched(616,395,60,60))
                  {
                     if(!this.draw.bPasswordLock)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.bOkBtn = true;
                        this.draw.nRinkType = 3;
                     }
                  }
                  else if(this.touched(687,390,63,68))
                  {
                     if(!this.draw.bPasswordLock)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.bOkBtn = true;
                        this.draw.nRinkType = 4;
                     }
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function menuTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 1:
                  if(this.touched(255,89,465,147))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 0;
                     this.draw.nMainScene = this.draw.nMenuPos * 10 + 10;
                  }
                  else if(this.touched(255,240,465,147))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 1;
                     this.draw.nMainScene = this.draw.nMenuPos * 10 + 10;
                  }
                  else if(this.touched(255,391,465,147))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 2;
                     this.draw.nMainScene = this.draw.nMenuPos * 10 + 10;
                  }
                  else if(this.touched(689,10,63,63))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nSubAniX = 0;
                     this.draw.nSubAniX2 = 0;
                     this.draw.nSubAniX3 = 0;
                     this.draw.nMainScene = 2;
                  }
                  break;
               case 11:
                  if(this.touched(565,Player.BG_BASEPOSY + 90,165,80))
                  {
                     this.draw.lib.playEffect(78);
                     this.draw.bOkBtn = true;
                  }
                  else if(this.touched(565,Player.BG_BASEPOSY + 173,165,68))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bNoBtn = true;
                  }
                  else if(this.touched(255,240,465,147))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 1;
                     this.draw.nMainScene = this.draw.nMenuPos * 10 + 10;
                  }
                  else if(this.touched(255,391,465,147))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 2;
                     this.draw.nMainScene = this.draw.nMenuPos * 10 + 10;
                  }
                  else if(this.touched(689,10,63,63))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nSubAniX = 0;
                     this.draw.nSubAniX2 = 0;
                     this.draw.nSubAniX3 = 0;
                     this.draw.nMainScene = 2;
                  }
                  break;
               case 21:
                  if(this.touched(255,89,465,147))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 0;
                     this.draw.nMainScene = this.draw.nMenuPos * 10 + 10;
                  }
                  else if(this.touched(565,Player.BG_BASEPOSY + 241,165,80))
                  {
                     this.draw.lib.playEffect(78);
                     this.draw.bOkBtn = true;
                  }
                  else if(this.touched(565,Player.BG_BASEPOSY + 324,165,68))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bNoBtn = true;
                  }
                  else if(this.touched(255,391,465,147))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 2;
                     this.draw.nMainScene = this.draw.nMenuPos * 10 + 10;
                  }
                  else if(this.touched(689,10,63,63))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nSubAniX = 0;
                     this.draw.nSubAniX2 = 0;
                     this.draw.nSubAniX3 = 0;
                     this.draw.nMainScene = 2;
                  }
                  break;
               case 31:
                  if(this.touched(255,89,465,147))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 0;
                     this.draw.nMainScene = this.draw.nMenuPos * 10 + 10;
                  }
                  else if(this.touched(255,240,465,147))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 1;
                     this.draw.nMainScene = this.draw.nMenuPos * 10 + 10;
                  }
                  else if(this.touched(565,Player.BG_BASEPOSY + 392,165,80))
                  {
                     this.draw.lib.playEffect(78);
                     this.draw.bOkBtn = true;
                  }
                  else if(this.touched(565,Player.BG_BASEPOSY + 475,165,68))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bNoBtn = true;
                  }
                  else if(this.touched(689,10,63,63))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nSubAniX = 0;
                     this.draw.nSubAniX2 = 0;
                     this.draw.nSubAniX3 = 0;
                     this.draw.nMainScene = 2;
                  }
                  break;
               case 50:
                  if(this.touched(565,143,63,63))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bNoBtn = true;
                  }
                  else if(this.touched(151,217,112,112))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nSubSubMenuPos = 0;
                  }
                  else if(this.touched(271,217,112,112))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nSubSubMenuPos = 1;
                  }
                  else if(this.touched(391,217,112,112))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nSubSubMenuPos = 2;
                  }
                  else if(this.touched(511,217,112,112))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.nSubSubMenuPos = 3;
                  }
                  else if(this.touched(492,353,146,64))
                  {
                     this.draw.lib.playEffect(70);
                     this.draw.bOkBtn = true;
                  }
                  break;
               case 60:
                  if(this.touched(339,353,146,64))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bOkBtn = true;
                  }
                  else if(this.touched(492,353,146,64))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bNoBtn = true;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function optionTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 1:
                  if(this.touched(689,10,63,63))
                  {
                     this.draw.lib.saveFile(Drawing.DB_OPTION,"paladog_option");
                     this.draw.lib.playEffect(15);
                     this.draw.nSubAniX = 0;
                     this.draw.nSubAniX2 = 0;
                     this.draw.nSubAniX3 = 0;
                     this.draw.nMainScene = 2;
                  }
                  else if(this.touched(494,188,44,44))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bMusicVolumeDownBtn = true;
                  }
                  else if(this.touched(668,188,44,44))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bMusicVolumeUpBtn = true;
                  }
                  else if(this.touched(689,153,27,27))
                  {
                     this.draw.lib.playEffect(15);
                     if(this.draw.lib.nMusicVolume > Library.SND_OFF)
                     {
                        this.draw.lib.nSaveMusicVolume = this.draw.lib.nMusicVolume;
                        this.draw.lib.nMusicVolume = Library.SND_OFF;
                        this.draw.lib.setMusicVolume();
                     }
                     else
                     {
                        this.draw.lib.nMusicVolume = this.draw.lib.nSaveMusicVolume;
                        this.draw.lib.setMusicVolume();
                     }
                     this.draw.lib.saveFile(Drawing.DB_OPTION,"paladog_option");
                  }
                  else if(this.touched(494,293,44,44))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bEffectVolumeDownBtn = true;
                  }
                  else if(this.touched(668,293,44,44))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bEffectVolumeUpBtn = true;
                  }
                  else if(this.touched(689,258,27,27))
                  {
                     this.draw.lib.playEffect(15);
                     if(this.draw.lib.nEffectVolume > Library.SND_OFF)
                     {
                        this.draw.lib.nSaveEffectVolume = this.draw.lib.nEffectVolume;
                        this.draw.lib.nEffectVolume = Library.SND_OFF;
                     }
                     else
                     {
                        this.draw.lib.nEffectVolume = this.draw.lib.nSaveEffectVolume;
                     }
                     this.draw.lib.saveFile(Drawing.DB_OPTION,"paladog_option");
                  }
                  else if(this.touched(551,380,103,136))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bOkBtn = true;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function helpTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 0:
                  if(this.touched(689,10,63,63))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bNoBtn = true;
                  }
                  else if(this.touched(491,155,226,62))
                  {
                     this.draw.nHelpPos = 0;
                     this.draw.lib.playEffect(71);
                     this.draw.bOkBtn = true;
                  }
                  else if(this.touched(491,228,226,62))
                  {
                     this.draw.nHelpPos = 1;
                     this.draw.lib.playEffect(71);
                     this.draw.bOkBtn = true;
                  }
                  else if(this.touched(491,301,226,62))
                  {
                     this.draw.nHelpPos = 2;
                     this.draw.lib.playEffect(71);
                     this.draw.bOkBtn = true;
                  }
                  else if(this.touched(491,374,226,62))
                  {
                     this.draw.nHelpPos = 3;
                     this.draw.lib.playEffect(71);
                     this.draw.bOkBtn = true;
                  }
                  else if(this.touched(491,447,226,62))
                  {
                     this.draw.nHelpPos = 4;
                     this.draw.lib.playEffect(71);
                     this.draw.bOkBtn = true;
                  }
                  break;
               case 103:
               case 104:
               case 105:
               case 500:
               case 501:
               case 502:
                  if(this.touched(620,470,140,100))
                  {
                     this.draw.lib.playEffect(71);
                     this.draw.bOkBtn = true;
                  }
                  break;
               case 100:
               case 101:
               case 102:
               case 200:
               case 201:
               case 202:
               case 203:
               case 300:
               case 301:
               case 400:
               case 401:
               case 402:
               case 403:
               case 404:
               case 405:
                  if(this.touched(620,0,140,100))
                  {
                     this.draw.lib.playEffect(71);
                     this.draw.bOkBtn = true;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function introTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 14:
               case 15:
               case 16:
               case 17:
               case 18:
               case 19:
               case 20:
               case 21:
               case 22:
               case 23:
               case 26:
                  if(this.touched(0,0,this.draw.nLcdW,this.draw.nLcdH))
                  {
                     this.draw.bOkBtn = true;
                  }
                  break;
               case 24:
               case 25:
                  if(this.touched(0,0,this.draw.nLcdW,this.draw.nLcdH))
                  {
                     this.draw.bOkBtn = true;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function survivalTouch() : void
      {
         var _loc1_:int = 0;
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 0:
                  if(this.touched(680,90,50,50))
                  {
                     this.draw.lib.playEffect(78);
                     this.draw.nMainState = Drawing.MAIN_TITLE;
                  }
                  else if(this.touched(60,485,200,100))
                  {
                     this.draw.lib.playEffect(78);
                     this.draw.ope.initGame();
                     this.draw.player.nGameMode = Drawing.MODE_SURVIVAL;
                     if(this.draw.player.nGameMode == Drawing.MODE_SURVIVAL)
                     {
                        this.draw.player.nNowArms = this.draw.player.EQUIPINVEN[0] = Drawing.MACE_METEO;
                        this.draw.player.EQUIPINVEN[0 + Player.EQUIPINVEN_LEVELPOS] = 30;
                     }
                     this.draw.player.SAVEEQUIPINVEN[0] = this.draw.player.EQUIPINVEN[0];
                     this.draw.player.SAVEEQUIPINVEN[0 + Player.EQUIPINVEN_LEVELPOS] = this.draw.player.EQUIPINVEN[0 + Player.EQUIPINVEN_LEVELPOS];
                     _loc1_ = 0;
                     while(_loc1_ < Drawing.MAX_UNITKIND)
                     {
                        this.draw.player.UNITOPEN[_loc1_] = false;
                        this.draw.player.UNITEQUIP[_loc1_] = false;
                        this.draw.player.UNITUPGRADE[_loc1_] = 0;
                        _loc1_++;
                     }
                     this.draw.player.UNITOPEN[0] = true;
                     this.draw.player.UNITOPEN[1] = true;
                     this.draw.player.UNITEQUIP[0] = true;
                     this.draw.player.UNITUPGRADE[0] = 1;
                     this.draw.nMainState = Drawing.MAIN_STAGESELECT;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function stageselectMoveTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 100:
               case 300:
               case 400:
            }
         }
      }
      
      public function stageselectUpTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 300:
               case 400:
                  if(this.touched(50,482,658,88))
                  {
                     this.draw.player.nInvenMovePosX = Drawing.INITDATA;
                     this.draw.player.bInvenMouseMove = false;
                     this.draw.nInvenItemSelectPos = int((this.draw.nTouchX - 46 - this.draw.player.nInvenPosX) / 74);
                     if(this.draw.player.INVENDATA[this.draw.nInvenItemSelectPos] > Drawing.INITDATA)
                     {
                        this.draw.bInvenItemSelect = true;
                        this.draw.nPigDialogFrame = 0;
                        this.draw.nPigDialogStep = 1;
                     }
                     else
                     {
                        this.draw.nInvenItemSelectPos = Drawing.INITDATA;
                     }
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function stageselectDownTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 100:
                  if(this.touched(679,21,63,63))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bNoBtn = true;
                  }
                  else if(this.touched(9,494,235,66))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bUpgradeBtn = true;
                  }
                  else if(this.touched(685,240,70,117))
                  {
                     if(this.draw.player.nChapter < 4)
                     {
                        this.draw.lib.playEffect(15);
                        this.draw.bNextChapterBtn = true;
                        this.draw.nStageBackgroundMoveX = 0;
                        ++this.draw.nMainScene;
                     }
                  }
                  else if(this.touched(5,240,67,117))
                  {
                     if(this.draw.player.nChapter > 0)
                     {
                        this.draw.lib.playEffect(15);
                        this.draw.bBeforeChapterBtn = true;
                        this.draw.nStageBackgroundMoveX = 0;
                        ++this.draw.nMainScene;
                     }
                  }
                  else if(this.touched(72,138,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 0)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 1;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(175,138,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 1)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 2;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(278,138,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 2)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 3;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(381,138,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 3)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 4;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(484,138,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 4)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 5;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(587,138,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 5)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 6;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(72,221,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 6)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 7;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(175,221,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 7)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 8;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(278,221,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 8)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 9;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(381,221,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 9)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 10;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(484,221,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 10)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 11;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(587,221,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 11)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 12;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(72,303,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 12)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 13;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(175,303,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 13)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 14;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(278,303,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 14)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 15;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(381,303,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 15)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 16;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(484,303,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 16)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 17;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(587,303,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 17)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 18;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(72,385,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 18)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 19;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(175,385,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 19)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 20;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(278,385,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 20)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 21;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(381,385,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 21)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 22;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(484,385,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 22)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 23;
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(587,385,97,76))
                  {
                     if(this.draw.player.nClearChapter >= this.draw.player.nChapter && this.draw.player.nClearStage - this.draw.player.nChapter * Player.MAX_STAGE >= 23)
                     {
                        this.draw.lib.playEffect(78);
                        this.draw.player.nTouchStage = 24;
                        this.draw.bOkBtn = true;
                     }
                  }
                  break;
               case 200:
                  if(this.touched(607,7,147,52))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bStoreBtn = true;
                  }
                  else if(this.touched(11,125,81,81))
                  {
                     this.draw.bUnitUpgradeAct = false;
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 0;
                  }
                  else if(this.touched(100,125,81,81))
                  {
                     this.draw.bUnitUpgradeAct = false;
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 1;
                  }
                  else if(this.touched(189,125,81,81))
                  {
                     this.draw.bUnitUpgradeAct = false;
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 2;
                  }
                  else if(this.touched(11,239,81,81))
                  {
                     this.draw.bUnitUpgradeAct = false;
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 3;
                  }
                  else if(this.touched(100,239,81,81))
                  {
                     this.draw.bUnitUpgradeAct = false;
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 4;
                  }
                  else if(this.touched(189,239,81,81))
                  {
                     this.draw.bUnitUpgradeAct = false;
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 5;
                  }
                  else if(this.touched(11,354,81,81))
                  {
                     this.draw.bUnitUpgradeAct = false;
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 6;
                  }
                  else if(this.touched(100,354,81,81))
                  {
                     this.draw.bUnitUpgradeAct = false;
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 7;
                  }
                  else if(this.touched(189,354,81,81))
                  {
                     this.draw.bUnitUpgradeAct = false;
                     this.draw.lib.playEffect(15);
                     this.draw.nMenuPos = 8;
                  }
                  else if(this.touched(311,275,204,65))
                  {
                     if(this.draw.player.UNITOPEN[this.draw.nMenuPos])
                     {
                        if(this.draw.player.UNITUPGRADE[this.draw.nMenuPos] < Drawing.MAX_UNITLEVEL)
                        {
                           if(this.draw.player.nMoney >= this.draw.player.UNITUPGRADEMONEY[this.draw.nMenuPos * 20 + this.draw.player.UNITUPGRADE[this.draw.nMenuPos]])
                           {
                              if(!this.draw.bUpgradeBtn)
                              {
                                 this.draw.bUnitUpgradeAct = true;
                                 this.draw.nUnitUpgradeActFrame = 0;
                                 this.draw.nUnitUpgradeFrame = 0;
                                 this.draw.lib.playEffect(15);
                                 this.draw.bUpgradeBtn = true;
                              }
                           }
                        }
                     }
                  }
                  break;
               case 300:
                  if(this.touched(5,7,147,52))
                  {
                     this.draw.bStoreItemSelect = false;
                     this.draw.bInvenItemSelect = false;
                     this.draw.lib.playEffect(15);
                     this.draw.bUnitBtn = true;
                  }
                  else if(this.touched(607,7,147,52))
                  {
                     this.draw.bStoreItemSelect = false;
                     this.draw.bInvenItemSelect = false;
                     this.draw.lib.playEffect(15);
                     this.draw.bEquipBtn = true;
                  }
                  else if(this.touched(18,309,56,56))
                  {
                     if(!this.draw.bDrawSortingList)
                     {
                        if(this.draw.player.STOREDATA[0] > Drawing.INITDATA)
                        {
                           this.draw.bDrawSortingList = false;
                           this.draw.lib.playEffect(15);
                           this.draw.nStoreItemSelectPos = 0;
                           this.draw.bStoreItemSelect = true;
                           this.draw.nPigDialogStep = 0;
                           this.draw.bInvenItemSelect = false;
                        }
                     }
                  }
                  else if(this.touched(92,309,56,56))
                  {
                     if(!this.draw.bDrawSortingList)
                     {
                        if(this.draw.player.STOREDATA[1] > Drawing.INITDATA)
                        {
                           this.draw.bDrawSortingList = false;
                           this.draw.lib.playEffect(15);
                           this.draw.nStoreItemSelectPos = 1;
                           this.draw.bStoreItemSelect = true;
                           this.draw.nPigDialogStep = 0;
                           this.draw.bInvenItemSelect = false;
                        }
                     }
                  }
                  else if(this.touched(166,309,56,56))
                  {
                     if(this.draw.player.STOREDATA[2] > Drawing.INITDATA)
                     {
                        this.draw.bDrawSortingList = false;
                        this.draw.lib.playEffect(15);
                        this.draw.nStoreItemSelectPos = 2;
                        this.draw.bStoreItemSelect = true;
                        this.draw.nPigDialogStep = 0;
                        this.draw.bInvenItemSelect = false;
                     }
                  }
                  else if(this.touched(240,309,56,56))
                  {
                     if(this.draw.player.STOREDATA[3] > Drawing.INITDATA)
                     {
                        this.draw.bDrawSortingList = false;
                        this.draw.lib.playEffect(15);
                        this.draw.nStoreItemSelectPos = 3;
                        this.draw.bStoreItemSelect = true;
                        this.draw.nPigDialogStep = 0;
                        this.draw.bInvenItemSelect = false;
                     }
                  }
                  else if(this.touched(314,309,56,56))
                  {
                     if(this.draw.player.STOREDATA[4] > Drawing.INITDATA)
                     {
                        this.draw.bDrawSortingList = false;
                        this.draw.lib.playEffect(15);
                        this.draw.nStoreItemSelectPos = 4;
                        this.draw.bStoreItemSelect = true;
                        this.draw.nPigDialogStep = 0;
                        this.draw.bInvenItemSelect = false;
                     }
                  }
                  else if(this.touched(388,309,56,56))
                  {
                     if(this.draw.player.STOREDATA[5] > Drawing.INITDATA)
                     {
                        this.draw.bDrawSortingList = false;
                        this.draw.lib.playEffect(15);
                        this.draw.nStoreItemSelectPos = 5;
                        this.draw.bStoreItemSelect = true;
                        this.draw.nPigDialogStep = 0;
                        this.draw.bInvenItemSelect = false;
                     }
                  }
                  else if(this.touched(462,309,56,56))
                  {
                     if(this.draw.player.STOREDATA[6] > Drawing.INITDATA)
                     {
                        this.draw.bDrawSortingList = false;
                        this.draw.lib.playEffect(15);
                        this.draw.nStoreItemSelectPos = 6;
                        this.draw.bStoreItemSelect = true;
                        this.draw.nPigDialogStep = 0;
                        this.draw.bInvenItemSelect = false;
                     }
                  }
                  else if(this.touched(536,309,56,56))
                  {
                     if(this.draw.player.STOREDATA[7] > Drawing.INITDATA)
                     {
                        this.draw.bDrawSortingList = false;
                        this.draw.lib.playEffect(15);
                        this.draw.nStoreItemSelectPos = 7;
                        this.draw.bStoreItemSelect = true;
                        this.draw.nPigDialogStep = 0;
                        this.draw.bInvenItemSelect = false;
                     }
                  }
                  else if(this.touched(610,309,56,56))
                  {
                     if(this.draw.player.STOREDATA[8] > Drawing.INITDATA)
                     {
                        this.draw.bDrawSortingList = false;
                        this.draw.lib.playEffect(15);
                        this.draw.nStoreItemSelectPos = 8;
                        this.draw.bStoreItemSelect = true;
                        this.draw.nPigDialogStep = 0;
                        this.draw.bInvenItemSelect = false;
                     }
                  }
                  else if(this.touched(684,309,56,56))
                  {
                     if(this.draw.player.STOREDATA[9] > Drawing.INITDATA)
                     {
                        this.draw.bDrawSortingList = false;
                        this.draw.lib.playEffect(15);
                        this.draw.nStoreItemSelectPos = 9;
                        this.draw.bStoreItemSelect = true;
                        this.draw.nPigDialogStep = 0;
                        this.draw.bInvenItemSelect = false;
                     }
                  }
                  else if(this.touched(581,231,130,58))
                  {
                     if(this.draw.bStoreItemSelect || this.draw.bInvenItemSelect)
                     {
                        this.draw.bDrawSortingList = false;
                        this.draw.lib.playEffect(16);
                        this.draw.bBuySellBtn = true;
                        this.draw.nPigDialogStep = 0;
                     }
                  }
                  else if(this.touched(2,490,43,73))
                  {
                     this.draw.bDrawSortingList = false;
                     this.draw.lib.playEffect(15);
                     this.draw.bStoreItemSelect = false;
                     this.draw.bInvenItemSelect = false;
                     this.draw.player.bInvenLeftArrowBtn = true;
                     this.draw.nPigDialogStep = 0;
                  }
                  else if(this.touched(715,490,43,73))
                  {
                     this.draw.bDrawSortingList = false;
                     this.draw.lib.playEffect(15);
                     this.draw.bStoreItemSelect = false;
                     this.draw.bInvenItemSelect = false;
                     this.draw.player.bInvenRightArrowBtn = true;
                     this.draw.nPigDialogStep = 0;
                  }
                  else if(this.touched(50,482,658,88))
                  {
                     this.draw.bDrawSortingList = false;
                     this.draw.bStoreItemSelect = false;
                     this.draw.bInvenItemSelect = false;
                     this.draw.nPigDialogStep = 0;
                     this.draw.player.nInvenMovePosX = Drawing.INITDATA;
                     this.draw.player.bInvenMouseMove = false;
                     this.draw.nInvenItemSelectPos = int((this.draw.nTouchX - 46 - this.draw.player.nInvenPosX) / 74);
                     if(this.draw.player.INVENDATA[this.draw.nInvenItemSelectPos] > Drawing.INITDATA)
                     {
                        this.draw.bInvenItemSelect = true;
                        this.draw.nPigDialogFrame = 0;
                        this.draw.nPigDialogStep = 1;
                     }
                     else
                     {
                        this.draw.nInvenItemSelectPos = Drawing.INITDATA;
                     }
                  }
                  else if(this.touched(62,415,59,58))
                  {
                     this.draw.bStoreItemSelect = false;
                     this.draw.bInvenItemSelect = false;
                     this.draw.lib.playEffect(15);
                     this.draw.bSortingBtn = true;
                     this.draw.nPigDialogStep = 0;
                  }
                  if(this.draw.bDrawSortingList)
                  {
                     if(this.touched(65,303,52,49))
                     {
                        this.draw.bStoreItemSelect = false;
                        this.draw.bInvenItemSelect = false;
                        this.draw.lib.playEffect(15);
                        this.draw.bRingSortingBtn = true;
                        this.draw.nPigDialogStep = 0;
                     }
                     else if(this.touched(65,357,52,49))
                     {
                        this.draw.bStoreItemSelect = false;
                        this.draw.bInvenItemSelect = false;
                        this.draw.lib.playEffect(15);
                        this.draw.bMaceSortingBtn = true;
                        this.draw.nPigDialogStep = 0;
                     }
                     else
                     {
                        this.draw.bDrawSortingList = false;
                     }
                  }
                  break;
               case 400:
                  if(this.touched(5,7,147,52))
                  {
                     this.draw.bEquipItemSelect = false;
                     this.draw.bInvenItemSelect = false;
                     this.draw.lib.playEffect(15);
                     this.draw.bStoreBtn = true;
                  }
                  else if(this.touched(607,7,147,52))
                  {
                     this.draw.bEquipItemSelect = false;
                     this.draw.bInvenItemSelect = false;
                     this.draw.lib.playEffect(15);
                     this.draw.bStageSelectBtn = true;
                  }
                  else if(this.touched(43,154,68,68))
                  {
                     this.draw.bDrawSortingList = false;
                     if(this.draw.bInvenItemSelect)
                     {
                        if(this.draw.player.INVENDATA[this.draw.nInvenItemSelectPos] > Drawing.INITDATA)
                        {
                           if(this.draw.player.INVENDATA[this.draw.nInvenItemSelectPos] < Drawing.RING_EXP)
                           {
                              this.draw.lib.playEffect(15);
                              this.draw.ope.equipItem(this.draw.nInvenItemSelectPos,0);
                              this.draw.ope.setArms(false,0);
                              this.draw.bMaceEquipAct = true;
                              this.draw.nMaceEquipActFrame = 0;
                              this.draw.ope.equipMaceSnd(0);
                              this.draw.lib.saveFile(Drawing.DB_SLOT,"paladog_slot" + this.draw.nGameSlot);
                              this.draw.lib.saveFile(Drawing.DB_GAME,"paladog_game" + this.draw.nGameSlot);
                              this.draw.nLarvaDialogStep = 0;
                              this.draw.nLarvaDialogFrame = 0;
                           }
                        }
                        this.draw.bEquipItemSelect = false;
                        this.draw.bInvenItemSelect = false;
                     }
                     else
                     {
                        if(this.draw.player.EQUIPINVEN[0] > Drawing.INITDATA)
                        {
                           this.draw.lib.playEffect(15);
                           this.draw.bEquipItemSelect = true;
                           this.draw.nEquipItemSelectPos = 0;
                           this.draw.nLarvaDialogStep = 0;
                           this.draw.nLarvaDialogFrame = 0;
                        }
                        this.draw.bInvenItemSelect = false;
                     }
                  }
                  else if(this.touched(43,228,68,68))
                  {
                     this.draw.bDrawSortingList = false;
                     if(this.draw.bInvenItemSelect)
                     {
                        if(this.draw.player.INVENDATA[this.draw.nInvenItemSelectPos] > Drawing.INITDATA)
                        {
                           if(this.draw.player.INVENDATA[this.draw.nInvenItemSelectPos] < Drawing.RING_EXP)
                           {
                              this.draw.lib.playEffect(15);
                              this.draw.ope.equipItem(this.draw.nInvenItemSelectPos,1);
                              this.draw.ope.setArms(false,1);
                              this.draw.bMaceEquipAct = true;
                              this.draw.nMaceEquipActFrame = 0;
                              this.draw.ope.equipMaceSnd(0);
                              this.draw.lib.saveFile(Drawing.DB_SLOT,"paladog_slot" + this.draw.nGameSlot);
                              this.draw.lib.saveFile(Drawing.DB_GAME,"paladog_game" + this.draw.nGameSlot);
                              this.draw.nLarvaDialogStep = 0;
                              this.draw.nLarvaDialogFrame = 0;
                           }
                        }
                        this.draw.bEquipItemSelect = false;
                        this.draw.bInvenItemSelect = false;
                     }
                     else
                     {
                        if(this.draw.player.EQUIPINVEN[1] > Drawing.INITDATA)
                        {
                           this.draw.lib.playEffect(15);
                           this.draw.bEquipItemSelect = true;
                           this.draw.nEquipItemSelectPos = 1;
                           this.draw.nLarvaDialogStep = 0;
                           this.draw.nLarvaDialogFrame = 0;
                        }
                        this.draw.bInvenItemSelect = false;
                     }
                  }
                  else if(this.touched(43,302,68,68))
                  {
                     if(!this.draw.bDrawSortingList)
                     {
                        if(this.draw.bInvenItemSelect)
                        {
                           if(this.draw.player.INVENDATA[this.draw.nInvenItemSelectPos] > Drawing.INITDATA)
                           {
                              if(this.draw.player.INVENDATA[this.draw.nInvenItemSelectPos] < Drawing.RING_EXP)
                              {
                                 this.draw.lib.playEffect(15);
                                 this.draw.ope.equipItem(this.draw.nInvenItemSelectPos,2);
                                 this.draw.ope.setArms(false,2);
                                 this.draw.bMaceEquipAct = true;
                                 this.draw.nMaceEquipActFrame = 0;
                                 this.draw.ope.equipMaceSnd(0);
                                 this.draw.lib.saveFile(Drawing.DB_SLOT,"paladog_slot" + this.draw.nGameSlot);
                                 this.draw.lib.saveFile(Drawing.DB_GAME,"paladog_game" + this.draw.nGameSlot);
                                 this.draw.nLarvaDialogStep = 0;
                                 this.draw.nLarvaDialogFrame = 0;
                              }
                           }
                           this.draw.bEquipItemSelect = false;
                           this.draw.bInvenItemSelect = false;
                        }
                        else
                        {
                           if(this.draw.player.EQUIPINVEN[2] > Drawing.INITDATA)
                           {
                              this.draw.lib.playEffect(15);
                              this.draw.bEquipItemSelect = true;
                              this.draw.nEquipItemSelectPos = 2;
                              this.draw.nLarvaDialogStep = 0;
                              this.draw.nLarvaDialogFrame = 0;
                           }
                           this.draw.bInvenItemSelect = false;
                        }
                     }
                  }
                  else if(this.touched(333,154,68,68))
                  {
                     this.draw.bDrawSortingList = false;
                     if(this.draw.bInvenItemSelect)
                     {
                        if(this.draw.player.INVENDATA[this.draw.nInvenItemSelectPos] > Drawing.INITDATA)
                        {
                           if(this.draw.player.INVENDATA[this.draw.nInvenItemSelectPos] >= Drawing.RING_EXP)
                           {
                              this.draw.lib.playEffect(15);
                              this.draw.ope.equipItem(this.draw.nInvenItemSelectPos,3);
                              this.draw.lib.saveFile(Drawing.DB_SLOT,"paladog_slot" + this.draw.nGameSlot);
                              this.draw.lib.saveFile(Drawing.DB_GAME,"paladog_game" + this.draw.nGameSlot);
                              this.draw.nLarvaDialogStep = 0;
                              this.draw.nLarvaDialogFrame = 0;
                           }
                        }
                        this.draw.bEquipItemSelect = false;
                        this.draw.bInvenItemSelect = false;
                     }
                     else
                     {
                        if(this.draw.player.EQUIPINVEN[3] > Drawing.INITDATA)
                        {
                           this.draw.lib.playEffect(15);
                           this.draw.bEquipItemSelect = true;
                           this.draw.nEquipItemSelectPos = 3;
                           this.draw.nLarvaDialogStep = 0;
                           this.draw.nLarvaDialogFrame = 0;
                        }
                        this.draw.bInvenItemSelect = false;
                     }
                  }
                  else if(this.touched(333,228,68,68))
                  {
                     this.draw.bDrawSortingList = false;
                     if(this.draw.bInvenItemSelect)
                     {
                        if(this.draw.player.INVENDATA[this.draw.nInvenItemSelectPos] > Drawing.INITDATA)
                        {
                           if(this.draw.player.INVENDATA[this.draw.nInvenItemSelectPos] >= Drawing.RING_EXP)
                           {
                              this.draw.lib.playEffect(15);
                              this.draw.ope.equipItem(this.draw.nInvenItemSelectPos,4);
                              this.draw.lib.saveFile(Drawing.DB_SLOT,"paladog_slot" + this.draw.nGameSlot);
                              this.draw.lib.saveFile(Drawing.DB_GAME,"paladog_game" + this.draw.nGameSlot);
                              this.draw.nLarvaDialogStep = 0;
                              this.draw.nLarvaDialogFrame = 0;
                           }
                        }
                        this.draw.bEquipItemSelect = false;
                        this.draw.bInvenItemSelect = false;
                     }
                     else
                     {
                        if(this.draw.player.EQUIPINVEN[4] > Drawing.INITDATA)
                        {
                           this.draw.lib.playEffect(15);
                           this.draw.bEquipItemSelect = true;
                           this.draw.nEquipItemSelectPos = 4;
                           this.draw.nLarvaDialogStep = 0;
                           this.draw.nLarvaDialogFrame = 0;
                        }
                        this.draw.bInvenItemSelect = false;
                     }
                  }
                  else if(this.touched(2,490,43,73))
                  {
                     this.draw.bDrawSortingList = false;
                     this.draw.lib.playEffect(15);
                     this.draw.bEquipItemSelect = false;
                     this.draw.bInvenItemSelect = false;
                     this.draw.player.bInvenLeftArrowBtn = true;
                     this.draw.nLarvaDialogStep = 0;
                     this.draw.nLarvaDialogFrame = 0;
                  }
                  else if(this.touched(715,490,43,73))
                  {
                     this.draw.bDrawSortingList = false;
                     this.draw.lib.playEffect(15);
                     this.draw.bEquipItemSelect = false;
                     this.draw.bInvenItemSelect = false;
                     this.draw.player.bInvenRightArrowBtn = true;
                     this.draw.nLarvaDialogStep = 0;
                     this.draw.nLarvaDialogFrame = 0;
                  }
                  else if(this.touched(50,482,658,88))
                  {
                     this.draw.bEquipItemSelect = false;
                     this.draw.bInvenItemSelect = false;
                     this.draw.nLarvaDialogStep = 0;
                     this.draw.nLarvaDialogFrame = 0;
                     this.draw.player.nInvenMovePosX = Drawing.INITDATA;
                     this.draw.player.bInvenMouseMove = false;
                     this.draw.nInvenItemSelectPos = int((this.draw.nTouchX - 46 - this.draw.player.nInvenPosX) / 74);
                     if(this.draw.player.INVENDATA[this.draw.nInvenItemSelectPos] > Drawing.INITDATA)
                     {
                        this.draw.bInvenItemSelect = true;
                        this.draw.nPigDialogFrame = 0;
                        this.draw.nPigDialogStep = 1;
                     }
                     else
                     {
                        this.draw.nInvenItemSelectPos = Drawing.INITDATA;
                     }
                  }
                  else if(this.touched(439,327,149,58))
                  {
                     this.draw.bInvenItemSelect = false;
                     this.draw.bDrawSortingList = false;
                     this.draw.lib.playEffect(96);
                     this.draw.bItemUnEquipBtn = true;
                     this.draw.nLarvaDialogStep = 0;
                     this.draw.nLarvaDialogFrame = 0;
                  }
                  else if(this.touched(62,415,59,58))
                  {
                     this.draw.bEquipItemSelect = false;
                     this.draw.bInvenItemSelect = false;
                     this.draw.lib.playEffect(15);
                     this.draw.bSortingBtn = true;
                     this.draw.nLarvaDialogStep = 0;
                     this.draw.nLarvaDialogFrame = 0;
                  }
                  if(this.draw.bDrawSortingList)
                  {
                     if(this.touched(65,303,52,49))
                     {
                        this.draw.bEquipItemSelect = false;
                        this.draw.bInvenItemSelect = false;
                        this.draw.lib.playEffect(15);
                        this.draw.bRingSortingBtn = true;
                        this.draw.nLarvaDialogStep = 0;
                        this.draw.nLarvaDialogFrame = 0;
                     }
                     else if(this.touched(65,357,52,49))
                     {
                        this.draw.bEquipItemSelect = false;
                        this.draw.bInvenItemSelect = false;
                        this.draw.lib.playEffect(15);
                        this.draw.bMaceSortingBtn = true;
                        this.draw.nLarvaDialogStep = 0;
                        this.draw.nLarvaDialogFrame = 0;
                     }
                     else
                     {
                        this.draw.bDrawSortingList = false;
                     }
                  }
                  break;
               case 1000:
               case 1001:
               case 1002:
                  if(this.touched(620,470,140,100))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bOkBtn = true;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function tutorialTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 10:
               case 11:
               case 12:
                  if(this.touched(620,0,140,100))
                  {
                     this.draw.lib.playEffect(71);
                     this.draw.bOkBtn = true;
                  }
                  break;
               case 13:
               case 14:
               case 15:
               case 16:
                  if(this.draw.player.nStage == 2 || this.draw.player.nStage == 8)
                  {
                     if(this.touched(620,0,140,100))
                     {
                        this.draw.lib.playEffect(71);
                        this.draw.bOkBtn = true;
                     }
                  }
                  else if(this.touched(620,470,140,100))
                  {
                     this.draw.lib.playEffect(71);
                     this.draw.bOkBtn = true;
                  }
                  break;
               case 1000:
                  switch(this.draw.nEventScene)
                  {
                     case 1:
                     case 3:
                        if(this.touched(604,511,140,44))
                        {
                           if(!this.draw.bEventNextBtn)
                           {
                              this.draw.lib.playEffect(15);
                              this.draw.bEventNextBtn = true;
                              this.draw.nEventSoundCount = 0;
                           }
                        }
                  }
                  if(this.touched(17,511,140,44))
                  {
                     if(!this.draw.bEventSkipBtn)
                     {
                        if(!this.draw.bEventSkipBtn)
                        {
                           this.draw.lib.playEffect(15);
                           this.draw.bEventSkipBtn = true;
                           this.draw.nEventSoundCount = 0;
                        }
                     }
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gameDownTouch() : void
      {
         switch(this.draw.nGameState)
         {
            case Drawing.GAME_PLAY:
               switch(this.draw.player.nGameMode)
               {
                  case Drawing.MODE_NORMAL:
                  case Drawing.MODE_WAGON:
                  case Drawing.MODE_BOSS:
                  case Drawing.MODE_SURVIVAL:
                     if(!this.draw.bBossDiaEvent && !this.draw.bBossDialog && !this.draw.player.bStageClear)
                     {
                        this.gameplayDownTouchNormal();
                     }
                     else if(!this.draw.bBossDiaEvent && this.draw.bBossDialog)
                     {
                        this.gameplayDownTouchNormalBossDialog();
                     }
                     break;
                  case Drawing.MODE_DESTINY:
                     if(!this.draw.player.bStageClear)
                     {
                        this.gameplayDownTouchDestiny();
                     }
                     break;
                  case Drawing.MODE_WARROAD:
                     if(!this.draw.player.bStageClear)
                     {
                        this.gameplayDownTouchWarRoad();
                     }
               }
               break;
            case Drawing.GAME_MENU:
               this.gamemenuDownTouch();
               break;
            case Drawing.GAME_LEVELUP:
               this.gameLevelUpDownTouch();
               break;
            case Drawing.GAME_CLEAR:
               this.gameClearDownTouch();
               break;
            case Drawing.GAME_CINEMA:
               this.gameCinemaDownTouch();
               break;
            case Drawing.GAME_OVER:
               this.gameOverDownTouch();
         }
      }
      
      public function gameUpTouch() : void
      {
         switch(this.draw.nGameState)
         {
            case Drawing.GAME_PLAY:
               switch(this.draw.player.nGameMode)
               {
                  case Drawing.MODE_NORMAL:
                  case Drawing.MODE_WAGON:
                  case Drawing.MODE_BOSS:
                  case Drawing.MODE_SURVIVAL:
                     if(!this.draw.bBossDiaEvent && !this.draw.bBossDialog)
                     {
                        this.gameplayUpTouchNormal();
                     }
               }
         }
      }
      
      public function gameMoveTouch() : void
      {
         switch(this.draw.nGameState)
         {
            case Drawing.GAME_PLAY:
               switch(this.draw.player.nGameMode)
               {
                  case Drawing.MODE_NORMAL:
                  case Drawing.MODE_WAGON:
                  case Drawing.MODE_BOSS:
                  case Drawing.MODE_SURVIVAL:
                     if(!this.draw.bBossDiaEvent && !this.draw.bBossDialog)
                     {
                        this.gameplayMoveTouch();
                     }
               }
         }
      }
      
      public function gameplayUpTouchNormal() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 1:
                  if(this.touched(67,484,109,67) || this.touched(214,484,109,67))
                  {
                     if(!this.draw.bKeyMove)
                     {
                        this.draw.player.bMoveLeft = false;
                        this.draw.player.bBgLeft = false;
                        this.draw.player.bMoveRight = false;
                        this.draw.player.bBgRight = false;
                        this.draw.player.nMoveDirection = Drawing.INITDATA;
                        this.draw.bMoveLeftDrag = false;
                        this.draw.bMoveRightDrag = false;
                     }
                  }
                  else if(this.touched(1,Player.BG_BASEPOSY,this.draw.nLcdW - 2,360))
                  {
                     this.draw.player.nMoveBgPosX = Drawing.INITDATA;
                     this.draw.bScreenDrag = false;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gameplayDownTouchNormal() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 1:
                  if(this.touched(698,0,62,56))
                  {
                     this.draw.lib.stopMusic();
                     this.draw.lib.playEffect(15);
                     this.draw.bPauseBtn = true;
                  }
                  else if(this.touched(67,484,109,67))
                  {
                     if(!this.draw.bKeyMove)
                     {
                        if(!this.draw.player.bAttack)
                        {
                           this.draw.player.nMoveDirection = Drawing.INITDATA;
                           this.draw.player.bMoveRight = false;
                           this.draw.player.bBgRight = false;
                           this.draw.player.bMoveLeft = true;
                           this.draw.ope.resetMouseDrag();
                        }
                        else
                        {
                           this.draw.player.bMoveRight = false;
                           this.draw.player.bBgRight = false;
                           this.draw.player.bMoveLeft = false;
                           this.draw.player.bBgLeft = false;
                           this.draw.player.nMoveDirection = Drawing.MOVE_LEFT;
                        }
                        this.draw.bMoveLeftDrag = true;
                        this.draw.bKeyPressed = true;
                        this.draw.nKeyPressTime = getTimer();
                     }
                  }
                  else if(this.touched(214,484,109,67))
                  {
                     if(!this.draw.bKeyMove)
                     {
                        if(!this.draw.player.bAttack)
                        {
                           this.draw.player.nMoveDirection = Drawing.INITDATA;
                           this.draw.player.bMoveLeft = false;
                           this.draw.player.bBgLeft = false;
                           this.draw.player.bMoveRight = true;
                           this.draw.ope.resetMouseDrag();
                        }
                        else
                        {
                           this.draw.player.bMoveLeft = false;
                           this.draw.player.bBgLeft = false;
                           this.draw.player.bMoveRight = false;
                           this.draw.player.bBgRight = false;
                           this.draw.player.nMoveDirection = Drawing.MOVE_RIGHT;
                        }
                        this.draw.bMoveRightDrag = true;
                        this.draw.bKeyPressed = true;
                        this.draw.nKeyPressTime = getTimer();
                     }
                  }
                  else if(this.touched(19,399,78,76))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_MOUSE])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_MOUSE])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_MOUSE])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_MOUSE])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.player.UNITBTN[Drawing.UNIT_MOUSE] = true;
                                 this.draw.ope.appearNextUnit(Drawing.UNIT_MOUSE,false,false);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(100,399,78,76))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_RABBIT])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_RABBIT])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_RABBIT])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_RABBIT])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.player.UNITBTN[Drawing.UNIT_RABBIT] = true;
                                 this.draw.ope.appearNextUnit(Drawing.UNIT_RABBIT,false,false);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(181,399,78,76))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_BEAR])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_BEAR])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_BEAR])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_BEAR])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.player.UNITBTN[Drawing.UNIT_BEAR] = true;
                                 this.draw.ope.appearNextUnit(Drawing.UNIT_BEAR,false,false);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(262,399,78,76))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_KANGAROO])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_KANGAROO])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_KANGAROO])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_KANGAROO])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.player.UNITBTN[Drawing.UNIT_KANGAROO] = true;
                                 this.draw.ope.appearNextUnit(Drawing.UNIT_KANGAROO,false,false);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(343,399,78,76))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_TURTLE])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_TURTLE])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_TURTLE])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_TURTLE])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.player.UNITBTN[Drawing.UNIT_TURTLE] = true;
                                 this.draw.ope.appearNextUnit(Drawing.UNIT_TURTLE,false,false);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(424,399,78,76))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_MONKEY])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_MONKEY])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_MONKEY])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_MONKEY])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.player.UNITBTN[Drawing.UNIT_MONKEY] = true;
                                 this.draw.ope.appearNextUnit(Drawing.UNIT_MONKEY,false,false);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(505,399,78,76))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_RHINO])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_RHINO])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_RHINO])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_RHINO])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.player.UNITBTN[Drawing.UNIT_RHINO] = true;
                                 this.draw.ope.appearNextUnit(Drawing.UNIT_RHINO,false,false);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(586,399,78,76))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_PENGUIN])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_PENGUIN])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_PENGUIN])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_PENGUIN])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.player.UNITBTN[Drawing.UNIT_PENGUIN] = true;
                                 this.draw.ope.appearNextUnit(Drawing.UNIT_PENGUIN,false,false);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(667,399,78,76))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_DRAGON])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_DRAGON])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_DRAGON])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_DRAGON])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.player.UNITBTN[Drawing.UNIT_DRAGON] = true;
                                 this.draw.ope.appearNextUnit(Drawing.UNIT_DRAGON,false,false);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(404,476,81,79))
                  {
                     if(!this.draw.player.FIREBTN[0])
                     {
                        this.draw.ope.fireArms(0);
                     }
                  }
                  else if(this.touched(524,476,81,79))
                  {
                     if(!this.draw.player.FIREBTN[1])
                     {
                        this.draw.ope.fireArms(1);
                     }
                  }
                  else if(this.touched(644,476,81,79))
                  {
                     if(!this.draw.player.FIREBTN[2])
                     {
                        this.draw.ope.fireArms(2);
                     }
                  }
                  else if(this.touched(1,Player.BG_BASEPOSY,this.draw.nLcdW - 2,360))
                  {
                     if(this.draw.player.nSubBgPosX >= Drawing.BGINITX)
                     {
                        this.draw.player.nSubBgPosX = this.draw.player.nBgPosX;
                        this.draw.player.nSubBg2PosX = this.draw.player.nBg2PosX;
                        this.draw.player.nSubPosX = this.draw.player.nPosX;
                     }
                     this.draw.player.nMoveBgPosX = this.draw.nTouchX;
                     this.draw.bScreenDrag = true;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gameplayDownTouchNormalBossDialog() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 1:
                  if(this.touched(0,0,this.draw.nLcdW,this.draw.nLcdH))
                  {
                     this.draw.player.nNowTime = getTimer();
                     this.draw.player.nStartTime += this.draw.player.nNowTime - this.draw.nBossEventTime;
                     this.draw.player.nHpRegenTime += this.draw.player.nNowTime - this.draw.nBossEventTime;
                     this.draw.player.nManaRegenTime += this.draw.player.nNowTime - this.draw.nBossEventTime;
                     this.draw.player.nFoodRegenTime += this.draw.player.nNowTime - this.draw.nBossEventTime;
                     this.draw.player.nEnemySetTime += this.draw.player.nNowTime - this.draw.nBossEventTime;
                     this.draw.nKeyPressTime += this.draw.player.nNowTime - this.draw.nBossEventTime;
                     this.draw.player.nGamePlayStartTime += this.draw.player.nNowTime - this.draw.nBossEventTime;
                     this.draw.ope.resetBossDialogPos();
                     this.draw.bBossDialog = false;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gameplayDownTouchDestiny() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 1:
                  if(this.touched(695,0,65,63))
                  {
                     this.draw.lib.stopMusic();
                     this.draw.lib.playEffect(15);
                     this.draw.bPauseBtn = true;
                  }
                  else if(this.touched(24,436,693,79))
                  {
                     _loc1_ = 0;
                     while(_loc1_ < Drawing.MAX_DESTINYICONNUM)
                     {
                        if(this.draw.DESTINYICON[_loc1_].bAppear)
                        {
                           if(this.draw.nTouchX >= this.draw.DESTINYICON[_loc1_].nPosX && this.draw.nTouchX < this.draw.DESTINYICON[_loc1_].nPosX + DestinyIcon.ICON_WIDTH)
                           {
                              if(this.draw.nTouchY >= this.draw.DESTINYICON[_loc1_].nPosY && this.draw.nTouchY < this.draw.DESTINYICON[_loc1_].nPosY + DestinyIcon.ICON_HEIGHT)
                              {
                                 if(!this.draw.player.UNITBTN[_loc1_])
                                 {
                                    this.draw.ope.fireDestinyIcon(_loc1_);
                                 }
                              }
                           }
                        }
                        _loc1_++;
                     }
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gameplayDownTouchWarRoad() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 1:
                  if(this.touched(698,0,62,56))
                  {
                     this.draw.lib.stopMusic();
                     this.draw.lib.playEffect(15);
                     this.draw.bPauseBtn = true;
                  }
                  else if(this.touched(19,470,78,77))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_MOUSE])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_MOUSE])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_MOUSE])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_MOUSE])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.ope.setWarRoadUnitIcon(Drawing.UNIT_MOUSE);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(100,470,78,77))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_RABBIT])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_RABBIT])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_RABBIT])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_RABBIT])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.ope.setWarRoadUnitIcon(Drawing.UNIT_RABBIT);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(181,470,78,77))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_BEAR])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_BEAR])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_BEAR])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_BEAR])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.ope.setWarRoadUnitIcon(Drawing.UNIT_BEAR);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(262,470,78,77))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_KANGAROO])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_KANGAROO])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_KANGAROO])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_KANGAROO])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.ope.setWarRoadUnitIcon(Drawing.UNIT_KANGAROO);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(343,470,78,77))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_TURTLE])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_TURTLE])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_TURTLE])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_TURTLE])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.ope.setWarRoadUnitIcon(Drawing.UNIT_TURTLE);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(424,470,78,77))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_MONKEY])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_MONKEY])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_MONKEY])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_MONKEY])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.ope.setWarRoadUnitIcon(Drawing.UNIT_MONKEY);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(505,470,78,77))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_RHINO])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_RHINO])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_RHINO])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_RHINO])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.ope.setWarRoadUnitIcon(Drawing.UNIT_RHINO);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(586,470,78,77))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_PENGUIN])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_PENGUIN])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_PENGUIN])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_PENGUIN])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.ope.setWarRoadUnitIcon(Drawing.UNIT_PENGUIN);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(667,470,78,77))
                  {
                     if(this.draw.player.UNITEQUIP[Drawing.UNIT_DRAGON])
                     {
                        if(this.draw.player.UNITCHARGED[Drawing.UNIT_DRAGON])
                        {
                           if(!this.draw.player.UNITCOOLING[Drawing.UNIT_DRAGON])
                           {
                              if(!this.draw.player.UNITBTN[Drawing.UNIT_DRAGON])
                              {
                                 this.draw.lib.playEffect(98);
                                 this.draw.ope.setWarRoadUnitIcon(Drawing.UNIT_DRAGON);
                                 this.draw.bKeyPressed = true;
                                 this.draw.nKeyPressTime = getTimer();
                              }
                           }
                        }
                     }
                  }
                  else if(this.touched(274,392,69,69))
                  {
                     if(!this.draw.player.FIREBTN[0])
                     {
                        this.draw.player.bWarRoadSelectUnit = false;
                        this.draw.ope.fireArms(0);
                     }
                  }
                  else if(this.touched(346,392,69,69))
                  {
                     if(!this.draw.player.FIREBTN[1])
                     {
                        this.draw.player.bWarRoadSelectUnit = false;
                        this.draw.ope.fireArms(1);
                     }
                  }
                  else if(this.touched(417,392,69,69))
                  {
                     if(!this.draw.player.FIREBTN[2])
                     {
                        this.draw.player.bWarRoadSelectUnit = false;
                        this.draw.ope.fireArms(2);
                     }
                  }
                  else if(this.touched(0,Player.WARROAD_ROADTOUCHBASEY,this.draw.nLcdW,Player.WARROAD_UNITBASEYGAGAP * Player.NUM_WARROAD))
                  {
                     if(this.draw.player.bWarRoadSelectUnit)
                     {
                        if(this.touched(0,Player.WARROAD_ROADTOUCHBASEY,this.draw.nLcdW,Player.WARROAD_UNITBASEYGAGAP))
                        {
                           this.draw.lib.playEffect(76);
                           this.draw.player.nWarRoadUnitPos = 0;
                           if(this.draw.player.nSetWarRoadUnit <= Drawing.INITDATA)
                           {
                              this.draw.ope.setWarRoadAttack(Drawing.ATTACK_HORIZON,Drawing.INITDATA);
                           }
                           else
                           {
                              this.draw.ope.appearNextUnit(this.draw.player.nSetWarRoadUnit,false,false);
                           }
                           this.draw.ope.resetWarRoadUnitIcon();
                           this.draw.bKeyPressed = true;
                           this.draw.nKeyPressTime = getTimer();
                        }
                        else if(this.touched(0,Player.WARROAD_ROADTOUCHBASEY + Player.WARROAD_UNITBASEYGAGAP,this.draw.nLcdW,Player.WARROAD_UNITBASEYGAGAP))
                        {
                           this.draw.lib.playEffect(76);
                           this.draw.player.nWarRoadUnitPos = 1;
                           if(this.draw.player.nSetWarRoadUnit <= Drawing.INITDATA)
                           {
                              this.draw.ope.setWarRoadAttack(Drawing.ATTACK_HORIZON,Drawing.INITDATA);
                           }
                           else
                           {
                              this.draw.ope.appearNextUnit(this.draw.player.nSetWarRoadUnit,false,false);
                           }
                           this.draw.ope.resetWarRoadUnitIcon();
                           this.draw.bKeyPressed = true;
                           this.draw.nKeyPressTime = getTimer();
                        }
                        else if(this.touched(0,Player.WARROAD_ROADTOUCHBASEY + Player.WARROAD_UNITBASEYGAGAP * 2,this.draw.nLcdW,Player.WARROAD_UNITBASEYGAGAP))
                        {
                           this.draw.lib.playEffect(76);
                           this.draw.player.nWarRoadUnitPos = 2;
                           if(this.draw.player.nSetWarRoadUnit <= Drawing.INITDATA)
                           {
                              this.draw.ope.setWarRoadAttack(Drawing.ATTACK_HORIZON,Drawing.INITDATA);
                           }
                           else
                           {
                              this.draw.ope.appearNextUnit(this.draw.player.nSetWarRoadUnit,false,false);
                           }
                           this.draw.ope.resetWarRoadUnitIcon();
                           this.draw.bKeyPressed = true;
                           this.draw.nKeyPressTime = getTimer();
                        }
                        else if(this.touched(0,Player.WARROAD_ROADTOUCHBASEY + Player.WARROAD_UNITBASEYGAGAP * 3,this.draw.nLcdW,Player.WARROAD_UNITBASEYGAGAP))
                        {
                           this.draw.lib.playEffect(76);
                           this.draw.player.nWarRoadUnitPos = 3;
                           if(this.draw.player.nSetWarRoadUnit <= Drawing.INITDATA)
                           {
                              this.draw.ope.setWarRoadAttack(Drawing.ATTACK_HORIZON,Drawing.INITDATA);
                           }
                           else
                           {
                              this.draw.ope.appearNextUnit(this.draw.player.nSetWarRoadUnit,false,false);
                           }
                           this.draw.ope.resetWarRoadUnitIcon();
                           this.draw.bKeyPressed = true;
                           this.draw.nKeyPressTime = getTimer();
                        }
                        else if(this.touched(0,Player.WARROAD_ROADTOUCHBASEY + Player.WARROAD_UNITBASEYGAGAP * 4,this.draw.nLcdW,Player.WARROAD_UNITBASEYGAGAP))
                        {
                           this.draw.lib.playEffect(76);
                           this.draw.player.nWarRoadUnitPos = 4;
                           if(this.draw.player.nSetWarRoadUnit <= Drawing.INITDATA)
                           {
                              this.draw.ope.setWarRoadAttack(Drawing.ATTACK_HORIZON,Drawing.INITDATA);
                           }
                           else
                           {
                              this.draw.ope.appearNextUnit(this.draw.player.nSetWarRoadUnit,false,false);
                           }
                           this.draw.ope.resetWarRoadUnitIcon();
                           this.draw.bKeyPressed = true;
                           this.draw.nKeyPressTime = getTimer();
                        }
                     }
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gameplayMoveTouch() : void
      {
         var _loc1_:int = 0;
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 1:
                  if(this.draw.bScreenDrag)
                  {
                     if(this.moveTouched(1,Player.BG_BASEPOSY,this.draw.nLcdW - 2,360))
                     {
                        if(this.draw.player.nMoveBgPosX > Drawing.INITDATA && this.draw.player.nMoveBgPosX <= this.draw.nLcdW)
                        {
                           this.nDistance = this.draw.nTouchMoveX - this.draw.player.nMoveBgPosX;
                           if(this.nDistance >= 2 || this.nDistance <= -2)
                           {
                              if(this.draw.player.nBgPosX + this.nDistance >= this.draw.player.nBgLeftX)
                              {
                                 this.nDistance -= this.draw.player.nBgPosX + this.nDistance - this.draw.player.nBgLeftX;
                              }
                              else if(this.draw.player.nBgPosX + this.nDistance <= -this.draw.player.nBgRightX)
                              {
                                 this.nDistance -= this.draw.player.nBgPosX + this.nDistance + this.draw.player.nBgRightX;
                              }
                              this.draw.player.nBgPosX += this.nDistance;
                              this.draw.player.nBg2PosX += this.nDistance / 100 * Player.BG2_MOVE;
                              this.draw.player.nPosX += this.nDistance;
                              _loc1_ = 0;
                              while(_loc1_ < Drawing.MAX_ENEMYNUM)
                              {
                                 if(this.draw.ENEMY[_loc1_].bAppear)
                                 {
                                    this.draw.ENEMY[_loc1_].nPosX += this.nDistance;
                                 }
                                 _loc1_++;
                              }
                              _loc1_ = 0;
                              while(_loc1_ < Drawing.MAX_UNITNUM)
                              {
                                 if(this.draw.UNIT[_loc1_].bAppear)
                                 {
                                    this.draw.UNIT[_loc1_].nPosX += this.nDistance;
                                 }
                                 _loc1_++;
                              }
                              this.draw.player.nMoveBgPosX = this.draw.nTouchMoveX;
                           }
                        }
                     }
                     else
                     {
                        this.draw.player.nMoveBgPosX = Drawing.INITDATA;
                        this.draw.bScreenDrag = false;
                     }
                  }
                  else if(this.draw.bMoveLeftDrag)
                  {
                     if(!this.moveTouched(67,484,109,67))
                     {
                        if(!this.draw.bKeyMove)
                        {
                           this.draw.player.bMoveLeft = false;
                           this.draw.player.bBgLeft = false;
                           this.draw.player.bMoveRight = false;
                           this.draw.player.bBgRight = false;
                           this.draw.player.nMoveDirection = Drawing.INITDATA;
                           this.draw.bMoveLeftDrag = false;
                        }
                     }
                  }
                  else if(this.draw.bMoveRightDrag)
                  {
                     if(!this.moveTouched(214,484,109,67))
                     {
                        if(!this.draw.bKeyMove)
                        {
                           this.draw.player.bMoveLeft = false;
                           this.draw.player.bBgLeft = false;
                           this.draw.player.bMoveRight = false;
                           this.draw.player.bBgRight = false;
                           this.draw.player.nMoveDirection = Drawing.INITDATA;
                           this.draw.bMoveRightDrag = false;
                        }
                     }
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gamemenuDownTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 1:
                  if(this.touched(278,225,204,65))
                  {
                     if(this.draw.player.nGameMode == Drawing.MODE_BOSS)
                     {
                        this.draw.lib.playMusic(Library.MUSIC_BOSS,true);
                     }
                     else
                     {
                        this.draw.lib.playMusic(Library.MUSIC_STAGE,true);
                     }
                     this.draw.lib.playEffect(15);
                     this.draw.bResumeBtn = true;
                  }
                  else if(this.touched(278,300,204,65))
                  {
                     this.draw.lib.stopMusic();
                     this.draw.lib.playEffect(15);
                     this.draw.bGiveUpBtn = true;
                  }
                  else if(this.touched(238,403,140,50))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bAppStoreBtn = true;
                  }
                  else if(this.touched(382,403,140,50))
                  {
                     this.draw.lib.playEffect(15);
                     this.draw.bGooglePlayBtn = true;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gameLevelUpDownTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 1:
                  if(this.touched(39,160,210,317))
                  {
                     if(this.draw.player.SKILLINDEX[0] > Drawing.INITDATA)
                     {
                        this.draw.lib.playEffect(15);
                        if(this.draw.player.SKILLINDEX[0] < Player.MAX_SKILL)
                        {
                           ++this.draw.player.HEROSKILL[this.draw.player.SKILLINDEX[0]];
                        }
                        else
                        {
                           ++this.draw.player.UNITUPGRADE[this.draw.player.SKILLINDEX[0] - Player.SKILL_MOUSE];
                           this.draw.player.UNITEQUIP[this.draw.player.SKILLINDEX[0] - Player.SKILL_MOUSE] = true;
                           if(this.draw.player.SKILLINDEX[0] - Player.SKILL_MOUSE < Player.SKILL_DRAGON)
                           {
                              this.draw.player.UNITOPEN[this.draw.player.SKILLINDEX[0] - Player.SKILL_MOUSE + 1] = true;
                           }
                        }
                        this.draw.player.nLevelUpSkill = 0;
                        this.draw.ope.paladogSpeedUp();
                        this.draw.player.nHp = this.draw.ope.playerHp();
                        this.draw.ope.playerStop();
                        this.draw.nGameState = Drawing.GAME_PLAY;
                     }
                  }
                  else if(this.touched(275,240,210,317))
                  {
                     if(this.draw.player.SKILLINDEX[1] > Drawing.INITDATA)
                     {
                        this.draw.lib.playEffect(15);
                        ++this.draw.player.HEROSKILL[this.draw.player.SKILLINDEX[1]];
                        this.draw.player.nLevelUpSkill = 1;
                        this.draw.ope.paladogSpeedUp();
                        this.draw.player.nHp = this.draw.ope.playerHp();
                        this.draw.ope.playerStop();
                        this.draw.nGameState = Drawing.GAME_PLAY;
                     }
                  }
                  else if(this.touched(511,240,210,317))
                  {
                     if(this.draw.player.SKILLINDEX[2] > Drawing.INITDATA)
                     {
                        this.draw.lib.playEffect(15);
                        ++this.draw.player.HEROSKILL[this.draw.player.SKILLINDEX[2]];
                        this.draw.player.nLevelUpSkill = 2;
                        this.draw.ope.paladogSpeedUp();
                        this.draw.player.nHp = this.draw.ope.playerHp();
                        this.draw.ope.playerStop();
                        this.draw.nGameState = Drawing.GAME_PLAY;
                     }
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gameOverDownTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 2:
                  if(this.touched(544,494,204,65))
                  {
                     this.draw.lib.stopMusic();
                     this.draw.lib.playEffect(15);
                     this.draw.bOkBtn = true;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gameClearDownTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 0:
                  if(this.touched(458,435,186,77))
                  {
                     this.draw.lib.stopMusic();
                     this.draw.lib.playEffect(78);
                     this.draw.bOkBtn = true;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gameCinemaDownTouch() : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 0:
                  if(this.draw.player.nNowPlayChapter < 4)
                  {
                     if(this.touched(0,0,this.draw.nLcdW,this.draw.nLcdH))
                     {
                        if(this.draw.nGameFrame >= 119)
                        {
                           this.draw.bChapterClearSnd = false;
                           this.draw.bEventSkipBtn = false;
                           this.draw.bEventNextBtn = false;
                           this.draw.nEventScene = 0;
                           this.draw.nEventFrame = 0;
                           this.draw.nEventSoundCount = 0;
                           ++this.draw.nGameScene;
                           this.draw.nDialogStep = 0;
                           this.draw.lib.playEffect(15);
                           if(this.draw.player.nNowPlayChapter == 3)
                           {
                              this.draw.lib.playMusic(Library.MUSIC_TITLE,true);
                           }
                           else
                           {
                              this.draw.lib.playMusic(Library.MUSIC_STAGE,true);
                           }
                        }
                     }
                  }
                  break;
               case 1:
                  if(this.draw.player.nNowPlayChapter < 4)
                  {
                     switch(this.draw.player.nNowPlayChapter)
                     {
                        case 0:
                           switch(this.draw.nEventScene)
                           {
                              case 1:
                              case 3:
                              case 5:
                              case 7:
                              case 10:
                              case 12:
                                 if(this.touched(604,511,140,44))
                                 {
                                    if(!this.draw.bEventNextBtn)
                                    {
                                       this.draw.lib.playEffect(15);
                                       this.draw.bEventNextBtn = true;
                                       this.draw.nEventSoundCount = 0;
                                    }
                                 }
                           }
                           if(this.touched(17,511,140,44))
                           {
                              if(!this.draw.bEventSkipBtn)
                              {
                                 this.draw.lib.playEffect(15);
                                 this.draw.bEventSkipBtn = true;
                                 this.draw.nEventSoundCount = 0;
                              }
                           }
                           break;
                        case 1:
                           switch(this.draw.nEventScene)
                           {
                              case 1:
                              case 3:
                              case 4:
                              case 5:
                              case 6:
                              case 8:
                              case 10:
                              case 11:
                              case 12:
                              case 13:
                              case 16:
                              case 18:
                                 if(this.touched(604,511,140,44))
                                 {
                                    if(!this.draw.bEventNextBtn)
                                    {
                                       this.draw.lib.playEffect(15);
                                       this.draw.bEventNextBtn = true;
                                       this.draw.nEventSoundCount = 0;
                                    }
                                 }
                           }
                           if(this.touched(17,511,140,44))
                           {
                              if(!this.draw.bEventSkipBtn)
                              {
                                 this.draw.lib.playEffect(15);
                                 this.draw.bEventSkipBtn = true;
                                 this.draw.nEventSoundCount = 0;
                              }
                           }
                           break;
                        case 2:
                           switch(this.draw.nEventScene)
                           {
                              case 1:
                              case 2:
                              case 3:
                              case 4:
                              case 5:
                              case 10:
                                 if(this.touched(604,511,140,44))
                                 {
                                    if(!this.draw.bEventNextBtn)
                                    {
                                       this.draw.lib.playEffect(15);
                                       this.draw.bEventNextBtn = true;
                                       this.draw.nEventSoundCount = 0;
                                    }
                                 }
                           }
                           if(this.touched(17,511,140,44))
                           {
                              if(!this.draw.bEventSkipBtn)
                              {
                                 this.draw.lib.playEffect(15);
                                 this.draw.bEventSkipBtn = true;
                                 this.draw.nEventSoundCount = 0;
                              }
                           }
                           break;
                        case 3:
                           switch(this.draw.nEventScene)
                           {
                              case 1:
                              case 3:
                              case 5:
                              case 9:
                              case 11:
                              case 13:
                              case 15:
                              case 17:
                              case 19:
                              case 21:
                              case 23:
                              case 25:
                              case 28:
                                 if(this.touched(604,511,140,44))
                                 {
                                    if(!this.draw.bEventNextBtn)
                                    {
                                       this.draw.lib.playEffect(15);
                                       this.draw.bEventNextBtn = true;
                                       this.draw.nEventSoundCount = 0;
                                    }
                                 }
                           }
                           if(this.touched(17,511,140,44))
                           {
                              if(!this.draw.bEventSkipBtn)
                              {
                                 this.draw.lib.playEffect(15);
                                 this.draw.bEventSkipBtn = true;
                                 this.draw.nEventSoundCount = 0;
                              }
                           }
                     }
                  }
            }
            this.draw.bActive = true;
         }
      }
   }
}

