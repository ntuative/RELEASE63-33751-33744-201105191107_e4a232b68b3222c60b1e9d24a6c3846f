package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2687:String;
      
      private var var_2688:Class;
      
      private var var_2686:Class;
      
      private var var_1945:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2687 = param1;
         this.var_2688 = param2;
         this.var_2686 = param3;
         if(rest == null)
         {
            this.var_1945 = new Array();
         }
         else
         {
            this.var_1945 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2687;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2688;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2686;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1945;
      }
   }
}
