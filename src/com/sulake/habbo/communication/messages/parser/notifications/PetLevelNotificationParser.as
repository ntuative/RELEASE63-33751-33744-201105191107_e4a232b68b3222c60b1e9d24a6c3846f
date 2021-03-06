package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1692:int;
      
      private var var_2448:String;
      
      private var var_1097:int;
      
      private var var_1219:int;
      
      private var var_1840:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1692 = param1.readInteger();
         this.var_2448 = param1.readString();
         this.var_1097 = param1.readInteger();
         this.var_1219 = param1.readInteger();
         this.var_1840 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1692;
      }
      
      public function get petName() : String
      {
         return this.var_2448;
      }
      
      public function get level() : int
      {
         return this.var_1097;
      }
      
      public function get petType() : int
      {
         return this.var_1219;
      }
      
      public function get breed() : int
      {
         return this.var_1840;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
