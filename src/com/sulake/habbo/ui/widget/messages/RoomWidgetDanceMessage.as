package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDanceMessage extends RoomWidgetMessage
   {
      
      public static const const_861:String = "RWCM_MESSAGE_DANCE";
      
      public static const const_1241:int = 0;
      
      public static const const_1839:Array = [2,3,4];
       
      
      private var var_82:int = 0;
      
      public function RoomWidgetDanceMessage(param1:int)
      {
         super(const_861);
         this.var_82 = param1;
      }
      
      public function get style() : int
      {
         return this.var_82;
      }
   }
}
