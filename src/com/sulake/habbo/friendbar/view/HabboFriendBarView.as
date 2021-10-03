package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import com.sulake.habbo.friendbar.data.IHabboFriendBarData;
   import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
   import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
   import com.sulake.habbo.friendbar.events.FriendRequestEvent;
   import com.sulake.habbo.friendbar.events.NewMessageEvent;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarData;
   import com.sulake.habbo.friendbar.view.tabs.AddFriendsTab;
   import com.sulake.habbo.friendbar.view.tabs.FriendEntityTab;
   import com.sulake.habbo.friendbar.view.tabs.ITab;
   import com.sulake.habbo.friendbar.view.tabs.Tab;
   import com.sulake.habbo.friendbar.view.utils.FriendListIcon;
   import com.sulake.habbo.friendbar.view.utils.Icon;
   import com.sulake.habbo.friendbar.view.utils.MessengerIcon;
   import com.sulake.habbo.friendbar.view.utils.TextCropper;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboAlertDialogFlag;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class HabboFriendBarView extends Component implements IHabboFriendBarView, IAvatarImageListener
   {
      
      private static const const_1377:int = 127;
      
      private static const const_447:int = 1;
      
      private static const const_1376:int = 2;
      
      private static const const_639:int = 3;
      
      private static const const_1000:int = 3;
      
      private static const const_1363:Boolean = false;
      
      private static const const_640:int = 3;
      
      private static const const_1368:String = "arrow";
      
      private static const const_1360:String = "left";
      
      private static const const_1372:String = "right";
      
      private static const const_1361:String = "bar_xml";
      
      private static const const_1365:String = "toggle_xml";
      
      private static const const_80:String = "container";
      
      private static const const_1373:String = "wrapper";
      
      private static const const_1362:String = "border";
      
      private static const const_446:String = "list";
      
      private static const const_652:String = "header";
      
      private static const const_651:String = "canvas";
      
      private static const const_1001:String = "icon";
      
      private static const const_1367:String = "button_left";
      
      private static const const_1374:String = "button_right";
      
      private static const const_1369:String = "button_left_page";
      
      private static const const_1364:String = "button_right_page";
      
      private static const const_1370:String = "button_left_end";
      
      private static const const_1375:String = "button_right_end";
      
      private static const const_1338:String = "button_close";
      
      private static const const_1371:String = "button_open";
      
      private static const const_1366:String = "messenger";
      
      private static const const_1002:String = "friendlist";
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1032:IAvatarRenderManager;
      
      private var var_102:IHabboFriendBarData;
      
      private var var_49:IWindowContainer;
      
      private var var_197:IWindowContainer;
      
      private var var_94:Vector.<ITab>;
      
      private var var_1406:ITab;
      
      private var var_902:int = -1;
      
      private var _startIndex:int = 0;
      
      private var var_1405:TextCropper;
      
      private var var_735:FriendListIcon;
      
      private var var_498:MessengerIcon;
      
      private var var_1139:Boolean = false;
      
      public function HabboFriendBarView(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
         this.var_1405 = new TextCropper();
         this.var_94 = new Vector.<ITab>();
         if(param1 is HabboFriendBar)
         {
            this.var_1139 = HabboFriendBar(param1).findFriendsEnabled;
         }
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRendererAvailable);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerAvailable);
         queueInterface(new IIDHabboFriendBarData(),this.onFriendBarDataAvailable);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            this._windowManager.getWindowContext(const_447).getDesktopWindow().removeEventListener(WindowEvent.const_40,this.onDesktopResized);
            if(this.var_498)
            {
               this.var_498.dispose();
               this.var_498 = null;
            }
            if(this.var_735)
            {
               this.var_735.dispose();
               this.var_735 = null;
            }
            if(this.var_197)
            {
               this.var_197.dispose();
               this.var_197 = null;
            }
            if(this.var_49)
            {
               this.var_49.dispose();
               this.var_49 = null;
            }
            while(this.var_94.length > 0)
            {
               ITab(this.var_94.pop()).dispose();
            }
            if(this.var_102)
            {
               this.var_102.events.removeEventListener(FriendBarUpdateEvent.const_885,this.onRefreshView);
               this.var_102 = null;
               release(new IIDHabboFriendBarData());
            }
            if(this._windowManager)
            {
               this._windowManager = null;
               release(new IIDHabboWindowManager());
            }
            if(this.var_1032)
            {
               this.var_1032 = null;
               release(new IIDAvatarRenderManager());
            }
            this.var_1405.dispose();
            this.var_1405 = null;
            super.dispose();
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(this.var_49)
         {
            this.var_49.visible = param1;
            this.var_49.activate();
         }
         if(this.var_197)
         {
            this.var_197.visible = !param1;
            if(this.var_49)
            {
               this.var_197.x = this.var_49.x;
               this.var_197.y = this.var_49.y;
               this.var_197.activate();
            }
         }
      }
      
      public function get visible() : Boolean
      {
         return this.var_49 && this.var_49.visible;
      }
      
      public function populate() : void
      {
         var _loc5_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc1_:int = this.var_902;
         this.deSelect();
         var _loc2_:IWindowContainer = this.var_49.findChildByName(const_80) as IWindowContainer;
         var _loc3_:IItemListWindow = _loc2_.findChildByName(const_446) as IItemListWindow;
         _loc3_.autoArrangeItems = false;
         var _loc4_:int = _loc3_.numListItems;
         _loc5_ = _loc4_;
         while(_loc5_ > 0)
         {
            _loc3_.removeListItemAt(_loc5_ - 1);
            _loc5_--;
         }
         while(this.var_94.length > 0)
         {
            this.var_94.pop().recycle();
         }
         var _loc6_:int = this.var_102.numFriends + (!!this.var_1139 ? 1 : 0);
         var _loc7_:int = Math.min(this.maxNumOfTabsVisible,_loc6_);
         if(this._startIndex + _loc7_ > _loc6_)
         {
            this._startIndex = Math.max(0,this._startIndex - (this._startIndex + _loc7_ - _loc6_));
         }
         _loc4_ = Math.min(this.var_102.numFriends,this._startIndex + _loc7_);
         _loc5_ = this._startIndex;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = this.var_102.getFriendAt(_loc5_);
            _loc9_ = FriendEntityTab.allocate(_loc8_);
            this.var_94.push(_loc9_);
            _loc3_.addListItem(_loc9_.window);
            _loc5_++;
         }
         if(this.var_1139)
         {
            _loc10_ = this.maxNumOfTabsVisible;
            if(this.var_94.length < _loc10_)
            {
               _loc11_ = 1;
               if(this.var_94.length + _loc11_ < const_640)
               {
                  _loc11_ = Math.min(_loc10_ - this.var_94.length,const_640 - this.var_94.length);
               }
               _loc6_ = this.var_102.numFriends + _loc11_;
               while(_loc11_-- > 0)
               {
                  _loc12_ = AddFriendsTab.allocate();
                  _loc3_.addListItem(_loc12_.window);
                  this.var_94.push(_loc12_);
               }
            }
         }
         _loc3_.autoArrangeItems = true;
         if(_loc1_ > -1)
         {
            this.selectFriendEntity(_loc1_);
         }
         _loc2_.visible = this.var_94.length > 0;
         this.toggleArrowButtons(this.var_94.length < _loc6_,this._startIndex != 0,this._startIndex + this.var_94.length < _loc6_);
      }
      
      private function getFriendEntityTabByID(param1:int) : FriendEntityTab
      {
         var _loc2_:* = null;
         var _loc3_:int = this.var_94.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_94[_loc4_] as FriendEntityTab;
            if(_loc2_)
            {
               if(_loc2_.friend.id == param1)
               {
                  return _loc2_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      private function onFriendBarDataAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_102 = param2 as IHabboFriendBarData;
         this.var_102.events.addEventListener(FriendBarUpdateEvent.const_885,this.onRefreshView);
         this.var_102.events.addEventListener(FindFriendsNotificationEvent.TYPE,this.onFindFriendsNotification);
         this.var_102.events.addEventListener(FriendRequestEvent.const_1324,this.onFriendRequestUpdate);
         this.var_102.events.addEventListener(NewMessageEvent.const_1231,this.onNewInstantMessage);
      }
      
      private function onWindowManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function isUserInterfaceReady() : Boolean
      {
         return this.var_49 && !this.var_49.disposed;
      }
      
      private function buildUserInterface() : void
      {
         var _loc2_:* = null;
         Tab.var_1079 = this.var_102;
         Tab.var_1616 = this;
         Tab.var_862 = assets;
         Tab.var_1340 = this._windowManager;
         Tab.var_2105 = this.var_1405;
         var _loc1_:IAsset = assets.getAssetByName(const_1361);
         this.var_49 = this._windowManager.buildFromXML(_loc1_.content as XML,const_447) as IWindowContainer;
         this.var_49.x = const_639;
         this.var_49.y = this.var_49.parent.height - (this.var_49.height + const_1376);
         this.var_49.width = this.var_49.parent.width - (const_639 + const_1000);
         this.var_49.setParamFlag(WindowParam.const_295,true);
         this.var_49.procedure = this.barWindowEventProc;
         if(const_1363)
         {
            _loc1_ = assets.getAssetByName(const_1365);
            this.var_197 = this._windowManager.buildFromXML(_loc1_.content as XML,const_447) as IWindowContainer;
            this.var_197.x = this.var_49.x;
            this.var_197.y = this.var_49.y;
            this.var_197.setParamFlag(WindowParam.const_295,true);
            this.var_197.visible = false;
            this.var_197.procedure = this.toggleWindowEventProc;
         }
         _loc2_ = IWindowContainer(this.var_49.findChildByName(const_1002));
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.const_25,this.onIconMouseEvent);
         this.var_735 = new FriendListIcon(assets,_loc2_.getChildByName(const_1001) as IBitmapWrapperWindow);
         _loc2_ = IWindowContainer(this.var_49.findChildByName(const_1366));
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.const_25,this.onIconMouseEvent);
         this.var_498 = new MessengerIcon(assets,_loc2_.getChildByName(const_1001) as IBitmapWrapperWindow);
         this.var_498.enable(false);
         this.visible = true;
         this._windowManager.getWindowContext(const_447).getDesktopWindow().addEventListener(WindowEvent.const_40,this.onDesktopResized);
      }
      
      private function onAvatarRendererAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_1032 = param2 as IAvatarRenderManager;
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!_loc2_)
         {
            if(this.var_1032)
            {
               _loc3_ = this.var_1032.createAvatarImage(param1,AvatarScaleType.const_58,null,this);
               if(_loc3_)
               {
                  _loc2_ = _loc3_.getCroppedImage(AvatarSetType.const_52);
                  _loc3_.dispose();
               }
            }
         }
         return _loc2_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc3_:IItemListWindow = this.var_49.findChildByName(const_446) as IItemListWindow;
         var _loc4_:int = this.var_102.numFriends;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_102.getFriendAt(_loc5_);
            if(_loc2_.figure == param1)
            {
               _loc6_ = this.getAvatarFaceBitmap(_loc2_.figure);
               if(_loc6_)
               {
                  _loc7_ = _loc3_.getListItemByID(_loc2_.id) as IWindowContainer;
                  if(_loc7_)
                  {
                     _loc8_ = _loc7_.getChildByName(const_446) as IItemListWindow;
                     if(_loc8_)
                     {
                        _loc9_ = IWindowContainer(_loc8_.getListItemByName(const_652));
                        if(_loc9_)
                        {
                           _loc10_ = _loc9_.findChildByName(const_651) as IBitmapWrapperWindow;
                           _loc10_.bitmap = _loc6_;
                           _loc10_.width = _loc6_.width;
                           _loc10_.height = _loc6_.height;
                        }
                     }
                  }
               }
            }
            _loc5_++;
         }
      }
      
      public function faceBookImageReady(param1:BitmapData) : void
      {
      }
      
      private function isFriendSelected(param1:IFriendEntity) : Boolean
      {
         return this.var_902 == param1.id;
      }
      
      public function selectTab(param1:ITab) : void
      {
         if(!param1.selected)
         {
            if(this.var_1406)
            {
               this.deSelect();
            }
            param1.select();
            this.var_1406 = param1;
            if(param1 is FriendEntityTab)
            {
               this.var_902 = FriendEntityTab(param1).friend.id;
            }
         }
      }
      
      public function selectFriendEntity(param1:int) : void
      {
         if(this.var_902 == param1)
         {
            return;
         }
         var _loc2_:FriendEntityTab = this.getFriendEntityTabByID(param1);
         if(_loc2_)
         {
            this.selectTab(_loc2_);
            this.var_902 = param1;
         }
      }
      
      public function deSelect() : void
      {
         if(this.var_1406)
         {
            this.var_1406.deselect();
            this.var_902 = -1;
         }
      }
      
      private function onRefreshView(param1:Event) : void
      {
         if(!this.isUserInterfaceReady())
         {
            this.buildUserInterface();
         }
         this.resizeAndPopulate(true);
      }
      
      private function onFindFriendsNotification(param1:FindFriendsNotificationEvent) : void
      {
         var event:FindFriendsNotificationEvent = param1;
         var title:String = !!event.success ? "${friendbar.find.success.title}" : "${friendbar.find.error.title}";
         var text:String = !!event.success ? "${friendbar.find.success.text}" : "${friendbar.find.error.text}";
         this._windowManager.notify(title,text,function(param1:IAlertDialog, param2:WindowEvent):void
         {
            param1.dispose();
         },HabboAlertDialogFlag.const_584);
      }
      
      private function onFriendRequestUpdate(param1:FriendRequestEvent) : void
      {
         if(this.var_735)
         {
            this.var_735.notify(this.var_102.numFriendRequests > 0);
         }
      }
      
      private function onNewInstantMessage(param1:NewMessageEvent) : void
      {
         if(this.var_498)
         {
            if(param1.notify)
            {
               this.var_498.notify(true);
            }
            else
            {
               this.var_498.enable(true);
            }
         }
      }
      
      private function barWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1.type == WindowMouseEvent.const_45)
         {
            _loc3_ = this._startIndex;
            _loc4_ = this.var_102.numFriends + (!!this.var_1139 ? 1 : 0);
            switch(param2.name)
            {
               case const_1367:
                  _loc3_ = Math.max(0,this._startIndex - 1);
                  break;
               case const_1369:
                  _loc3_ = Math.max(0,this._startIndex - this.maxNumOfTabsVisible);
                  break;
               case const_1370:
                  _loc3_ = 0;
                  break;
               case const_1374:
                  _loc3_ = Math.max(0,Math.min(_loc4_ - this.maxNumOfTabsVisible,this._startIndex + 1));
                  break;
               case const_1364:
                  _loc3_ = Math.max(0,Math.min(_loc4_ - this.maxNumOfTabsVisible,this._startIndex + this.maxNumOfTabsVisible));
                  break;
               case const_1375:
                  _loc3_ = Math.max(0,_loc4_ - this.maxNumOfTabsVisible);
                  break;
               case const_1338:
                  this.visible = false;
                  break;
               case const_1362:
                  this.deSelect();
            }
            if(_loc3_ != this._startIndex)
            {
               this.deSelect();
               this._startIndex = _loc3_;
               this.resizeAndPopulate(true);
            }
         }
         if(param1.type == WindowEvent.const_581)
         {
            this.deSelect();
         }
      }
      
      private function onIconMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:Icon = param1.window.name == const_1002 ? this.var_735 : this.var_498;
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(_loc2_ is FriendListIcon)
               {
                  this.var_102.toggleFriendList();
                  _loc2_.notify(false);
               }
               else if(_loc2_ is MessengerIcon)
               {
                  this.var_102.toggleMessenger();
                  _loc2_.notify(false);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               _loc2_.hover(true);
               break;
            case WindowMouseEvent.const_25:
               _loc2_.hover(false);
         }
      }
      
      private function toggleWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(this.var_197.visible)
         {
            if(param1.type == WindowMouseEvent.const_45)
            {
               switch(param2.name)
               {
                  case const_1371:
                     this.visible = true;
               }
            }
         }
      }
      
      private function toggleArrowButtons(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:IWindowContainer = this.var_49.findChildByName(const_1373) as IWindowContainer;
         _loc5_ = [];
         _loc6_.groupChildrenWithTag(const_1368,_loc5_);
         for each(_loc4_ in _loc5_)
         {
            _loc4_.visible = param1;
         }
         _loc5_ = [];
         _loc6_.groupChildrenWithTag(const_1360,_loc5_);
         for each(_loc4_ in _loc5_)
         {
            if(param2)
            {
               _loc4_.enable();
            }
            else
            {
               _loc4_.disable();
            }
         }
         _loc5_ = [];
         _loc6_.groupChildrenWithTag(const_1372,_loc5_);
         for each(_loc4_ in _loc5_)
         {
            if(param3)
            {
               _loc4_.enable();
            }
            else
            {
               _loc4_.disable();
            }
         }
      }
      
      private function resizeAndPopulate(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(!disposed)
         {
            if(this.var_49)
            {
               this.var_49.width = this.var_49.parent.width - (const_639 + const_1000);
               if(!param1)
               {
                  _loc2_ = this.maxNumOfTabsVisible;
                  if(_loc2_ < this.var_94.length)
                  {
                     param1 = true;
                  }
                  else if(_loc2_ > this.var_94.length)
                  {
                     if(this.var_94.length < const_640)
                     {
                        param1 = true;
                     }
                     else if(this.var_94.length < this.var_102.numFriends + (!!this.var_1139 ? 1 : 0))
                     {
                        param1 = true;
                     }
                     else if(this.numFriendEntityTabsVisible < this.var_102.numFriends)
                     {
                        param1 = true;
                     }
                  }
               }
               if(param1)
               {
                  this.populate();
               }
            }
         }
      }
      
      private function get numFriendEntityTabsVisible() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = this.var_94.length;
         while(_loc2_-- > 0)
         {
            if(this.var_94[_loc2_] is FriendEntityTab)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      private function get maxNumOfTabsVisible() : int
      {
         var _loc1_:IWindowContainer = this.var_49.findChildByName(const_80) as IWindowContainer;
         var _loc2_:IWindowContainer = _loc1_.getChildByName("wrapper") as IWindowContainer;
         var _loc3_:IItemListWindow = _loc2_.findChildByName(const_446) as IItemListWindow;
         var _loc4_:int = _loc2_.width - _loc3_.width;
         return (_loc1_.width - _loc4_) / (const_1377 + _loc3_.spacing);
      }
      
      private function onDesktopResized(param1:WindowEvent) : void
      {
         this.resizeAndPopulate(false);
      }
   }
}
