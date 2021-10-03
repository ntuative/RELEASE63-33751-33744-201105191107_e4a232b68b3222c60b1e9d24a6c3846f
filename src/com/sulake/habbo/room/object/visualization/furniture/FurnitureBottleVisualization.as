package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1044:int = 20;
      
      private static const const_664:int = 9;
      
      private static const const_1425:int = -1;
       
      
      private var var_323:Array;
      
      private var var_731:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_323 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_731)
            {
               this.var_731 = true;
               this.var_323 = new Array();
               this.var_323.push(const_1425);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_731)
            {
               this.var_731 = false;
               this.var_323 = new Array();
               this.var_323.push(const_1044);
               this.var_323.push(const_664 + param1);
               this.var_323.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(0))
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
