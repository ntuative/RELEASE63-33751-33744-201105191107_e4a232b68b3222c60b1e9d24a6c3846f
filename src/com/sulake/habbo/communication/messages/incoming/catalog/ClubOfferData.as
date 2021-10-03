package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1109:int;
      
      private var var_1705:String;
      
      private var var_1680:int;
      
      private var _upgrade:Boolean;
      
      private var var_2312:Boolean;
      
      private var var_2308:int;
      
      private var var_2307:int;
      
      private var var_2306:int;
      
      private var var_2310:int;
      
      private var var_2309:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1109 = param1.readInteger();
         this.var_1705 = param1.readString();
         this.var_1680 = param1.readInteger();
         this._upgrade = param1.readBoolean();
         this.var_2312 = param1.readBoolean();
         this.var_2308 = param1.readInteger();
         this.var_2307 = param1.readInteger();
         this.var_2306 = param1.readInteger();
         this.var_2310 = param1.readInteger();
         this.var_2309 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1109;
      }
      
      public function get productCode() : String
      {
         return this.var_1705;
      }
      
      public function get price() : int
      {
         return this.var_1680;
      }
      
      public function get upgrade() : Boolean
      {
         return this._upgrade;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2312;
      }
      
      public function get periods() : int
      {
         return this.var_2308;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2307;
      }
      
      public function get year() : int
      {
         return this.var_2306;
      }
      
      public function get month() : int
      {
         return this.var_2310;
      }
      
      public function get day() : int
      {
         return this.var_2309;
      }
   }
}
