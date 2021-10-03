package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1217:Boolean;
      
      private var var_1218:Boolean;
      
      private var var_1470:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1217;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1218;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1470;
      }
      
      public function flush() : Boolean
      {
         this.var_1217 = false;
         this.var_1218 = false;
         this.var_1470 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1217 = param1.readBoolean();
         this.var_1218 = param1.readBoolean();
         this.var_1470 = param1.readBoolean();
         return true;
      }
   }
}
