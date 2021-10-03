package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1644:int = 0;
      
      private var var_1643:int = 0;
      
      private var var_2848:int = 0;
      
      private var var_2849:Boolean = false;
      
      private var var_2195:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1644 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1643 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2848 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2849 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2195 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1644;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1643;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2848;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2849;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2195;
      }
   }
}
