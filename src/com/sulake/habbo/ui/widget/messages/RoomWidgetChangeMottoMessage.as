package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChangeMottoMessage extends RoomWidgetMessage
   {
      
      public static const const_896:String = "RWVM_CHANGE_MOTTO_MESSAGE";
       
      
      private var var_1820:String;
      
      public function RoomWidgetChangeMottoMessage(param1:String)
      {
         super(const_896);
         this.var_1820 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1820;
      }
   }
}
