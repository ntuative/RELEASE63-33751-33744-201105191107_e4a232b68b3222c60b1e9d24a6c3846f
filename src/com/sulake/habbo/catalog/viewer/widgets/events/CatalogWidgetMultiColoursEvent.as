package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetMultiColoursEvent extends Event
   {
       
      
      private var var_926:Array;
      
      private var var_2394:String;
      
      private var var_2396:String;
      
      private var var_2395:String;
      
      public function CatalogWidgetMultiColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_MULTI_COLOUR_ARRAY,param5,param6);
         this.var_926 = param1;
         this.var_2394 = param2;
         this.var_2396 = param3;
         this.var_2395 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_926;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2394;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2396;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2395;
      }
   }
}
