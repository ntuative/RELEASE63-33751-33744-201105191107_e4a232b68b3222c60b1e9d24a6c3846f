package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1652:int;
      
      private var var_1707:Number;
      
      private var var_2292:Number;
      
      private var var_2293:int;
      
      private var var_2290:Number;
      
      private var var_2291:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1652 = param1;
         this.var_1707 = param2;
         this.var_2292 = param3;
         this.var_2290 = param4;
         this.var_2291 = param5;
         this.var_2293 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1652;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1707 < 0)
         {
            return 0;
         }
         return this.var_1707 + (getTimer() - this.var_2293) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2292;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2290;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2291;
      }
   }
}
