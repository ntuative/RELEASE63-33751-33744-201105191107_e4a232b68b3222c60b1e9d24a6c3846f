package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_64:String = "i";
      
      public static const const_83:String = "s";
      
      public static const const_220:String = "e";
       
      
      private var var_1527:String;
      
      private var var_2764:int;
      
      private var var_1251:String;
      
      private var var_1528:int;
      
      private var var_1932:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1527 = param1.readString();
         this.var_2764 = param1.readInteger();
         this.var_1251 = param1.readString();
         this.var_1528 = param1.readInteger();
         this.var_1932 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1527;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2764;
      }
      
      public function get extraParam() : String
      {
         return this.var_1251;
      }
      
      public function get productCount() : int
      {
         return this.var_1528;
      }
      
      public function get expiration() : int
      {
         return this.var_1932;
      }
   }
}
