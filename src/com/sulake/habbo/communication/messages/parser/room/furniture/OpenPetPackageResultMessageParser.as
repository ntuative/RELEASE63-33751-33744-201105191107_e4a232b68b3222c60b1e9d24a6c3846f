package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_217:int = 0;
      
      private var var_1675:int = 0;
      
      private var var_1674:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_217;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1675;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1674;
      }
      
      public function flush() : Boolean
      {
         this.var_217 = 0;
         this.var_1675 = 0;
         this.var_1674 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_217 = param1.readInteger();
         this.var_1675 = param1.readInteger();
         this.var_1674 = param1.readString();
         return true;
      }
   }
}
