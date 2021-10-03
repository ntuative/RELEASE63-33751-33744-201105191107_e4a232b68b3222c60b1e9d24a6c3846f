package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1674:String = "WE_DESTROY";
      
      public static const const_340:String = "WE_DESTROYED";
      
      public static const const_1862:String = "WE_OPEN";
      
      public static const const_1891:String = "WE_OPENED";
      
      public static const const_1867:String = "WE_CLOSE";
      
      public static const const_1813:String = "WE_CLOSED";
      
      public static const const_1668:String = "WE_FOCUS";
      
      public static const const_313:String = "WE_FOCUSED";
      
      public static const const_1774:String = "WE_UNFOCUS";
      
      public static const const_1905:String = "WE_UNFOCUSED";
      
      public static const const_1849:String = "WE_ACTIVATE";
      
      public static const const_524:String = "WE_ACTIVATED";
      
      public static const const_1646:String = "WE_DEACTIVATE";
      
      public static const const_581:String = "WE_DEACTIVATED";
      
      public static const const_352:String = "WE_SELECT";
      
      public static const const_49:String = "WE_SELECTED";
      
      public static const const_462:String = "WE_UNSELECT";
      
      public static const const_480:String = "WE_UNSELECTED";
      
      public static const const_1829:String = "WE_LOCK";
      
      public static const const_1732:String = "WE_LOCKED";
      
      public static const const_1721:String = "WE_UNLOCK";
      
      public static const const_1694:String = "WE_UNLOCKED";
      
      public static const const_976:String = "WE_ENABLE";
      
      public static const const_257:String = "WE_ENABLED";
      
      public static const const_818:String = "WE_DISABLE";
      
      public static const const_289:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_373:String = "WE_RELOCATED";
      
      public static const const_1260:String = "WE_RESIZE";
      
      public static const const_40:String = "WE_RESIZED";
      
      public static const const_1901:String = "WE_MINIMIZE";
      
      public static const const_1810:String = "WE_MINIMIZED";
      
      public static const const_1730:String = "WE_MAXIMIZE";
      
      public static const const_1819:String = "WE_MAXIMIZED";
      
      public static const const_1630:String = "WE_RESTORE";
      
      public static const const_1755:String = "WE_RESTORED";
      
      public static const const_341:String = "WE_CHILD_ADDED";
      
      public static const const_436:String = "WE_CHILD_REMOVED";
      
      public static const const_196:String = "WE_CHILD_RELOCATED";
      
      public static const const_122:String = "WE_CHILD_RESIZED";
      
      public static const const_317:String = "WE_CHILD_ACTIVATED";
      
      public static const const_467:String = "WE_PARENT_ADDED";
      
      public static const const_1780:String = "WE_PARENT_REMOVED";
      
      public static const const_1667:String = "WE_PARENT_RELOCATED";
      
      public static const const_801:String = "WE_PARENT_RESIZED";
      
      public static const const_1253:String = "WE_PARENT_ACTIVATED";
      
      public static const const_184:String = "WE_OK";
      
      public static const const_517:String = "WE_CANCEL";
      
      public static const const_108:String = "WE_CHANGE";
      
      public static const const_464:String = "WE_SCROLL";
      
      public static const const_172:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_697:IWindow;
      
      protected var var_1087:Boolean;
      
      protected var var_475:Boolean;
      
      protected var var_477:Boolean;
      
      protected var var_698:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_697 = param3;
         _loc5_.var_475 = param4;
         _loc5_.var_477 = false;
         _loc5_.var_698 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_697;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_475;
      }
      
      public function recycle() : void
      {
         if(this.var_477)
         {
            throw new Error("Event already recycled!");
         }
         this.var_697 = null;
         this._window = null;
         this.var_477 = true;
         this.var_1087 = false;
         this.var_698.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1087;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1087 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1087;
      }
      
      public function stopPropagation() : void
      {
         this.var_1087 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1087 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_475 + " window: " + this._window + " }";
      }
   }
}
