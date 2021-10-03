package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class Icon implements IDisposable
   {
      
      protected static const const_2199:int = 0;
      
      protected static const const_635:int = 1;
      
      protected static const const_1930:int = 2;
      
      protected static const const_1931:int = 3;
      
      protected static const const_116:int = 4;
      
      protected static const const_634:int = 8;
      
      protected static const const_281:int = 18;
      
      protected static const const_1932:int = 18;
       
      
      private var _disposed:Boolean = false;
      
      private var var_2076:Boolean = false;
      
      protected var var_46:BitmapDataAsset;
      
      protected var var_86:IBitmapWrapperWindow;
      
      private var var_1333:uint;
      
      protected var var_200:Timer;
      
      protected var _frame:int = 0;
      
      private var var_694:Point;
      
      protected var var_878:Boolean = false;
      
      protected var _hover:Boolean = false;
      
      public function Icon()
      {
         this.var_1333 = const_635 | const_634;
         this.var_694 = new Point();
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get disabled() : Boolean
      {
         return this.var_2076;
      }
      
      protected function set image(param1:BitmapDataAsset) : void
      {
         this.var_46 = param1;
         this.redraw();
      }
      
      protected function get image() : BitmapDataAsset
      {
         return this.var_46;
      }
      
      protected function set canvas(param1:IBitmapWrapperWindow) : void
      {
         this.var_86 = param1;
         this.redraw();
      }
      
      protected function get canvas() : IBitmapWrapperWindow
      {
         return this.var_86;
      }
      
      protected function set alignment(param1:uint) : void
      {
         this.var_1333 = param1;
         this.redraw();
      }
      
      protected function get alignment() : uint
      {
         return this.var_1333;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.toggleTimer(false,0);
            this.image = null;
            this.canvas = null;
            this._disposed = true;
         }
      }
      
      public function notify(param1:Boolean) : void
      {
         this.var_878 = param1;
         if(this.var_878 && this.var_2076)
         {
            this.enable(true);
         }
      }
      
      public function hover(param1:Boolean) : void
      {
         this._hover = param1;
      }
      
      public function enable(param1:Boolean) : void
      {
         this.var_2076 = !param1;
      }
      
      protected function redraw() : void
      {
         var _loc1_:* = null;
         if(this.var_86 && !this.var_86.disposed)
         {
            if(!this.var_86.bitmap)
            {
               this.var_86.bitmap = new BitmapData(this.var_86.width,this.var_86.height,true,0);
            }
            else
            {
               this.var_86.bitmap.fillRect(this.var_86.bitmap.rect,0);
            }
            if(this.var_46 && !this.var_46.disposed)
            {
               this.var_694.x = this.var_694.y = 0;
               _loc1_ = this.var_46.content as BitmapData;
               switch(this.var_1333 & const_1931)
               {
                  case const_635:
                     this.var_694.x = this.var_86.bitmap.width / 2 - _loc1_.width / 2;
                     break;
                  case const_1930:
                     this.var_694.x = this.var_86.bitmap.width - _loc1_.width;
               }
               switch(this.var_1333 & const_1932)
               {
                  case const_634:
                     this.var_694.y = this.var_86.bitmap.height / 2 - _loc1_.height / 2;
                     break;
                  case const_281:
                     this.var_694.y = this.var_86.bitmap.height - _loc1_.height;
               }
               this.var_86.bitmap.copyPixels(_loc1_,_loc1_.rect,this.var_694);
               this.var_86.invalidate();
            }
         }
      }
      
      protected function toggleTimer(param1:Boolean, param2:int) : void
      {
         if(param1)
         {
            if(!this.var_200)
            {
               this.var_200 = new Timer(param2,0);
               this.var_200.addEventListener(TimerEvent.TIMER,this.onTimerEvent);
               this.var_200.start();
               this.onTimerEvent(null);
            }
            this.var_200.delay = param2;
         }
         else
         {
            this._frame = 0;
            if(this.var_200)
            {
               this.var_200.reset();
               this.var_200.removeEventListener(TimerEvent.TIMER,this.onTimerEvent);
               this.var_200 = null;
            }
         }
      }
      
      protected function onTimerEvent(param1:TimerEvent) : void
      {
      }
   }
}
