package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_144:String = "ROE_MOUSE_CLICK";
      
      public static const const_174:String = "ROE_MOUSE_ENTER";
      
      public static const const_602:String = "ROE_MOUSE_MOVE";
      
      public static const const_186:String = "ROE_MOUSE_LEAVE";
      
      public static const const_2040:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_509:String = "ROE_MOUSE_DOWN";
       
      
      private var var_2018:String = "";
      
      private var var_2483:Boolean;
      
      private var var_2478:Boolean;
      
      private var var_2481:Boolean;
      
      private var var_2482:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_2018 = param2;
         this.var_2483 = param5;
         this.var_2478 = param6;
         this.var_2481 = param7;
         this.var_2482 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_2018;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2483;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2478;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2481;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2482;
      }
   }
}
