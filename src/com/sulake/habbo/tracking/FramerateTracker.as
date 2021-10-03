package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_2000:int;
      
      private var var_2883:int;
      
      private var var_838:int;
      
      private var var_544:Number;
      
      private var var_2884:Boolean;
      
      private var var_2885:int;
      
      private var var_2086:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_544);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2883 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2885 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2884 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_838;
         if(this.var_838 == 1)
         {
            this.var_544 = param1;
            this.var_2000 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_838);
            this.var_544 = this.var_544 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2884 && param3 - this.var_2000 >= this.var_2883)
         {
            this.var_838 = 0;
            if(this.var_2086 < this.var_2885)
            {
               param2.track("performance","averageFramerate",this.frameRate);
               ++this.var_2086;
               this.var_2000 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
