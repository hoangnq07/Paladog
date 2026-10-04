package com.fazecat.web.paladog
{
   public class DestinyIcon
   {
      
      public static const ARRIVE_POS:int = 24;
      
      public static const ICON_MACE:int = 0;
      
      public static const ICON_UNIT:int = 1;
      
      public static const ICON_WIDTH:int = 77;
      
      public static const ICON_HEIGHT:int = 79;
      
      private var draw:Drawing;
      
      public var nType:int;
      
      public var nKind:int;
      
      public var nPosX:int;
      
      public var nPosY:int;
      
      public var bAppear:Boolean;
      
      public var bMove:Boolean;
      
      public function DestinyIcon(param1:Drawing)
      {
         super();
         this.draw = param1;
      }
   }
}

