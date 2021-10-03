package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_915:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_329:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_915);
         this.var_329 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_329;
      }
   }
}
