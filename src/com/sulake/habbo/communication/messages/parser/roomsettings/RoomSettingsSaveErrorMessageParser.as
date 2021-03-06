package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_2031:int = 1;
      
      public static const const_2023:int = 2;
      
      public static const const_2065:int = 3;
      
      public static const const_2070:int = 4;
      
      public static const const_1794:int = 5;
      
      public static const const_2173:int = 6;
      
      public static const const_1821:int = 7;
      
      public static const const_1658:int = 8;
      
      public static const const_2073:int = 9;
      
      public static const const_1770:int = 10;
      
      public static const const_1876:int = 11;
      
      public static const const_1835:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1727:int;
      
      private var var_642:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1727 = param1.readInteger();
         this.var_642 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1727;
      }
      
      public function get info() : String
      {
         return this.var_642;
      }
   }
}
