package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserChangeMessageParser implements IMessageParser
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var _id:int;
      
      private var var_618:String;
      
      private var var_913:String;
      
      private var var_1719:String;
      
      private var var_2262:int;
      
      public function UserChangeMessageParser()
      {
         super();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get figure() : String
      {
         return this.var_618;
      }
      
      public function get sex() : String
      {
         return this.var_913;
      }
      
      public function get customInfo() : String
      {
         return this.var_1719;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2262;
      }
      
      public function flush() : Boolean
      {
         this._id = 0;
         this.var_618 = "";
         this.var_913 = "";
         this.var_1719 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = param1.readInteger();
         this.var_618 = param1.readString();
         this.var_913 = param1.readString();
         this.var_1719 = param1.readString();
         this.var_2262 = param1.readInteger();
         if(this.var_913)
         {
            this.var_913 = this.var_913.toUpperCase();
         }
         return true;
      }
   }
}
