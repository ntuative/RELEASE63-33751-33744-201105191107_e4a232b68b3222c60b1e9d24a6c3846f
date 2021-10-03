package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_1109:int;
      
      private var var_1985:String;
      
      private var var_1276:int;
      
      private var var_1277:int;
      
      private var var_1984:int;
      
      private var var_1215:Array;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1109 = param1.readInteger();
         this.var_1985 = param1.readString();
         this.var_1276 = param1.readInteger();
         this.var_1277 = param1.readInteger();
         this.var_1984 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1215 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1215.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
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
      
      public function get products() : Array
      {
         return this.var_1215;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1984;
      }
   }
}
