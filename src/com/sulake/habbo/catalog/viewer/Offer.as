package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1909:String = "pricing_model_unknown";
      
      public static const const_411:String = "pricing_model_single";
      
      public static const const_418:String = "pricing_model_multi";
      
      public static const const_531:String = "pricing_model_bundle";
      
      public static const const_1629:String = "price_type_none";
      
      public static const const_971:String = "price_type_credits";
      
      public static const const_1230:String = "price_type_activitypoints";
      
      public static const const_1186:String = "price_type_credits_and_activitypoints";
       
      
      private var var_833:String;
      
      private var var_1275:String;
      
      private var var_1109:int;
      
      private var var_1985:String;
      
      private var var_1276:int;
      
      private var var_1277:int;
      
      private var var_1984:int;
      
      private var var_379:ICatalogPage;
      
      private var var_669:IProductContainer;
      
      private var _disposed:Boolean = false;
      
      private var var_2738:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:Array, param7:ICatalogPage)
      {
         super();
         this.var_1109 = param1;
         this.var_1985 = param2;
         this.var_1276 = param3;
         this.var_1277 = param4;
         this.var_1984 = param5;
         this.var_379 = param7;
         this.analyzePricingModel(param6);
         this.analyzePriceType();
         this.createProductContainer(param6);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_379;
      }
      
      public function get offerId() : int
      {
         return this.var_1109;
      }
      
      public function get localizationId() : String
      {
         return this.var_1985;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1276;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1277;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1984;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_669;
      }
      
      public function get pricingModel() : String
      {
         return this.var_833;
      }
      
      public function get priceType() : String
      {
         return this.var_1275;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2738;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2738 = param1;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1109 = 0;
         this.var_1985 = "";
         this.var_1276 = 0;
         this.var_1277 = 0;
         this.var_1984 = 0;
         this.var_379 = null;
         if(this.var_669 != null)
         {
            this.var_669.dispose();
            this.var_669 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_833)
         {
            case const_411:
               this.var_669 = new SingleProductContainer(this,param1);
               break;
            case const_418:
               this.var_669 = new MultiProductContainer(this,param1);
               break;
            case const_531:
               this.var_669 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_833);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_833 = const_411;
            }
            else
            {
               this.var_833 = const_418;
            }
         }
         else if(param1.length > 1)
         {
            this.var_833 = const_531;
         }
         else
         {
            this.var_833 = const_1909;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1276 > 0 && this.var_1277 > 0)
         {
            this.var_1275 = const_1186;
         }
         else if(this.var_1276 > 0)
         {
            this.var_1275 = const_971;
         }
         else if(this.var_1277 > 0)
         {
            this.var_1275 = const_1230;
         }
         else
         {
            this.var_1275 = const_1629;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_379.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_669.products)
         {
            _loc4_ = this.var_379.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,_loc1_,this.page);
      }
   }
}
