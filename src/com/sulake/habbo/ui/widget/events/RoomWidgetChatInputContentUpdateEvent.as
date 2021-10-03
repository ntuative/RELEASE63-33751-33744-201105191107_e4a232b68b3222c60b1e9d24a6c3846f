package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetChatInputContentUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_722:String = "RWWCIDE_CHAT_INPUT_CONTENT";
      
      public static const const_1178:String = "whisper";
      
      public static const const_1859:String = "shout";
       
      
      private var var_2221:String = "";
      
      private var _userName:String = "";
      
      public function RoomWidgetChatInputContentUpdateEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_722,param3,param4);
         this.var_2221 = param1;
         this._userName = param2;
      }
      
      public function get messageType() : String
      {
         return this.var_2221;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
   }
}
