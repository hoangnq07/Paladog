package com.fazecat.web.paladog
{
   import flash.display.*;
   import flash.events.*;
   import flash.media.*;
   import flash.text.*;
   import flash.utils.*;
   
   public class Animation
   {
      
      private var draw:Drawing;
      
      public var nBmpCount:int;
      
      public var nTotalAniData:int;
      
      public var nAniFrame:int;
      
      public var nDelayFrame:int;
      
      public var imgData:Array = new Array();
      
      public var aniData:Array = new Array();
      
      public function Animation(param1:Drawing)
      {
         super();
         this.draw = param1;
      }
      
      public function initBmpData() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.nBmpCount)
         {
            this.imgData[_loc1_] = new ImgData();
            _loc1_++;
         }
      }
      
      public function initAniData() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.nTotalAniData)
         {
            this.aniData[_loc1_] = new AniData();
            _loc1_++;
         }
      }
      
      public function initFrameData(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.aniData[param1].nTotalFrame)
         {
            this.aniData[param1].frameData[_loc2_] = new FrameData();
            _loc2_++;
         }
      }
   }
}

