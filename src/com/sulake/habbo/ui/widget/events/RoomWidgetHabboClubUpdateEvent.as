package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_285:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2581:int = 0;
      
      private var var_2580:int = 0;
      
      private var var_2579:int = 0;
      
      private var var_2582:Boolean = false;
      
      private var var_2278:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_285,param6,param7);
         this.var_2581 = param1;
         this.var_2580 = param2;
         this.var_2579 = param3;
         this.var_2582 = param4;
         this.var_2278 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2581;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2580;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2579;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2582;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2278;
      }
   }
}
