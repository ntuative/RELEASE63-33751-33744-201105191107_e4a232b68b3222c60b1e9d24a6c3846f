package com.sulake.core.assets
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class BitmapDataAsset implements ILazyAsset
   {
      
      protected static var var_574:uint = 0;
      
      protected static var var_503:uint = 0;
       
      
      private var _disposed:Boolean = false;
      
      private var var_110:Object;
      
      private var _bitmap:BitmapData;
      
      private var _offset:Point;
      
      private var var_1547:Boolean = false;
      
      private var var_1546:Boolean = false;
      
      private var var_1767:AssetTypeDeclaration;
      
      private var var_1085:String;
      
      public function BitmapDataAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         this._offset = new Point(0,0);
         super();
         this.var_1767 = param1;
         this.var_1085 = param2;
         ++var_574;
      }
      
      public static function get instances() : uint
      {
         return var_574;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_503;
      }
      
      public function get url() : String
      {
         return this.var_1085;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1547;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1546;
      }
      
      public function get offset() : Point
      {
         return this._offset;
      }
      
      public function get content() : Object
      {
         if(!this._bitmap)
         {
            this.prepareLazyContent();
         }
         return this._bitmap;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_1767;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            --var_574;
            if(this._bitmap)
            {
               try
               {
                  var_503 -= this._bitmap.width * this._bitmap.height * 4;
                  this._bitmap.dispose();
               }
               catch(e:Error)
               {
               }
            }
            this.var_110 = null;
            this._bitmap = null;
            this._offset = null;
            this.var_1767 = null;
            this.var_1085 = null;
            this._disposed = true;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         this.var_110 = param1;
         this._bitmap = null;
      }
      
      public function prepareLazyContent() : void
      {
         var _loc1_:* = null;
         if(this.var_110 == null)
         {
            return;
         }
         if(this.var_110 is Class)
         {
            _loc1_ = new this.var_110() as Bitmap;
            if(_loc1_ != null)
            {
               this._bitmap = _loc1_.bitmapData.clone();
               _loc1_.bitmapData.dispose();
               if(this._bitmap != null)
               {
                  var_503 += this._bitmap.width * this._bitmap.height * 4;
                  this.var_110 = null;
                  return;
               }
               throw new Error("Failed to convert Bitmap Class to BitmapDataAsset!");
            }
            this._bitmap = new this.var_110() as BitmapData;
            if(this._bitmap != null)
            {
               this.var_110 = null;
               return;
            }
            throw new Error("Failed to convert BitmapData Class to BitmapDataAsset!");
         }
         if(this.var_110 is Bitmap)
         {
            this._bitmap = Bitmap(this.var_110).bitmapData;
            if(this._bitmap == null)
            {
               throw new Error("Failed to convert Bitmap to BitmapDataAsset!");
            }
            this.var_110 = null;
         }
         if(this.var_110 is BitmapData)
         {
            this._bitmap = this.var_110 as BitmapData;
            if(this._bitmap != null)
            {
               this.var_110 = null;
               return;
            }
            throw new Error("Failed to convert BitmapData to BitmapDataAsset!");
         }
         if(this.var_110 is BitmapDataAsset)
         {
            this._bitmap = BitmapDataAsset(this.var_110)._bitmap;
            this._offset = BitmapDataAsset(this.var_110)._offset;
            this.var_1547 = BitmapDataAsset(this.var_110).var_1547;
            this.var_1546 = BitmapDataAsset(this.var_110).var_1546;
            if(this._bitmap != null)
            {
               this.var_110 = null;
               return;
            }
            throw new Error("Failed to read content from BitmaDataAsset!");
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is BitmapDataAsset)
         {
            this._bitmap = BitmapDataAsset(param1)._bitmap;
            this._offset = BitmapDataAsset(param1)._offset;
            return;
         }
         throw new Error("Provided asset should be of type BitmapDataAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length())
         {
            _loc3_ = param1[_loc2_].attribute("key");
            _loc4_ = param1[_loc2_].attribute("value");
            switch(_loc3_)
            {
               case "offset":
                  _loc5_ = _loc4_.split(",");
                  this._offset.x = parseInt(_loc5_[0]);
                  this._offset.y = parseInt(_loc5_[1]);
                  break;
               case "flipH":
                  this.var_1547 = _loc4_ == "1" || _loc4_ == "true";
                  break;
               case "flipV":
                  this.var_1546 = _loc4_ == "1" || _loc4_ == "true";
                  break;
            }
            _loc2_++;
         }
      }
   }
}
