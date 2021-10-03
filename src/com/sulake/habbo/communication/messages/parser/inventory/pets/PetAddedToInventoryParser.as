package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetAddedToInventoryParser implements IMessageParser
   {
       
      
      private var var_951:PetData;
      
      private var var_2616:Boolean;
      
      public function PetAddedToInventoryParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_951 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_951 = new PetData(param1);
         this.var_2616 = param1.readBoolean();
         return true;
      }
      
      public function get pet() : PetData
      {
         return this.var_951;
      }
      
      public function get purchased() : Boolean
      {
         return this.var_2616;
      }
   }
}
