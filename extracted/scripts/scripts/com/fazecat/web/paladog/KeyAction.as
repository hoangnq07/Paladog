package com.fazecat.web.paladog
{
   import flash.display.*;
   import flash.events.*;
   import flash.media.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   
   public class KeyAction
   {
      
      private var draw:Drawing;
      
      public var bDownEvent:Boolean;
      
      public var bUpEvent:Boolean;
      
      private var nDistance:int;
      
      public function KeyAction(param1:Drawing)
      {
         super();
         this.draw = param1;
         this.bDownEvent = false;
         this.bUpEvent = false;
      }
      
      public function keyPress(param1:int) : void
      {
         switch(this.draw.nMainState)
         {
            case Drawing.MAIN_TITLE:
               this.titleDownKey(param1);
               break;
            case Drawing.MAIN_MENU:
               this.menuDownKey(param1);
               break;
            case Drawing.MAIN_GAME:
               this.gameDownKey(param1);
               break;
            case Drawing.MAIN_INTRO:
               this.introDownKey(param1);
               break;
            case Drawing.MAIN_OPTION:
               this.optionDownKey(param1);
               break;
            case Drawing.MAIN_HELP:
               this.helpDownKey(param1);
               break;
            case Drawing.MAIN_TUTORIAL:
               this.tutorialDownKey(param1);
               break;
            case Drawing.MAIN_STAGESELECT:
               this.stageselectDownKey(param1);
         }
      }
      
      public function keyRelease(param1:int) : void
      {
         switch(this.draw.nMainState)
         {
            case Drawing.MAIN_GAME:
               this.gameUpKey(param1);
         }
      }
      
      public function menuDownKey(param1:int) : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 1:
                  switch(param1)
                  {
                     case Keyboard.ESCAPE:
                        this.draw.lib.playEffect(15);
                        this.draw.nSubAniX = 0;
                        this.draw.nSubAniX2 = 0;
                        this.draw.nSubAniX3 = 0;
                        this.draw.nMainScene = 2;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function optionDownKey(param1:int) : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 1:
                  switch(param1)
                  {
                     case Keyboard.ESCAPE:
                        this.draw.lib.saveFile(Drawing.DB_OPTION,"paladog_option");
                        this.draw.lib.playEffect(15);
                        this.draw.nSubAniX = 0;
                        this.draw.nSubAniX2 = 0;
                        this.draw.nSubAniX3 = 0;
                        this.draw.nMainScene = 2;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function stageselectDownKey(param1:int) : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 100:
                  switch(param1)
                  {
                     case Keyboard.ESCAPE:
                        this.draw.lib.playEffect(15);
                        this.draw.bNoBtn = true;
                  }
                  break;
               case 1000:
               case 1001:
               case 1002:
                  switch(param1)
                  {
                     case Keyboard.ENTER:
                     case Keyboard.SPACE:
                        this.draw.lib.playEffect(15);
                        this.draw.bOkBtn = true;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function tutorialDownKey(param1:int) : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 10:
               case 11:
               case 12:
               case 13:
               case 14:
               case 15:
               case 16:
                  switch(param1)
                  {
                     case Keyboard.ENTER:
                     case Keyboard.SPACE:
                        this.draw.lib.playEffect(71);
                        this.draw.bOkBtn = true;
                  }
                  break;
               case 1000:
                  switch(param1)
                  {
                     case Keyboard.ENTER:
                     case Keyboard.SPACE:
                        switch(this.draw.nEventScene)
                        {
                           case 1:
                           case 3:
                              if(!this.draw.bEventNextBtn)
                              {
                                 this.draw.lib.playEffect(15);
                                 this.draw.bEventNextBtn = true;
                                 this.draw.nEventSoundCount = 0;
                              }
                        }
                        break;
                     case Keyboard.ESCAPE:
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
      
      public function helpDownKey(param1:int) : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 0:
                  switch(param1)
                  {
                     case Keyboard.ESCAPE:
                        this.draw.lib.playEffect(15);
                        this.draw.bNoBtn = true;
                  }
                  break;
               case 100:
               case 101:
               case 102:
               case 103:
               case 104:
               case 105:
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
               case 500:
               case 501:
               case 502:
                  switch(param1)
                  {
                     case Keyboard.ENTER:
                     case Keyboard.SPACE:
                        this.draw.lib.playEffect(71);
                        this.draw.bOkBtn = true;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function introDownKey(param1:int) : void
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
                  switch(param1)
                  {
                     case Keyboard.ENTER:
                     case Keyboard.SPACE:
                        this.draw.bOkBtn = true;
                  }
                  break;
               case 24:
               case 25:
                  switch(param1)
                  {
                     case Keyboard.ENTER:
                     case Keyboard.SPACE:
                        this.draw.bOkBtn = true;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function titleDownKey(param1:int) : void
      {
         var _loc2_:int = 0;
         if(!this.draw.bActive)
         {
            switch(this.draw.nMainScene)
            {
               case 0:
                  switch(param1)
                  {
                     case Keyboard.P:
                        if(this.draw.nPasswordPos == 0)
                        {
                           this.draw.PASSWORD[this.draw.nPasswordPos] = true;
                        }
                        else
                        {
                           this.draw.PASSWORD[this.draw.nPasswordPos] = false;
                        }
                        if(this.draw.nPasswordPos < 8)
                        {
                           ++this.draw.nPasswordPos;
                        }
                        break;
                     case Keyboard.A:
                        if(this.draw.nPasswordPos == 1 || this.draw.nPasswordPos == 3)
                        {
                           this.draw.PASSWORD[this.draw.nPasswordPos] = true;
                        }
                        else
                        {
                           this.draw.PASSWORD[this.draw.nPasswordPos] = false;
                        }
                        if(this.draw.nPasswordPos < 8)
                        {
                           ++this.draw.nPasswordPos;
                        }
                        break;
                     case Keyboard.L:
                        if(this.draw.nPasswordPos == 2)
                        {
                           this.draw.PASSWORD[this.draw.nPasswordPos] = true;
                        }
                        else
                        {
                           this.draw.PASSWORD[this.draw.nPasswordPos] = false;
                        }
                        if(this.draw.nPasswordPos < 8)
                        {
                           ++this.draw.nPasswordPos;
                        }
                        break;
                     case Keyboard.NUMBER_2:
                        if(this.draw.nPasswordPos == 4)
                        {
                           this.draw.PASSWORD[this.draw.nPasswordPos] = true;
                        }
                        else
                        {
                           this.draw.PASSWORD[this.draw.nPasswordPos] = false;
                        }
                        if(this.draw.nPasswordPos < 8)
                        {
                           ++this.draw.nPasswordPos;
                        }
                        break;
                     case Keyboard.NUMBER_0:
                        if(this.draw.nPasswordPos == 5)
                        {
                           this.draw.PASSWORD[this.draw.nPasswordPos] = true;
                        }
                        else
                        {
                           this.draw.PASSWORD[this.draw.nPasswordPos] = false;
                        }
                        if(this.draw.nPasswordPos < 8)
                        {
                           ++this.draw.nPasswordPos;
                        }
                        break;
                     case Keyboard.NUMBER_1:
                        if(this.draw.nPasswordPos == 6 || this.draw.nPasswordPos == 7)
                        {
                           this.draw.PASSWORD[this.draw.nPasswordPos] = true;
                        }
                        else
                        {
                           this.draw.PASSWORD[this.draw.nPasswordPos] = false;
                        }
                        if(this.draw.nPasswordPos < 8)
                        {
                           ++this.draw.nPasswordPos;
                        }
                        break;
                     case Keyboard.ENTER:
                        this.draw.bPasswordLock = false;
                        _loc2_ = 0;
                        while(_loc2_ < 8)
                        {
                           if(!this.draw.PASSWORD[_loc2_])
                           {
                              this.draw.bPasswordLock = true;
                              this.draw.nPasswordPos = 0;
                           }
                           _loc2_++;
                        }
                        break;
                     case Keyboard.BACKSPACE:
                        --this.draw.nPasswordPos;
                        if(this.draw.nPasswordPos < 0)
                        {
                           this.draw.nPasswordPos = 0;
                        }
                        break;
                     default:
                        if(this.draw.nPasswordPos < 8)
                        {
                           ++this.draw.nPasswordPos;
                        }
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gameDownKey(param1:int) : void
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
                        this.gameplayDownKeyNormal(param1);
                     }
                     else if(!this.draw.bBossDiaEvent && this.draw.bBossDialog)
                     {
                        this.gameplayDownKeyNormalBossDialog(param1);
                     }
                     break;
                  case Drawing.MODE_WARROAD:
                     this.gameplayDownKeyWarRoad(param1);
                     break;
                  case Drawing.MODE_DESTINY:
                     this.gameplayDownKeyDestiny(param1);
               }
               break;
            case Drawing.GAME_MENU:
               this.gamemenuDownKey(param1);
               break;
            case Drawing.GAME_LEVELUP:
               this.gameLevelUpDownKey(param1);
               break;
            case Drawing.GAME_CLEAR:
               this.gameClearDownKey(param1);
               break;
            case Drawing.GAME_CINEMA:
               this.gameCinemaDownKey(param1);
               break;
            case Drawing.GAME_OVER:
               this.gameOverDownKey(param1);
         }
      }
      
      public function gameCinemaDownKey(param1:int) : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 0:
                  switch(param1)
                  {
                     case Keyboard.ENTER:
                     case Keyboard.SPACE:
                        if(this.draw.player.nNowPlayChapter < 4)
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
                           switch(param1)
                           {
                              case Keyboard.ENTER:
                              case Keyboard.SPACE:
                                 switch(this.draw.nEventScene)
                                 {
                                    case 1:
                                    case 3:
                                    case 5:
                                    case 7:
                                    case 10:
                                    case 12:
                                       if(!this.draw.bEventNextBtn)
                                       {
                                          this.draw.lib.playEffect(15);
                                          this.draw.bEventNextBtn = true;
                                          this.draw.nEventSoundCount = 0;
                                       }
                                 }
                                 break;
                              case Keyboard.ESCAPE:
                                 if(!this.draw.bEventSkipBtn)
                                 {
                                    this.draw.lib.playEffect(15);
                                    this.draw.bEventSkipBtn = true;
                                    this.draw.nEventSoundCount = 0;
                                 }
                           }
                           break;
                        case 1:
                           switch(param1)
                           {
                              case Keyboard.ENTER:
                              case Keyboard.SPACE:
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
                                       if(!this.draw.bEventNextBtn)
                                       {
                                          this.draw.lib.playEffect(15);
                                          this.draw.bEventNextBtn = true;
                                          this.draw.nEventSoundCount = 0;
                                       }
                                 }
                                 break;
                              case Keyboard.ESCAPE:
                                 if(!this.draw.bEventSkipBtn)
                                 {
                                    this.draw.lib.playEffect(15);
                                    this.draw.bEventSkipBtn = true;
                                    this.draw.nEventSoundCount = 0;
                                 }
                           }
                           break;
                        case 2:
                           switch(param1)
                           {
                              case Keyboard.ENTER:
                              case Keyboard.SPACE:
                                 switch(this.draw.nEventScene)
                                 {
                                    case 1:
                                    case 2:
                                    case 3:
                                    case 4:
                                    case 5:
                                    case 10:
                                       if(!this.draw.bEventNextBtn)
                                       {
                                          this.draw.lib.playEffect(15);
                                          this.draw.bEventNextBtn = true;
                                          this.draw.nEventSoundCount = 0;
                                       }
                                 }
                                 break;
                              case Keyboard.ESCAPE:
                                 if(!this.draw.bEventSkipBtn)
                                 {
                                    this.draw.lib.playEffect(15);
                                    this.draw.bEventSkipBtn = true;
                                    this.draw.nEventSoundCount = 0;
                                 }
                           }
                           break;
                        case 3:
                           switch(param1)
                           {
                              case Keyboard.ENTER:
                              case Keyboard.SPACE:
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
                                       if(!this.draw.bEventNextBtn)
                                       {
                                          this.draw.lib.playEffect(15);
                                          this.draw.bEventNextBtn = true;
                                          this.draw.nEventSoundCount = 0;
                                       }
                                 }
                                 break;
                              case Keyboard.ESCAPE:
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
      
      public function gameOverDownKey(param1:int) : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 2:
                  switch(param1)
                  {
                     case Keyboard.ENTER:
                     case Keyboard.SPACE:
                        this.draw.lib.stopMusic();
                        this.draw.lib.playEffect(15);
                        this.draw.bOkBtn = true;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gameClearDownKey(param1:int) : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 0:
                  switch(param1)
                  {
                     case Keyboard.ENTER:
                     case Keyboard.SPACE:
                        this.draw.lib.stopMusic();
                        this.draw.lib.playEffect(78);
                        this.draw.bOkBtn = true;
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gameUpKey(param1:int) : void
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
                     this.gameplayUpKey(param1);
               }
         }
      }
      
      public function gameplayDownKeyNormalBossDialog(param1:int) : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 1:
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
            this.draw.bActive = true;
         }
      }
      
      public function gameplayDownKeyNormal(param1:int) : void
      {
         var _loc2_:int = 0;
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 1:
                  switch(param1)
                  {
                     case Keyboard.A:
                     case Keyboard.LEFT:
                        if(!this.draw.player.bAttack)
                        {
                           this.draw.player.nMoveDirection = Drawing.INITDATA;
                           this.draw.player.bMoveRight = false;
                           this.draw.player.bBgRight = false;
                           this.draw.player.bMoveLeft = true;
                           this.draw.ope.resetMouseDrag();
                           this.draw.bKeyMove = true;
                        }
                        else
                        {
                           this.draw.player.bMoveRight = false;
                           this.draw.player.bBgRight = false;
                           this.draw.player.bMoveLeft = false;
                           this.draw.player.bBgLeft = false;
                           this.draw.player.nMoveDirection = Drawing.MOVE_LEFT;
                           this.draw.bKeyMove = true;
                        }
                        this.draw.bKeyPressed = true;
                        this.draw.nKeyPressTime = getTimer();
                        break;
                     case Keyboard.D:
                     case Keyboard.RIGHT:
                        if(!this.draw.player.bAttack)
                        {
                           this.draw.player.nMoveDirection = Drawing.INITDATA;
                           this.draw.player.bMoveLeft = false;
                           this.draw.player.bBgLeft = false;
                           this.draw.player.bMoveRight = true;
                           this.draw.ope.resetMouseDrag();
                           this.draw.bKeyMove = true;
                        }
                        else
                        {
                           this.draw.player.bMoveLeft = false;
                           this.draw.player.bBgLeft = false;
                           this.draw.player.bMoveRight = false;
                           this.draw.player.bBgRight = false;
                           this.draw.player.nMoveDirection = Drawing.MOVE_RIGHT;
                           this.draw.bKeyMove = true;
                        }
                        this.draw.bKeyPressed = true;
                        this.draw.nKeyPressTime = getTimer();
                        break;
                     case Keyboard.NUMBER_1:
                     case Keyboard.NUMPAD_1:
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
                        break;
                     case Keyboard.NUMBER_2:
                     case Keyboard.NUMPAD_2:
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
                        break;
                     case Keyboard.NUMBER_3:
                     case Keyboard.NUMPAD_3:
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
                        break;
                     case Keyboard.NUMBER_4:
                     case Keyboard.NUMPAD_4:
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
                        break;
                     case Keyboard.NUMBER_5:
                     case Keyboard.NUMPAD_5:
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
                        break;
                     case Keyboard.NUMBER_6:
                     case Keyboard.NUMPAD_6:
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
                        break;
                     case Keyboard.NUMBER_7:
                     case Keyboard.NUMPAD_7:
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
                        break;
                     case Keyboard.NUMBER_8:
                     case Keyboard.NUMPAD_8:
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
                        break;
                     case Keyboard.NUMBER_9:
                     case Keyboard.NUMPAD_9:
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
                        break;
                     case Keyboard.J:
                        if(!this.draw.player.FIREBTN[0])
                        {
                           this.draw.ope.fireArms(0);
                        }
                        break;
                     case Keyboard.K:
                        if(!this.draw.player.FIREBTN[1])
                        {
                           this.draw.ope.fireArms(1);
                        }
                        break;
                     case Keyboard.L:
                        if(!this.draw.player.FIREBTN[2])
                        {
                           this.draw.ope.fireArms(2);
                        }
                        break;
                     case Keyboard.Q:
                        if(this.draw.player.nSubBgPosX >= Drawing.BGINITX)
                        {
                           this.draw.player.nSubBgPosX = this.draw.player.nBgPosX;
                           this.draw.player.nSubBg2PosX = this.draw.player.nBg2PosX;
                           this.draw.player.nSubPosX = this.draw.player.nPosX;
                        }
                        this.nDistance = Player.BGMOVE_WIDTH;
                        if(this.draw.player.nBgPosX + this.nDistance >= this.draw.player.nBgLeftX)
                        {
                           this.nDistance -= this.draw.player.nBgPosX + this.nDistance - this.draw.player.nBgLeftX;
                        }
                        this.draw.player.nBgPosX += this.nDistance;
                        this.draw.player.nBg2PosX += this.nDistance / 100 * Player.BG2_MOVE;
                        this.draw.player.nPosX += this.nDistance;
                        this.draw.ope.playerControlMove(this.nDistance);
                        break;
                     case Keyboard.E:
                        if(this.draw.player.nSubBgPosX >= Drawing.BGINITX)
                        {
                           this.draw.player.nSubBgPosX = this.draw.player.nBgPosX;
                           this.draw.player.nSubBg2PosX = this.draw.player.nBg2PosX;
                           this.draw.player.nSubPosX = this.draw.player.nPosX;
                        }
                        this.nDistance = Player.BGMOVE_WIDTH;
                        if(this.draw.player.nBgPosX - this.nDistance <= -this.draw.player.nBgRightX)
                        {
                           this.nDistance += this.draw.player.nBgPosX - this.nDistance + this.draw.player.nBgRightX;
                        }
                        this.draw.player.nBgPosX -= this.nDistance;
                        this.draw.player.nBg2PosX -= this.nDistance / 100 * Player.BG2_MOVE;
                        this.draw.player.nPosX -= this.nDistance;
                        this.draw.ope.playerControlMove(-this.nDistance);
                        break;
                     case Keyboard.W:
                        this.draw.ope.resetMouseDrag();
                        break;
                     case Keyboard.ESCAPE:
                        this.draw.lib.stopMusic();
                        this.draw.lib.playEffect(15);
                        this.draw.bPauseBtn = true;
                        break;
                     case Keyboard.P:
                        if(Drawing.GAME_CHEAT)
                        {
                           this.draw.player.nMoney += 4500000;
                        }
                        break;
                     case Keyboard.O:
                        if(Drawing.GAME_CHEAT)
                        {
                           if(this.draw.bGameSave)
                           {
                              this.draw.bGameSave = false;
                           }
                           else
                           {
                              this.draw.bGameSave = true;
                           }
                        }
                        break;
                     case Keyboard.I:
                        if(Drawing.GAME_CHEAT)
                        {
                           this.draw.lib.playEffect(83);
                           this.draw.player.nLevel = 198;
                           this.draw.player.nExp = (this.draw.player.nLevel * this.draw.player.nLevel - (this.draw.player.nLevel - 1) * (this.draw.player.nLevel - 1)) * 100 - 1;
                           _loc2_ = 0;
                           while(_loc2_ < Player.MAX_SKILL)
                           {
                              this.draw.player.HEROSKILL[_loc2_] = this.draw.player.HEROMAXSKILL[_loc2_];
                              if(_loc2_ == Player.SKILL_WISH || _loc2_ == Player.SKILL_AREAAURA)
                              {
                                 --this.draw.player.HEROSKILL[_loc2_];
                              }
                              _loc2_++;
                           }
                           this.draw.ope.paladogSpeedUp();
                           this.draw.player.nHp = this.draw.ope.playerHp();
                           this.draw.ope.playerStop();
                        }
                        break;
                     case Keyboard.U:
                        if(Drawing.GAME_CHEAT)
                        {
                           _loc2_ = 0;
                           while(_loc2_ < 20)
                           {
                              this.draw.ope.eatItem(_loc2_,10);
                              _loc2_++;
                           }
                        }
                        break;
                     case Keyboard.M:
                        if(Drawing.GAME_CHEAT)
                        {
                           if(this.draw.player.nGameSpeed == 0)
                           {
                              this.draw.player.nGameSpeed = 0.5;
                              this.draw.SLEEP = 1000 / (Drawing.FPS + 30);
                           }
                           else
                           {
                              this.draw.SLEEP = 1000 / (Drawing.FPS + 120);
                              this.draw.player.nGameSpeed = 2;
                           }
                        }
                        break;
                     case Keyboard.N:
                        if(Drawing.GAME_CHEAT)
                        {
                           if(this.draw.player.nGameSpeed == 2)
                           {
                              this.draw.player.nGameSpeed = 0.5;
                              this.draw.SLEEP = 1000 / (Drawing.FPS + 30);
                           }
                           else
                           {
                              this.draw.player.nGameSpeed = 0;
                              this.draw.SLEEP = 1000 / Drawing.FPS;
                           }
                        }
                        break;
                     case Keyboard.B:
                        if(Drawing.GAME_CHEAT)
                        {
                           this.draw.player.bStageClear = true;
                        }
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gamemenuDownKey(param1:int) : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 1:
                  switch(param1)
                  {
                     case Keyboard.ESCAPE:
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
            }
            this.draw.bActive = true;
         }
      }
      
      public function gameplayDownKeyWarRoad(param1:int) : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 1:
                  switch(param1)
                  {
                     case Keyboard.ESCAPE:
                        this.draw.lib.stopMusic();
                        this.draw.lib.playEffect(15);
                        this.draw.bPauseBtn = true;
                        break;
                     case Keyboard.J:
                        if(!this.draw.player.FIREBTN[0])
                        {
                           this.draw.player.bWarRoadSelectUnit = false;
                           this.draw.ope.fireArms(0);
                        }
                        break;
                     case Keyboard.K:
                        if(!this.draw.player.FIREBTN[1])
                        {
                           this.draw.player.bWarRoadSelectUnit = false;
                           this.draw.ope.fireArms(1);
                        }
                        break;
                     case Keyboard.L:
                        if(!this.draw.player.FIREBTN[2])
                        {
                           this.draw.player.bWarRoadSelectUnit = false;
                           this.draw.ope.fireArms(2);
                        }
                        break;
                     case Keyboard.NUMBER_1:
                     case Keyboard.NUMPAD_1:
                        if(this.draw.player.bWarRoadSelectUnit)
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
                        else if(this.draw.player.UNITEQUIP[Drawing.UNIT_MOUSE])
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
                        break;
                     case Keyboard.NUMBER_2:
                     case Keyboard.NUMPAD_2:
                        if(this.draw.player.bWarRoadSelectUnit)
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
                        else if(this.draw.player.UNITEQUIP[Drawing.UNIT_RABBIT])
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
                        break;
                     case Keyboard.NUMBER_3:
                     case Keyboard.NUMPAD_3:
                        if(this.draw.player.bWarRoadSelectUnit)
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
                        else if(this.draw.player.UNITEQUIP[Drawing.UNIT_BEAR])
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
                        break;
                     case Keyboard.NUMBER_4:
                     case Keyboard.NUMPAD_4:
                        if(this.draw.player.bWarRoadSelectUnit)
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
                        else if(this.draw.player.UNITEQUIP[Drawing.UNIT_KANGAROO])
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
                        break;
                     case Keyboard.NUMBER_5:
                     case Keyboard.NUMPAD_5:
                        if(this.draw.player.bWarRoadSelectUnit)
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
                        else if(this.draw.player.UNITEQUIP[Drawing.UNIT_TURTLE])
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
                        break;
                     case Keyboard.NUMBER_6:
                     case Keyboard.NUMPAD_6:
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
                        break;
                     case Keyboard.NUMBER_7:
                     case Keyboard.NUMPAD_7:
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
                        break;
                     case Keyboard.NUMBER_8:
                     case Keyboard.NUMPAD_8:
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
                        break;
                     case Keyboard.NUMBER_9:
                     case Keyboard.NUMPAD_9:
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
                        break;
                     case Keyboard.M:
                        if(Drawing.GAME_CHEAT)
                        {
                           if(this.draw.player.nGameSpeed == 0)
                           {
                              this.draw.player.nGameSpeed = 0.5;
                              this.draw.SLEEP = 1000 / (Drawing.FPS + 30);
                           }
                           else
                           {
                              this.draw.SLEEP = 1000 / (Drawing.FPS + 120);
                              this.draw.player.nGameSpeed = 2;
                           }
                        }
                        break;
                     case Keyboard.N:
                        if(Drawing.GAME_CHEAT)
                        {
                           if(this.draw.player.nGameSpeed == 2)
                           {
                              this.draw.player.nGameSpeed = 0.5;
                              this.draw.SLEEP = 1000 / (Drawing.FPS + 30);
                           }
                           else
                           {
                              this.draw.player.nGameSpeed = 0;
                              this.draw.SLEEP = 1000 / Drawing.FPS;
                           }
                        }
                        break;
                     case Keyboard.B:
                        if(Drawing.GAME_CHEAT)
                        {
                           this.draw.player.bStageClear = true;
                        }
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gameplayDownKeyDestiny(param1:int) : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 1:
                  switch(param1)
                  {
                     case Keyboard.ESCAPE:
                        this.draw.lib.stopMusic();
                        this.draw.lib.playEffect(15);
                        this.draw.bPauseBtn = true;
                        break;
                     case Keyboard.NUMBER_1:
                     case Keyboard.NUMPAD_1:
                        if(this.draw.DESTINYICON[0].bAppear)
                        {
                           if(!this.draw.player.UNITBTN[0])
                           {
                              this.draw.ope.fireDestinyIcon(0);
                           }
                        }
                        break;
                     case Keyboard.NUMBER_2:
                     case Keyboard.NUMPAD_2:
                        if(this.draw.DESTINYICON[1].bAppear)
                        {
                           if(!this.draw.player.UNITBTN[1])
                           {
                              this.draw.ope.fireDestinyIcon(1);
                           }
                        }
                        break;
                     case Keyboard.NUMBER_3:
                     case Keyboard.NUMPAD_3:
                        if(this.draw.DESTINYICON[2].bAppear)
                        {
                           if(!this.draw.player.UNITBTN[2])
                           {
                              this.draw.ope.fireDestinyIcon(2);
                           }
                        }
                        break;
                     case Keyboard.NUMBER_4:
                     case Keyboard.NUMPAD_4:
                        if(this.draw.DESTINYICON[3].bAppear)
                        {
                           if(!this.draw.player.UNITBTN[3])
                           {
                              this.draw.ope.fireDestinyIcon(3);
                           }
                        }
                        break;
                     case Keyboard.NUMBER_5:
                     case Keyboard.NUMPAD_5:
                        if(this.draw.DESTINYICON[4].bAppear)
                        {
                           if(!this.draw.player.UNITBTN[4])
                           {
                              this.draw.ope.fireDestinyIcon(4);
                           }
                        }
                        break;
                     case Keyboard.NUMBER_6:
                     case Keyboard.NUMPAD_6:
                        if(this.draw.DESTINYICON[5].bAppear)
                        {
                           if(!this.draw.player.UNITBTN[5])
                           {
                              this.draw.ope.fireDestinyIcon(5);
                           }
                        }
                        break;
                     case Keyboard.NUMBER_7:
                     case Keyboard.NUMPAD_7:
                        if(this.draw.DESTINYICON[6].bAppear)
                        {
                           if(!this.draw.player.UNITBTN[6])
                           {
                              this.draw.ope.fireDestinyIcon(6);
                           }
                        }
                        break;
                     case Keyboard.NUMBER_8:
                     case Keyboard.NUMPAD_8:
                        if(this.draw.DESTINYICON[7].bAppear)
                        {
                           if(!this.draw.player.UNITBTN[7])
                           {
                              this.draw.ope.fireDestinyIcon(7);
                           }
                        }
                        break;
                     case Keyboard.NUMBER_9:
                     case Keyboard.NUMPAD_9:
                        if(this.draw.DESTINYICON[8].bAppear)
                        {
                           if(!this.draw.player.UNITBTN[8])
                           {
                              this.draw.ope.fireDestinyIcon(8);
                           }
                        }
                        break;
                     case Keyboard.M:
                        if(Drawing.GAME_CHEAT)
                        {
                           if(this.draw.player.nGameSpeed == 0)
                           {
                              this.draw.player.nGameSpeed = 0.5;
                              this.draw.SLEEP = 1000 / (Drawing.FPS + 30);
                           }
                           else
                           {
                              this.draw.SLEEP = 1000 / (Drawing.FPS + 120);
                              this.draw.player.nGameSpeed = 2;
                           }
                        }
                        break;
                     case Keyboard.N:
                        if(Drawing.GAME_CHEAT)
                        {
                           if(this.draw.player.nGameSpeed == 2)
                           {
                              this.draw.player.nGameSpeed = 0.5;
                              this.draw.SLEEP = 1000 / (Drawing.FPS + 30);
                           }
                           else
                           {
                              this.draw.player.nGameSpeed = 0;
                              this.draw.SLEEP = 1000 / Drawing.FPS;
                           }
                        }
                        break;
                     case Keyboard.B:
                        if(Drawing.GAME_CHEAT)
                        {
                           this.draw.player.bStageClear = true;
                        }
                  }
            }
            this.draw.bActive = true;
         }
      }
      
      public function gameplayUpKey(param1:int) : void
      {
         switch(this.draw.nGameScene)
         {
            case 1:
               switch(param1)
               {
                  case Keyboard.A:
                  case Keyboard.LEFT:
                     this.draw.player.bMoveLeft = false;
                     this.draw.player.bBgLeft = false;
                     this.draw.player.nMoveDirection = Drawing.INITDATA;
                     this.draw.bKeyMove = false;
                     break;
                  case Keyboard.D:
                  case Keyboard.RIGHT:
                     this.draw.player.bMoveRight = false;
                     this.draw.player.bBgRight = false;
                     this.draw.player.nMoveDirection = Drawing.INITDATA;
                     this.draw.bKeyMove = false;
               }
         }
      }
      
      public function gameLevelUpDownKey(param1:int) : void
      {
         if(!this.draw.bActive)
         {
            switch(this.draw.nGameScene)
            {
               case 1:
                  switch(param1)
                  {
                     case Keyboard.NUMBER_1:
                     case Keyboard.NUMPAD_1:
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
                        break;
                     case Keyboard.NUMBER_2:
                     case Keyboard.NUMPAD_2:
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
                        break;
                     case Keyboard.NUMBER_3:
                     case Keyboard.NUMPAD_3:
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
   }
}

