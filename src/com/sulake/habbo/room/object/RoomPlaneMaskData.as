package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2171:Number = 0.0;
      
      private var var_2170:Number = 0.0;
      
      private var var_2535:Number = 0.0;
      
      private var var_2536:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2171 = param1;
         this.var_2170 = param2;
         this.var_2535 = param3;
         this.var_2536 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2171;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2170;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2535;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2536;
      }
   }
}
