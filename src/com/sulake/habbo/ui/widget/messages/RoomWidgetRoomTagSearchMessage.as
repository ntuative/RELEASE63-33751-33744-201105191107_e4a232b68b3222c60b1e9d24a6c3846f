package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_874:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_2284:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_874);
         this.var_2284 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2284;
      }
   }
}
