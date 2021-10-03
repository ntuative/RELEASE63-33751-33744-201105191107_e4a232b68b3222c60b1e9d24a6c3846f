package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1438:Boolean;
      
      private var var_2679:int;
      
      private var var_1941:int;
      
      private var var_1942:int;
      
      private var var_2681:int;
      
      private var var_2680:int;
      
      private var var_2682:int;
      
      private var var_2609:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1438;
      }
      
      public function get commission() : int
      {
         return this.var_2679;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1941;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1942;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2680;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2681;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2682;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2609;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1438 = param1.readBoolean();
         this.var_2679 = param1.readInteger();
         this.var_1941 = param1.readInteger();
         this.var_1942 = param1.readInteger();
         this.var_2680 = param1.readInteger();
         this.var_2681 = param1.readInteger();
         this.var_2682 = param1.readInteger();
         this.var_2609 = param1.readInteger();
         return true;
      }
   }
}
