package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1425:int = 3;
      
      private static const const_1463:int = 2;
      
      private static const const_1462:int = 1;
      
      private static const const_1461:int = 15;
       
      
      private var var_323:Array;
      
      private var var_1237:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_323 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1463)
         {
            this.var_323 = new Array();
            this.var_323.push(const_1462);
            this.var_1237 = const_1461;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1237 > 0)
         {
            --this.var_1237;
         }
         if(this.var_1237 == 0)
         {
            if(this.var_323.length > 0)
            {
               super.setAnimation(this.var_323.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
