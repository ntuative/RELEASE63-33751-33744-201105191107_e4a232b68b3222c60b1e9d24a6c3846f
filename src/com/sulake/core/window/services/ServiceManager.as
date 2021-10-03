package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2962:uint;
      
      private var var_150:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_267:IWindowContext;
      
      private var var_1291:IMouseDraggingService;
      
      private var var_1290:IMouseScalingService;
      
      private var var_1287:IMouseListenerService;
      
      private var var_1289:IFocusManagerService;
      
      private var var_1292:IToolTipAgentService;
      
      private var var_1288:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2962 = 0;
         this.var_150 = param2;
         this.var_267 = param1;
         this.var_1291 = new WindowMouseDragger(param2);
         this.var_1290 = new WindowMouseScaler(param2);
         this.var_1287 = new WindowMouseListener(param2);
         this.var_1289 = new FocusManager(param2);
         this.var_1292 = new WindowToolTipAgent(param2);
         this.var_1288 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1291 != null)
         {
            this.var_1291.dispose();
            this.var_1291 = null;
         }
         if(this.var_1290 != null)
         {
            this.var_1290.dispose();
            this.var_1290 = null;
         }
         if(this.var_1287 != null)
         {
            this.var_1287.dispose();
            this.var_1287 = null;
         }
         if(this.var_1289 != null)
         {
            this.var_1289.dispose();
            this.var_1289 = null;
         }
         if(this.var_1292 != null)
         {
            this.var_1292.dispose();
            this.var_1292 = null;
         }
         if(this.var_1288 != null)
         {
            this.var_1288.dispose();
            this.var_1288 = null;
         }
         this.var_150 = null;
         this.var_267 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1291;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1290;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1287;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1289;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1292;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1288;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
