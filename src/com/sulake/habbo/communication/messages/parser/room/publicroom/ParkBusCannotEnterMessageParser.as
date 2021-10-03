package com.sulake.habbo.communication.messages.parser.room.publicroom
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ParkBusCannotEnterMessageParser implements IMessageParser
   {
       
      
      private var var_1417:String = "";
      
      public function ParkBusCannotEnterMessageParser()
      {
         super();
      }
      
      public function get reason() : String
      {
         return this.var_1417;
      }
      
      public function flush() : Boolean
      {
         this.var_1417 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1417 = param1.readString();
         return true;
      }
   }
}
