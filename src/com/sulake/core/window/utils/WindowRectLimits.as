package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_300:int = -2.147483648E9;
      
      private var var_298:int = 2.147483647E9;
      
      private var var_301:int = -2.147483648E9;
      
      private var var_299:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         this._target = param1;
      }
      
      public function get minWidth() : int
      {
         return this.var_300;
      }
      
      public function get maxWidth() : int
      {
         return this.var_298;
      }
      
      public function get minHeight() : int
      {
         return this.var_301;
      }
      
      public function get maxHeight() : int
      {
         return this.var_299;
      }
      
      public function set minWidth(param1:int) : void
      {
         this.var_300 = param1;
         if(this.var_300 > int.MIN_VALUE && !this._target.disposed && this._target.width < this.var_300)
         {
            this._target.width = this.var_300;
         }
      }
      
      public function set maxWidth(param1:int) : void
      {
         this.var_298 = param1;
         if(this.var_298 < int.MAX_VALUE && !this._target.disposed && this._target.width > this.var_298)
         {
            this._target.width = this.var_298;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         this.var_301 = param1;
         if(this.var_301 > int.MIN_VALUE && !this._target.disposed && this._target.height < this.var_301)
         {
            this._target.height = this.var_301;
         }
      }
      
      public function set maxHeight(param1:int) : void
      {
         this.var_299 = param1;
         if(this.var_299 < int.MAX_VALUE && !this._target.disposed && this._target.height > this.var_299)
         {
            this._target.height = this.var_299;
         }
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_300 == int.MIN_VALUE && this.var_298 == int.MAX_VALUE && this.var_301 == int.MIN_VALUE && this.var_299 == int.MAX_VALUE;
      }
      
      public function setEmpty() : void
      {
         this.var_300 = int.MIN_VALUE;
         this.var_298 = int.MAX_VALUE;
         this.var_301 = int.MIN_VALUE;
         this.var_299 = int.MAX_VALUE;
      }
      
      public function limit() : void
      {
         if(!this.isEmpty && this._target)
         {
            if(this._target.width < this.var_300)
            {
               this._target.width = this.var_300;
            }
            else if(this._target.width > this.var_298)
            {
               this._target.width = this.var_298;
            }
            if(this._target.height < this.var_301)
            {
               this._target.height = this.var_301;
            }
            else if(this._target.height > this.var_299)
            {
               this._target.height = this.var_299;
            }
         }
      }
      
      public function assign(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.var_300 = param1;
         this.var_298 = param2;
         this.var_301 = param3;
         this.var_299 = param4;
         this.limit();
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_300 = this.var_300;
         _loc2_.var_298 = this.var_298;
         _loc2_.var_301 = this.var_301;
         _loc2_.var_299 = this.var_299;
         return _loc2_;
      }
   }
}
