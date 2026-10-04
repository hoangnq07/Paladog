package com.fazecat.web.paladog
{
   public class DestinyDB
   {
      
      public static const MAX_APPEARDATAKIND:int = 5;
      
      public var strStageName:String;
      
      public var nTableID:int;
      
      public var nFileVersion:Number;
      
      public var nCreateTime:int;
      
      public var APPEARDATAKIND:Array = new Array(MAX_APPEARDATAKIND);
      
      public var APPEARDATACHANCE:Array = new Array(MAX_APPEARDATAKIND);
      
      public function DestinyDB()
      {
         super();
      }
   }
}

