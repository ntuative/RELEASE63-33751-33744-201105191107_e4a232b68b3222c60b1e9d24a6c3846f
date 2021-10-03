package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class HabboNotificationViewManager implements IUpdateReceiver
   {
      
      private static const const_1513:int = 78;
      
      private static const const_660:int = 4;
       
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1265:Map;
      
      private var var_972:Map;
      
      private var _disposed:Boolean = false;
      
      private var var_1545:int = 78;
      
      private var var_188:Array;
      
      public function HabboNotificationViewManager(param1:IAssetLibrary, param2:IHabboWindowManager, param3:Map, param4:Map)
      {
         super();
         this._assetLibrary = param1;
         this._windowManager = param2;
         this.var_1265 = param3;
         this.var_972 = param4;
         this.var_188 = new Array();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function replaceIcon(param1:BadgeImageReadyEvent) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_188)
         {
            _loc2_.replaceIcon(param1);
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = this.var_188.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            (this.var_188.pop() as HabboNotificationItemView).dispose();
            _loc2_++;
         }
         this._assetLibrary = null;
         this._windowManager = null;
         if(this.var_1265)
         {
            this.var_1265.dispose();
            this.var_1265 = null;
         }
         if(this.var_972)
         {
            this.var_972.dispose();
            this.var_972 = null;
         }
         this._disposed = true;
      }
      
      public function showItem(param1:HabboNotificationItem) : Boolean
      {
         if(!this.isSpaceAvailable())
         {
            return false;
         }
         var _loc2_:HabboNotificationItemView = new HabboNotificationItemView(this._assetLibrary.getAssetByName("layout_notification_xml"),this._windowManager,this.var_1265,this.var_972,param1);
         _loc2_.reposition(this.getNextAvailableVerticalPosition());
         this.var_188.push(_loc2_);
         this.var_188.sortOn("verticalPosition",Array.NUMERIC);
         return true;
      }
      
      public function isSpaceAvailable() : Boolean
      {
         return this.getNextAvailableVerticalPosition() + HabboNotificationItemView.const_572 < 540;
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.var_188.length)
         {
            (this.var_188[_loc2_] as HabboNotificationItemView).update(param1);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_188.length)
         {
            _loc3_ = this.var_188[_loc2_] as HabboNotificationItemView;
            if(_loc3_.ready)
            {
               _loc3_.dispose();
               this.var_188.splice(_loc2_,1);
               _loc2_--;
            }
            _loc2_++;
         }
      }
      
      private function getNextAvailableVerticalPosition() : int
      {
         var _loc3_:* = null;
         if(this.var_188.length == 0)
         {
            return this.var_1545;
         }
         var _loc1_:int = this.var_1545;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_188.length)
         {
            _loc3_ = this.var_188[_loc2_] as HabboNotificationItemView;
            if(_loc1_ + HabboNotificationItemView.const_572 < _loc3_.verticalPosition)
            {
               return _loc1_;
            }
            _loc1_ = _loc3_.verticalPosition + HabboNotificationItemView.const_572 + const_660;
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function set topMarginIncrease(param1:int) : void
      {
         var _loc4_:* = null;
         this.var_1545 = const_1513 + param1;
         var _loc2_:int = this.var_1545;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_188.length)
         {
            _loc4_ = this.var_188[_loc3_] as HabboNotificationItemView;
            _loc4_.reposition(_loc2_);
            _loc2_ = _loc4_.verticalPosition + HabboNotificationItemView.const_572 + const_660;
            _loc3_++;
         }
      }
   }
}
