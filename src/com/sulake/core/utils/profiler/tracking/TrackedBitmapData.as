package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      public static const const_2007:int = 16777215;
      
      public static const const_1273:int = 8191;
      
      public static const const_1173:int = 8191;
      
      public static const const_2154:int = 1;
      
      public static const const_1147:int = 1;
      
      public static const const_1236:int = 1;
      
      private static var var_502:uint = 0;
      
      private static var var_503:uint = 0;
       
      
      private var _owner:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         if(param2 > const_1273)
         {
            param2 = const_1273;
         }
         else if(param2 < const_1147)
         {
            param2 = const_1147;
         }
         if(param3 > const_1173)
         {
            param3 = const_1173;
         }
         else if(param3 < const_1236)
         {
            param3 = const_1236;
         }
         super(param2,param3,param4,param5);
         ++var_502;
         var_503 += param2 * param3 * 4;
         this._owner = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_502;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_503;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_503 -= width * height * 4;
            --var_502;
            this._disposed = true;
            this._owner = null;
            super.dispose();
         }
      }
   }
}
