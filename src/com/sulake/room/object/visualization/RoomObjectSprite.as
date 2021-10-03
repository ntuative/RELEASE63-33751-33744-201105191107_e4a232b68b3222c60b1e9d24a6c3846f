package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_1111:int = 0;
       
      
      private var var_447:BitmapData = null;
      
      private var var_2283:String = "";
      
      private var var_292:Boolean = true;
      
      private var var_2284:String = "";
      
      private var var_2287:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_1706:String;
      
      private var var_1547:Boolean = false;
      
      private var var_1546:Boolean = false;
      
      private var _offset:Point;
      
      private var var_248:int = 0;
      
      private var _height:int = 0;
      
      private var var_1205:Number = 0;
      
      private var var_2289:Boolean = false;
      
      private var var_2285:Boolean = true;
      
      private var var_2286:Boolean = false;
      
      private var _updateID:int = 0;
      
      private var var_2219:int = 0;
      
      private var var_2288:Array = null;
      
      public function RoomObjectSprite()
      {
         this.var_1706 = BlendMode.NORMAL;
         this._offset = new Point(0,0);
         super();
         this.var_2219 = var_1111++;
      }
      
      public function dispose() : void
      {
         this.var_447 = null;
         this.var_248 = 0;
         this._height = 0;
      }
      
      public function get asset() : BitmapData
      {
         return this.var_447;
      }
      
      public function get assetName() : String
      {
         return this.var_2283;
      }
      
      public function get visible() : Boolean
      {
         return this.var_292;
      }
      
      public function get tag() : String
      {
         return this.var_2284;
      }
      
      public function get alpha() : int
      {
         return this.var_2287;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function get blendMode() : String
      {
         return this.var_1706;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1546;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1547;
      }
      
      public function get offsetX() : int
      {
         return this._offset.x;
      }
      
      public function get offsetY() : int
      {
         return this._offset.y;
      }
      
      public function get width() : int
      {
         return this.var_248;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function get relativeDepth() : Number
      {
         return this.var_1205;
      }
      
      public function get varyingDepth() : Boolean
      {
         return this.var_2289;
      }
      
      public function get capturesMouse() : Boolean
      {
         return this.var_2285;
      }
      
      public function get clickHandling() : Boolean
      {
         return this.var_2286;
      }
      
      public function get instanceId() : int
      {
         return this.var_2219;
      }
      
      public function get updateId() : int
      {
         return this._updateID;
      }
      
      public function get filters() : Array
      {
         return this.var_2288;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            this.var_248 = param1.width;
            this._height = param1.height;
         }
         this.var_447 = param1;
         ++this._updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         this.var_2283 = param1;
         ++this._updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.var_292 = param1;
         ++this._updateID;
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2284 = param1;
         ++this._updateID;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         this.var_2287 = param1;
         ++this._updateID;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         this._color = param1;
         ++this._updateID;
      }
      
      public function set blendMode(param1:String) : void
      {
         this.var_1706 = param1;
         ++this._updateID;
      }
      
      public function set filters(param1:Array) : void
      {
         this.var_2288 = param1;
         ++this._updateID;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         this.var_1547 = param1;
         ++this._updateID;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         this.var_1546 = param1;
         ++this._updateID;
      }
      
      public function set offsetX(param1:int) : void
      {
         this._offset.x = param1;
         ++this._updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         this._offset.y = param1;
         ++this._updateID;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         this.var_1205 = param1;
         ++this._updateID;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         this.var_2289 = param1;
         ++this._updateID;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         this.var_2285 = param1;
         ++this._updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         this.var_2286 = param1;
         ++this._updateID;
      }
   }
}
