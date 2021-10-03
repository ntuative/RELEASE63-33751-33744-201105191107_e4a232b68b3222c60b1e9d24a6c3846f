package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2235:int;
      
      private var var_2554:int;
      
      private var var_2556:int;
      
      private var _dayOffsets:Array;
      
      private var var_1872:Array;
      
      private var var_1871:Array;
      
      private var var_2555:int;
      
      private var var_2557:int;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2235 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2554 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2556 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1872 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1871 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2555 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2557 = param1;
      }
   }
}
