package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1364:IHabboTracking;
      
      private var var_1948:Boolean = false;
      
      private var var_2614:int = 0;
      
      private var var_1910:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1364 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1364 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1948 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2614 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1948)
         {
            return;
         }
         ++this.var_1910;
         if(this.var_1910 <= this.var_2614)
         {
            this.var_1364.track("toolbar",param1);
         }
      }
   }
}
