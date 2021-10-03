package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const const_50:String = "HTE_TOOLBAR_CLICK";
       
      
      private var var_2036:String;
      
      private var var_2229:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set iconId(param1:String) : void
      {
         this.var_2036 = param1;
      }
      
      public function get iconId() : String
      {
         return this.var_2036;
      }
      
      public function set iconName(param1:String) : void
      {
         this.var_2229 = param1;
      }
      
      public function get iconName() : String
      {
         return this.var_2229;
      }
   }
}
