package com.sulake.habbo.friendbar.view.tabs
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import flash.display.BitmapData;
   import flash.utils.getQualifiedClassName;
   
   public class FriendEntityTab extends Tab
   {
      
      private static const const_1454:String = "entity_xml";
      
      private static const const_1453:String = "facebook_piece_xml";
      
      private static const const_1452:String = "controls_piece_xml";
      
      private static const const_446:String = "list";
      
      private static const const_652:String = "header";
      
      private static const const_1041:String = "facebook";
      
      private static const const_1043:String = "controls";
      
      private static const const_651:String = "canvas";
      
      private static const const_455:String = "name";
      
      private static const const_999:String = "btn_message";
      
      private static const const_1042:String = "btn_visit";
      
      private static const const_1001:String = "icon";
      
      private static const const_68:uint = 10338138;
      
      private static const const_1040:uint = 13891476;
      
      private static const POOL:Array = [];
      
      private static const const_454:Array = [];
       
      
      private var var_306:IFriendEntity;
      
      public function FriendEntityTab()
      {
         super();
      }
      
      public static function allocate(param1:IFriendEntity) : FriendEntityTab
      {
         var _loc2_:FriendEntityTab = false ? POOL.pop() : new FriendEntityTab();
         _loc2_.var_477 = false;
         _loc2_.friend = param1;
         return _loc2_;
      }
      
      private static function purgeEntityPieces(param1:IWindowContainer) : void
      {
         var _loc3_:* = null;
         var _loc2_:IItemListWindow = IItemListWindow(param1.getChildByName(const_446));
         _loc3_ = _loc2_.getListItemByName(const_1041) as IWindowContainer;
         if(_loc3_)
         {
            _loc3_.dispose();
         }
         _loc3_ = _loc2_.getListItemByName(const_1043) as IWindowContainer;
         if(_loc3_)
         {
            _loc3_.dispose();
         }
         param1.height = name_1;
         param1.y = 0;
      }
      
      public function set friend(param1:IFriendEntity) : void
      {
         this.var_306 = param1;
         this.refresh();
      }
      
      public function get friend() : IFriendEntity
      {
         return this.var_306;
      }
      
      override public function recycle() : void
      {
         if(!disposed)
         {
            if(!var_477)
            {
               if(_window)
               {
                  this.releaseEntityWindow(_window);
                  _window = null;
               }
               this.var_306 = null;
               var_477 = true;
               POOL.push(this);
            }
         }
      }
      
      override public function select() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(!selected)
         {
            _loc1_ = IItemListWindow(window.getChildByName(const_446));
            if(this.friend.realName != null && this.friend.realName != "")
            {
               _loc2_ = var_1340.buildFromXML(var_862.getAssetByName(const_1453).content as XML) as IWindowContainer;
               _loc2_.name = const_1041;
               _loc2_.getChildByName(const_455).caption = this.friend.realName;
               var_2105.crop(_loc2_.getChildByName(const_455) as ITextWindow);
               _loc3_ = IBitmapWrapperWindow(_loc2_.getChildByName(const_1001));
               _loc3_.bitmap = var_862.getAssetByName(_loc3_.bitmapAssetName).content as BitmapData;
               _loc3_.width = _loc3_.bitmap.width;
               _loc3_.height = _loc3_.bitmap.height;
               _loc1_.addListItem(_loc2_);
            }
            if(this.friend.online)
            {
               _loc2_ = var_1340.buildFromXML(var_862.getAssetByName(const_1452).content as XML) as IWindowContainer;
               _loc2_.name = const_1043;
               _loc4_ = _loc2_.getChildByName(const_999);
               if(_loc4_)
               {
                  _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClick);
               }
               _loc4_ = _loc2_.getChildByName(const_1042);
               if(_loc4_)
               {
                  if(this.friend.allowFollow)
                  {
                     _loc4_.visible = true;
                     _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClick);
                  }
                  else
                  {
                     _loc4_.visible = false;
                  }
               }
               _loc1_.addListItem(_loc2_);
            }
            window.height = _loc1_.height;
            window.y = name_1 - 0;
            super.select();
         }
      }
      
      override public function deselect() : void
      {
         if(selected)
         {
            if(_window)
            {
               purgeEntityPieces(_window);
            }
            super.deselect();
         }
      }
      
      override protected function expose() : void
      {
         super.expose();
         _window.color = !!exposed ? uint(const_1040) : uint(const_68);
         ITextWindow(_window.findChildByTag("label")).underline = exposed;
      }
      
      override protected function conceal() : void
      {
         super.conceal();
         _window.color = !!exposed ? uint(const_1040) : uint(const_68);
         ITextWindow(_window.findChildByTag("label")).underline = exposed;
      }
      
      protected function refresh() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!_window)
         {
            _window = this.allocateEntityWindow();
         }
         if(this.var_306)
         {
            _window.id = this.var_306.id;
            _loc1_ = IItemListWindow(_window.getChildByName(const_446)).getListItemByName(const_652) as IWindowContainer;
            _loc1_.findChildByName(const_455).caption = this.var_306.name;
            var_2105.crop(_loc1_.getChildByName(const_455) as ITextWindow);
            _loc2_ = IBitmapWrapperWindow(_loc1_.findChildByName(const_651));
            _loc2_.bitmap = var_1616.getAvatarFaceBitmap(this.var_306.figure);
            _loc2_.width = _loc2_.bitmap.width;
            _loc2_.height = _loc2_.bitmap.height;
         }
      }
      
      private function allocateEntityWindow() : IWindowContainer
      {
         var _loc1_:IWindowContainer = false ? const_454.pop() : var_1340.buildFromXML(var_862.getAssetByName(const_1454).content as XML) as IWindowContainer;
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(_loc1_.findChildByName(const_651));
         var _loc3_:IRegionWindow = IRegionWindow(_loc1_.findChildByName(const_652));
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = name_5;
         _loc1_.height = name_1;
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc1_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc3_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc2_.disposesBitmap = true;
         return _loc1_;
      }
      
      private function releaseEntityWindow(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 && !param1.disposed)
         {
            param1.procedure = null;
            param1.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            param1.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
            param1.removeEventListener(WindowMouseEvent.const_25,onMouseOut);
            _loc2_ = IRegionWindow(param1.findChildByName(const_652));
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
            _loc2_.removeEventListener(WindowMouseEvent.const_25,onMouseOut);
            param1.width = name_5;
            param1.height = name_1;
            _loc3_ = IBitmapWrapperWindow(param1.findChildByName(const_651));
            _loc3_.bitmap = null;
            purgeEntityPieces(param1);
            if(const_454.indexOf(param1) == -1)
            {
               const_454.push(param1);
            }
         }
      }
      
      private function onButtonClick(param1:WindowMouseEvent) : void
      {
         if(!disposed && !recycled)
         {
            switch(param1.window.name)
            {
               case const_999:
                  if(var_1079 && this.var_306)
                  {
                     var_1079.startConversation(this.var_306.id);
                     this.deselect();
                  }
                  break;
               case const_1042:
                  if(var_1079 && this.var_306)
                  {
                     var_1079.followToRoom(this.var_306.id);
                     this.deselect();
                  }
            }
         }
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + " " + this.var_306.name;
      }
   }
}
