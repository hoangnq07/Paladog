package com.fazecat.web.paladog
{
   public class StageDB
   {
      
      public static const MAX_APPEARMOBKIND:int = 5;
      
      public var strStageName:String;
      
      public var nTableID:int;
      
      public var nFileVersion:Number;
      
      public var nMobCreateMinTime_First:int;
      
      public var nMobCreateMaxTime_First:int;
      
      public var nTurningPoint:int;
      
      public var nMobCreateMinTime_Last:int;
      
      public var nMobCreateMaxTime_Last:int;
      
      public var nEnemyStationHp:int;
      
      public var APPEARMOBKIND:Array = new Array(MAX_APPEARMOBKIND);
      
      public var APPEARMOBCHANCE:Array = new Array(MAX_APPEARMOBKIND);
      
      public var nStageClearMoney:int;
      
      public var nStageClearLimitTime:int;
      
      public var nStageClearLevelTime:int;
      
      public function StageDB()
      {
         super();
      }
   }
}

