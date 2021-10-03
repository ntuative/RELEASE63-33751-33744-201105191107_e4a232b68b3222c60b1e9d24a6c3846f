package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_1558:Number = 12;
       
      
      private var var_2826:int = -1;
      
      private var var_2829:int = -2;
      
      private var var_214:Vector3d = null;
      
      private var var_1311:Number = 0;
      
      private var var_1596:Number = 0;
      
      private var var_2054:Boolean = false;
      
      private var var_194:Vector3d = null;
      
      private var var_2051:Vector3d;
      
      private var var_2832:Boolean = false;
      
      private var var_2830:Boolean = false;
      
      private var var_2833:Boolean = false;
      
      private var var_2827:Boolean = false;
      
      private var var_2834:int = 0;
      
      private var var_2835:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2831:int = 0;
      
      private var var_2828:int = 0;
      
      private var var_1629:int = -1;
      
      private var var_2052:int = 0;
      
      private var var_2053:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_2051 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_194;
      }
      
      public function get targetId() : int
      {
         return this.var_2826;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2829;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_2051;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2832;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2830;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2833;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2827;
      }
      
      public function get screenWd() : int
      {
         return this.var_2834;
      }
      
      public function get screenHt() : int
      {
         return this.var_2835;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2831;
      }
      
      public function get roomHt() : int
      {
         return this.var_2828;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1629;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_214 != null && this.var_194 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2826 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_2051.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2829 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2832 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2830 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2833 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2827 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2834 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2835 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_2053 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2831 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2828 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1629 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         var _loc2_:* = null;
         if(this.var_214 == null)
         {
            this.var_214 = new Vector3d();
         }
         if(this.var_214.x != param1.x || this.var_214.y != param1.y || this.var_214.z != param1.z)
         {
            this.var_214.assign(param1);
            this.var_2052 = 0;
            _loc2_ = Vector3d.dif(this.var_214,this.var_194);
            this.var_1311 = _loc2_.length;
            this.var_2054 = true;
         }
      }
      
      public function dispose() : void
      {
         this.var_214 = null;
         this.var_194 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_194 != null)
         {
            return;
         }
         this.var_194 = new Vector3d();
         this.var_194.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_194 == null)
         {
            this.var_194 = new Vector3d();
         }
         this.var_194.assign(param1);
      }
      
      public function update(param1:uint, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.var_214 != null && this.var_194 != null)
         {
            ++this.var_2052;
            if(this.var_2053)
            {
               this.var_2053 = false;
               this.var_194 = this.var_214;
               this.var_214 = null;
               return;
            }
            _loc3_ = Vector3d.dif(this.var_214,this.var_194);
            if(_loc3_.length > this.var_1311)
            {
               this.var_1311 = _loc3_.length;
            }
            if(_loc3_.length <= param2)
            {
               this.var_194 = this.var_214;
               this.var_214 = null;
               this.var_1596 = 0;
            }
            else
            {
               _loc4_ = Math.sin(0 * _loc3_.length / this.var_1311);
               _loc5_ = param2 * 0.5;
               _loc6_ = this.var_1311 / const_1558;
               _loc7_ = _loc5_ + (_loc6_ - _loc5_) * _loc4_;
               if(this.var_2054)
               {
                  if(_loc7_ < this.var_1596)
                  {
                     _loc7_ = this.var_1596;
                     if(_loc7_ > _loc3_.length)
                     {
                        _loc7_ = _loc3_.length;
                     }
                  }
                  else
                  {
                     this.var_2054 = false;
                  }
               }
               this.var_1596 = _loc7_;
               _loc3_.div(_loc3_.length);
               _loc3_.mul(_loc7_);
               this.var_194 = Vector3d.sum(this.var_194,_loc3_);
            }
         }
      }
      
      public function reset() : void
      {
         this.var_1629 = -1;
      }
   }
}
