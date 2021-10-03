package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1044:int = 20;
      
      private static const const_664:int = 10;
      
      private static const const_1466:int = 31;
      
      private static const const_1425:int = 32;
      
      private static const const_665:int = 30;
       
      
      private var var_323:Array;
      
      private var var_731:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_323 = new Array();
         super();
         super.setAnimation(const_665);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_731)
            {
               this.var_731 = true;
               this.var_323 = new Array();
               this.var_323.push(const_1466);
               this.var_323.push(const_1425);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_664)
         {
            if(this.var_731)
            {
               this.var_731 = false;
               this.var_323 = new Array();
               if(direction == 2)
               {
                  this.var_323.push(const_1044 + 5 - param1);
                  this.var_323.push(const_664 + 5 - param1);
               }
               else
               {
                  this.var_323.push(const_1044 + param1);
                  this.var_323.push(const_664 + param1);
               }
               this.var_323.push(const_665);
               return;
            }
            super.setAnimation(const_665);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
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
