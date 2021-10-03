package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2235:int;
      
      private var var_2554:int;
      
      private var var_2556:int;
      
      private var _dayOffsets:Array;
      
      private var var_1872:Array;
      
      private var var_1871:Array;
      
      private var var_2555:int;
      
      private var var_2557:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2235;
      }
      
      public function get offerCount() : int
      {
         return this.var_2554;
      }
      
      public function get historyLength() : int
      {
         return this.var_2556;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1872;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1871;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2555;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2557;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2235 = param1.readInteger();
         this.var_2554 = param1.readInteger();
         this.var_2556 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1872 = [];
         this.var_1871 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1872.push(param1.readInteger());
            this.var_1871.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2557 = param1.readInteger();
         this.var_2555 = param1.readInteger();
         return true;
      }
   }
}
