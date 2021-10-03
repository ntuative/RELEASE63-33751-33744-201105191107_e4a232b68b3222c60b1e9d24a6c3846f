package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import flash.geom.Vector3D;
   
   public class FurnitureParticleSystemParticle
   {
       
      
      private var _x:Number;
      
      private var var_173:Number;
      
      private var var_174:Number;
      
      private var var_1805:Number;
      
      private var var_1807:Number;
      
      private var var_1806:Number;
      
      private var var_1192:Boolean = false;
      
      private var _direction:Vector3D;
      
      private var var_518:int = 0;
      
      private var var_952:int;
      
      private var var_2438:Boolean = false;
      
      private var var_1808:Boolean = false;
      
      private var var_1428:Number;
      
      private var _alphaMultiplier:Number = 1.0;
      
      private var _frames:Array;
      
      public function FurnitureParticleSystemParticle()
      {
         super();
      }
      
      public function get fade() : Boolean
      {
         return this.var_1808;
      }
      
      public function get alphaMultiplier() : Number
      {
         return this._alphaMultiplier;
      }
      
      public function get direction() : Vector3D
      {
         return this._direction;
      }
      
      public function get age() : int
      {
         return this.var_518;
      }
      
      public function init(param1:Number, param2:Number, param3:Number, param4:Vector3D, param5:Number, param6:Number, param7:int, param8:Boolean = false, param9:Array = null, param10:Boolean = false) : void
      {
         this._x = param1;
         this.var_173 = param2;
         this.var_174 = param3;
         this._direction = new Vector3D(param4.x,param4.y,param4.z);
         this._direction.scaleBy(param5);
         this.var_1805 = this._x - this._direction.x * param6;
         this.var_1807 = this.var_173 - this._direction.y * param6;
         this.var_1806 = this.var_174 - this._direction.z * param6;
         this.var_518 = 0;
         this.var_1192 = false;
         this.var_952 = param7;
         this.var_2438 = param8;
         this._frames = param9;
         this.var_1808 = param10;
         this._alphaMultiplier = 1;
         this.var_1428 = 0.5 + Math.random() * 0.5;
      }
      
      public function update() : void
      {
         ++this.var_518;
         if(this.var_518 == this.var_952)
         {
            this.ignite();
         }
         if(this.var_1808)
         {
            if(this.var_518 / this.var_952 > this.var_1428)
            {
               this._alphaMultiplier = (this.var_952 - this.var_518) / (this.var_952 * (1 - this.var_1428));
            }
         }
      }
      
      public function getAsset() : IGraphicAsset
      {
         if(this._frames && this._frames.length > 0)
         {
            return this._frames[this.var_518 % this._frames.length];
         }
         return null;
      }
      
      protected function ignite() : void
      {
      }
      
      public function get isEmitter() : Boolean
      {
         return this.var_2438;
      }
      
      public function get isAlive() : Boolean
      {
         return this.var_518 <= this.var_952;
      }
      
      public function dispose() : void
      {
         this._direction = null;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_173;
      }
      
      public function get z() : Number
      {
         return this.var_174;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
      }
      
      public function set y(param1:Number) : void
      {
         this.var_173 = param1;
      }
      
      public function set z(param1:Number) : void
      {
         this.var_174 = param1;
      }
      
      public function get lastX() : Number
      {
         return this.var_1805;
      }
      
      public function set lastX(param1:Number) : void
      {
         this.var_1192 = true;
         this.var_1805 = param1;
      }
      
      public function get lastY() : Number
      {
         return this.var_1807;
      }
      
      public function set lastY(param1:Number) : void
      {
         this.var_1192 = true;
         this.var_1807 = param1;
      }
      
      public function get lastZ() : Number
      {
         return this.var_1806;
      }
      
      public function set lastZ(param1:Number) : void
      {
         this.var_1192 = true;
         this.var_1806 = param1;
      }
      
      public function get hasMoved() : Boolean
      {
         return this.var_1192;
      }
      
      public function toString() : String
      {
         return [this._x,this.var_173,this.var_174].toString();
      }
   }
}
