package com.fazecat.web.paladog
{
   public class QuestDB
   {
      
      public static const MAX_QUESTVALUE:int = 3;
      
      public static const MAX_QUESTREWARD:int = 2;
      
      public var strStageName:String;
      
      public var nMainQuestIndex:int;
      
      public var MAINQUESTVALUE:Array = new Array(MAX_QUESTVALUE);
      
      public var nMainQuestIcon:int;
      
      public var MAINQUESTREWARD:Array = new Array(MAX_QUESTREWARD);
      
      public var nSubQuest1Index:int;
      
      public var SUBQUEST1VALUE:Array = new Array(MAX_QUESTVALUE);
      
      public var nSubQuest1Icon:int;
      
      public var SUBQUEST1REWARD:Array = new Array(MAX_QUESTREWARD);
      
      public var nSubQuest2Index:int;
      
      public var SUBQUEST2VALUE:Array = new Array(MAX_QUESTVALUE);
      
      public var nSubQuest2Icon:int;
      
      public var SUBQUEST2REWARD:Array = new Array(MAX_QUESTREWARD);
      
      public function QuestDB()
      {
         super();
      }
   }
}

