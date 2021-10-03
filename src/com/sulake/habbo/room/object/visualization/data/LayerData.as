package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_820:String = "";
      
      public static const const_423:int = 0;
      
      public static const const_484:int = 255;
      
      public static const const_867:Boolean = false;
      
      public static const const_528:int = 0;
      
      public static const const_561:int = 0;
      
      public static const const_439:int = 0;
      
      public static const const_1212:int = 1;
      
      public static const const_1238:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2284:String = "";
      
      private var var_1822:int = 0;
      
      private var var_2287:int = 255;
      
      private var var_2334:Boolean = false;
      
      private var var_2336:int = 0;
      
      private var var_2335:int = 0;
      
      private var var_2337:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2284 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2284;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1822 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1822;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2287 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2287;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2334 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2334;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2336 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2336;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2335 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2335;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2337 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2337;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
