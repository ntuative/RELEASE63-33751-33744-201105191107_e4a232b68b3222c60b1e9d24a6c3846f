package com.sulake.habbo.communication.messages.parser.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CheckUserNameResultMessageParser implements IMessageParser
   {
       
      
      private var var_1718:int = -1;
      
      private var _name:String;
      
      private var var_1414:Array;
      
      public function CheckUserNameResultMessageParser()
      {
         super();
      }
      
      public function get resultCode() : int
      {
         return this.var_1718;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get nameSuggestions() : Array
      {
         return this.var_1414;
      }
      
      public function flush() : Boolean
      {
         this.var_1718 = -1;
         this._name = "";
         this.var_1414 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1718 = param1.readInteger();
         this._name = param1.readString();
         var _loc2_:int = param1.readInteger();
         this.var_1414 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1414.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
   }
}
