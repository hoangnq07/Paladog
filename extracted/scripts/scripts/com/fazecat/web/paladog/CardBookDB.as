package com.fazecat.web.paladog
{
   public class CardBookDB
   {
      
      public static const MAX_SETNUM:int = 3;
      
      public var nSetIndex:int;
      
      public var strCardSetName:String;
      
      public var nCardIndex:Array = new Array(MAX_SETNUM);
      
      public var nCardNum:Array = new Array(MAX_SETNUM);
      
      public var strRewardName:String;
      
      public var nRewardNum:int;
      
      public function CardBookDB()
      {
         super();
      }
   }
}

