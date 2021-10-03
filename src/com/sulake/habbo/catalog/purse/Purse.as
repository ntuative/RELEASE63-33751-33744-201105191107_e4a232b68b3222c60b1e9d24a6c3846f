package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
       
      
      private var var_1770:int = 0;
      
      private var var_1368:Dictionary;
      
      private var var_1644:int = 0;
      
      private var var_1643:int = 0;
      
      private var var_2195:Boolean = false;
      
      private var var_2197:int = 0;
      
      private var var_2196:int = 0;
      
      public function Purse()
      {
         this.var_1368 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_1770;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_1770 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1644;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1644 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1643;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1643 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1644 > 0 || this.var_1643 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2195;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2195 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2197;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2197 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2196;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2196 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1368;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1368 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1368[param1];
      }
   }
}
