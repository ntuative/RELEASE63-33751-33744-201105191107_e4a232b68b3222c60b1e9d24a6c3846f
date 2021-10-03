package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1620:int = 1;
      
      public static const const_2119:int = 2;
      
      public static const const_1856:int = 3;
      
      public static const const_1657:int = 4;
       
      
      private var var_1417:int = 0;
      
      private var var_1418:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1417 = 0;
         this.var_1418 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1417 = param1.readInteger();
         if(this.var_1417 == 3)
         {
            this.var_1418 = param1.readString();
         }
         else
         {
            this.var_1418 = "";
         }
         return true;
      }
      
      public function get reason() : int
      {
         return this.var_1417;
      }
      
      public function get parameter() : String
      {
         return this.var_1418;
      }
   }
}
