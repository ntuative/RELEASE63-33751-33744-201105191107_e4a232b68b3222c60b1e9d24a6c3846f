package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_926:Array;
      
      private var var_2394:String;
      
      private var var_2396:String;
      
      private var var_2395:String;
      
      private var _index:int;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param6,param7);
         this.var_926 = param1;
         this.var_2394 = param2;
         this.var_2396 = param3;
         this.var_2395 = param4;
         this._index = param5;
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
      
      public function get index() : int
      {
         return this._index;
      }
   }
}
