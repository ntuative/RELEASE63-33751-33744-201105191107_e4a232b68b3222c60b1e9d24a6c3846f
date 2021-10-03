package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetSpamWallPostItFinishEditingMessage extends RoomWidgetMessage
   {
      
      public static const const_799:String = "RWSWPFEE_SEND_POSTIT_DATA";
       
      
      private var var_217:int;
      
      private var var_431:String;
      
      private var _text:String;
      
      private var var_333:String;
      
      public function RoomWidgetSpamWallPostItFinishEditingMessage(param1:String, param2:int, param3:String, param4:String, param5:String)
      {
         super(param1);
         this.var_217 = param2;
         this.var_431 = param3;
         this._text = param4;
         this.var_333 = param5;
      }
      
      public function get location() : String
      {
         return this.var_431;
      }
      
      public function get objectId() : int
      {
         return this.var_217;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get colorHex() : String
      {
         return this.var_333;
      }
   }
}
