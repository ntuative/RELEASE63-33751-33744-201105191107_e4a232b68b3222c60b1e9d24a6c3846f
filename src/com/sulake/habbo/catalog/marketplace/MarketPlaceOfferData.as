package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData implements IMarketPlaceOfferData
   {
      
      public static const const_112:int = 1;
      
      public static const const_73:int = 2;
       
      
      private var var_1109:int;
      
      private var _furniId:int;
      
      private var var_2233:int;
      
      private var var_2140:String;
      
      private var var_1680:int;
      
      private var var_2235:int;
      
      private var var_2232:int;
      
      private var var_403:int;
      
      private var var_2234:int = -1;
      
      private var var_1681:int;
      
      private var var_46:BitmapData;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this.var_1109 = param1;
         this._furniId = param2;
         this.var_2233 = param3;
         this.var_2140 = param4;
         this.var_1680 = param5;
         this.var_403 = param6;
         this.var_2235 = param7;
         this.var_1681 = param8;
      }
      
      public function dispose() : void
      {
         if(this.var_46)
         {
            this.var_46.dispose();
            this.var_46 = null;
         }
      }
      
      public function get offerId() : int
      {
         return this.var_1109;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2233;
      }
      
      public function get stuffData() : String
      {
         return this.var_2140;
      }
      
      public function get price() : int
      {
         return this.var_1680;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2235;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_46 != null)
         {
            this.var_46.dispose();
         }
         this.var_46 = param1;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_2232 = param1;
      }
      
      public function get imageCallback() : int
      {
         return this.var_2232;
      }
      
      public function get status() : int
      {
         return this.var_403;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2234;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_2234 = param1;
      }
      
      public function set price(param1:int) : void
      {
         this.var_1680 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this.var_1109 = param1;
      }
      
      public function get offerCount() : int
      {
         return this.var_1681;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1681 = param1;
      }
   }
}
