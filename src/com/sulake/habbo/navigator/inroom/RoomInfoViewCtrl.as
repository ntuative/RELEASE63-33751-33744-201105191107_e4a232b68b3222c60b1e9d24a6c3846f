package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboNavigatorEvent;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_180:IWindowContainer;
      
      private var var_2937:int;
      
      private var var_351:RoomEventViewCtrl;
      
      private var var_354:Timer;
      
      private var var_139:RoomSettingsCtrl;
      
      private var var_251:RoomThumbnailCtrl;
      
      private var var_908:TagRenderer;
      
      private var var_352:IWindowContainer;
      
      private var var_353:IWindowContainer;
      
      private var var_595:IWindowContainer;
      
      private var var_1716:IWindowContainer;
      
      private var var_1715:IWindowContainer;
      
      private var var_1142:IWindowContainer;
      
      private var var_907:ITextWindow;
      
      private var var_909:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_739:ITextWindow;
      
      private var var_1143:ITextWindow;
      
      private var var_910:ITextWindow;
      
      private var var_742:ITextWindow;
      
      private var var_1411:ITextWindow;
      
      private var var_252:IWindowContainer;
      
      private var var_741:IWindowContainer;
      
      private var var_1408:IWindowContainer;
      
      private var var_1714:ITextWindow;
      
      private var var_596:ITextWindow;
      
      private var var_1713:IWindow;
      
      private var var_1146:IContainerButtonWindow;
      
      private var var_1145:IContainerButtonWindow;
      
      private var var_1147:IContainerButtonWindow;
      
      private var _remFavouriteButton:IContainerButtonWindow;
      
      private var var_1148:IContainerButtonWindow;
      
      private var var_1409:IButtonWindow;
      
      private var var_1410:IButtonWindow;
      
      private var var_1412:IButtonWindow;
      
      private var var_740:IWindowContainer;
      
      private var var_1144:ITextWindow;
      
      private var var_906:ITextFieldWindow;
      
      private var _buttons:IWindowContainer;
      
      private var var_738:IButtonWindow;
      
      private var var_2936:String;
      
      private const const_832:int = 75;
      
      private const const_728:int = 3;
      
      private const const_879:int = 45;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_351 = new RoomEventViewCtrl(this._navigator);
         this.var_139 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_251 = new RoomThumbnailCtrl(this._navigator);
         this.var_908 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_139);
         this.var_354 = new Timer(6000,1);
         this.var_354.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this.var_354)
         {
            this.var_354.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_354.reset();
            this.var_354 = null;
         }
         this._navigator = null;
         this.var_351 = null;
         this.var_139 = null;
         this.var_251 = null;
         if(this.var_908)
         {
            this.var_908.dispose();
            this.var_908 = null;
         }
         this.var_180 = null;
         this.var_352 = null;
         this.var_353 = null;
         this.var_595 = null;
         this.var_1716 = null;
         this.var_1715 = null;
         this.var_1142 = null;
         this.var_907 = null;
         this.var_909 = null;
         this._ownerName = null;
         this.var_739 = null;
         this.var_1143 = null;
         this.var_910 = null;
         this.var_742 = null;
         this.var_1411 = null;
         this.var_252 = null;
         this.var_741 = null;
         this.var_1408 = null;
         this.var_1714 = null;
         this.var_596 = null;
         this.var_1713 = null;
         this.var_1146 = null;
         this.var_1145 = null;
         this.var_1147 = null;
         this._remFavouriteButton = null;
         this.var_1148 = null;
         this.var_1409 = null;
         this.var_1410 = null;
         this.var_1412 = null;
         this.var_740 = null;
         this.var_1144 = null;
         this.var_906 = null;
         this._buttons = null;
         this.var_738 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_354.reset();
         this.var_351.active = true;
         this.var_139.active = false;
         this.var_251.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_354.reset();
         this.var_139.load(param1);
         this.var_139.active = true;
         this.var_351.active = false;
         this.var_251.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_139.active = true;
         this.var_351.active = false;
         this.var_251.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_354.reset();
         this.var_139.active = false;
         this.var_351.active = false;
         this.var_251.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function toggle() : void
      {
         this.var_354.reset();
         this.var_351.active = false;
         this.var_139.active = false;
         this.var_251.active = false;
         this.refresh();
         this._window.visible = !this._window.visible;
         this._window.x = this._window.desktop.width - this._window.width - this.const_728;
         this._window.y = this.const_832;
         if(this._window.visible)
         {
            this._window.activate();
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this.var_180,["room_info","event_info","embed_info","buttons_container"],0,2);
         this.var_180.height = Util.getLowestPoint(this.var_180);
         var _loc1_:int = this._window.desktop.height - this._window.height - this.const_879;
         if(this._window.y > _loc1_)
         {
            this._window.y = _loc1_ < 0 ? 0 : int(_loc1_);
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_352);
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_139.refresh(this.var_352);
         this.var_251.refresh(this.var_352);
         Util.moveChildrenToColumn(this.var_352,["room_details","room_buttons"],0,2);
         this.var_352.height = Util.getLowestPoint(this.var_352);
         this.var_352.visible = true;
         Logger.log("XORP: " + this.var_353.visible + ", " + this.var_1142.visible + ", " + this.var_595.visible + ", " + this.var_595.rectangle + ", " + this.var_352.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_252);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_351.refresh(this.var_252);
         if(Util.hasVisibleChildren(this.var_252) && !(this.var_139.active || this.var_251.active))
         {
            Util.moveChildrenToColumn(this.var_252,["event_details","event_buttons"],0,2);
            this.var_252.height = Util.getLowestPoint(this.var_252);
            this.var_252.visible = true;
         }
         else
         {
            this.var_252.visible = false;
         }
         Logger.log("EVENT: " + this.var_252.visible + ", " + this.var_252.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_139.active && !this.var_251.active && !this.var_351.active)
         {
            this.var_740.visible = true;
            this.var_906.text = this.getEmbedData();
         }
         else
         {
            this.var_740.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this._buttons)
         {
            return;
         }
         if(this.var_139.active)
         {
            this._buttons.visible = false;
            return;
         }
         this._buttons.visible = true;
         if(this.var_738)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_738.visible = _loc1_;
            if(this.var_2936 == "0")
            {
               this.var_738.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_738.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_139.active || this.var_251.active)
         {
            return;
         }
         this.var_907.text = param1.roomName;
         this.var_907.height = this.var_907.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_739.text = param1.description;
         this.var_908.refreshTags(this.var_353,param1.tags);
         this.var_739.visible = false;
         if(param1.description != "")
         {
            this.var_739.height = this.var_739.textHeight + 5;
            this.var_739.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1145,"facebook_logo_small",_loc3_,null,0);
         this.var_1145.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1146,"thumb_up",_loc4_,null,0);
         this.var_1146.visible = _loc4_;
         this.var_742.visible = !_loc4_;
         this.var_1411.visible = !_loc4_;
         this.var_1411.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_353,"home",param2,null,0);
         this._navigator.refreshButton(this.var_353,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_353,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_907.y,0);
         this.var_353.visible = true;
         this.var_353.height = Util.getLowestPoint(this.var_353);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_353.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_139.active || this.var_251.active)
         {
            return;
         }
         this.var_909.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_909.height = this.var_909.textHeight + 5;
         this.var_1143.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1143.height = this.var_1143.textHeight + 5;
         Util.moveChildrenToColumn(this.var_595,["public_space_name","public_space_desc"],this.var_909.y,0);
         this.var_595.visible = true;
         this.var_595.height = Math.max(86,Util.getLowestPoint(this.var_595));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_351.active)
         {
            return;
         }
         this.var_1714.text = param1.eventName;
         this.var_596.text = param1.eventDescription;
         this.var_908.refreshTags(this.var_741,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_596.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_596.height = this.var_596.textHeight + 5;
            this.var_596.y = Util.getLowestPoint(this.var_741) + 2;
            this.var_596.visible = true;
         }
         this.var_741.visible = true;
         this.var_741.height = Util.getLowestPoint(this.var_741);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_139.active || this.var_251.active)
         {
            return;
         }
         this.var_1409.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1147.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this._remFavouriteButton.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1148.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1142.visible = Util.hasVisibleChildren(this.var_1142);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_351.active)
         {
            return;
         }
         this.var_1410.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1412.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1408.visible = Util.hasVisibleChildren(this.var_1408);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details_framed"));
         this.var_180 = this._window.findChildByName("content") as IWindowContainer;
         this._window.visible = false;
         this.var_352 = IWindowContainer(this.find("room_info"));
         this.var_353 = IWindowContainer(this.find("room_details"));
         this.var_595 = IWindowContainer(this.find("public_space_details"));
         this.var_1716 = IWindowContainer(this.find("owner_name_cont"));
         this.var_1715 = IWindowContainer(this.find("rating_cont"));
         this.var_1142 = IWindowContainer(this.find("room_buttons"));
         this.var_907 = ITextWindow(this.find("room_name"));
         this.var_909 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_739 = ITextWindow(this.find("room_desc"));
         this.var_1143 = ITextWindow(this.find("public_space_desc"));
         this.var_910 = ITextWindow(this.find("owner_caption"));
         this.var_742 = ITextWindow(this.find("rating_caption"));
         this.var_1411 = ITextWindow(this.find("rating_txt"));
         this.var_252 = IWindowContainer(this.find("event_info"));
         this.var_741 = IWindowContainer(this.find("event_details"));
         this.var_1408 = IWindowContainer(this.find("event_buttons"));
         this.var_1714 = ITextWindow(this.find("event_name"));
         this.var_596 = ITextWindow(this.find("event_desc"));
         this.var_1145 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1146 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_1713 = this.find("staff_pick_button");
         this.var_1147 = IContainerButtonWindow(this.find("add_favourite_button"));
         this._remFavouriteButton = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1148 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1409 = IButtonWindow(this.find("room_settings_button"));
         this.var_1410 = IButtonWindow(this.find("create_event_button"));
         this.var_1412 = IButtonWindow(this.find("edit_event_button"));
         this.var_740 = IWindowContainer(this.find("embed_info"));
         this.var_1144 = ITextWindow(this.find("embed_info_txt"));
         this.var_906 = ITextFieldWindow(this.find("embed_src_txt"));
         this._buttons = IWindowContainer(this.find("buttons_container"));
         this.var_738 = IButtonWindow(this.find("zoom_button"));
         Util.setProcDirectly(this.var_1147,this.onAddFavouriteClick);
         Util.setProcDirectly(this._remFavouriteButton,this.onRemoveFavouriteClick);
         Util.setProcDirectly(this.var_1409,this.onRoomSettingsClick);
         Util.setProcDirectly(this.var_1148,this.onMakeHomeClick);
         Util.setProcDirectly(this.var_1410,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1412,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_906,this.onEmbedSrcClick);
         Util.setProcDirectly(this.var_1146,this.onThumbUp);
         Util.setProcDirectly(this.var_1713,this.onStaffPick);
         Util.setProcDirectly(this.var_1145,this.onFacebookLike);
         Util.setProcDirectly(this.var_738,this.onZoomClick);
         this._navigator.refreshButton(this.var_1147,"favourite",true,null,0);
         this._navigator.refreshButton(this._remFavouriteButton,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1148,"home",true,null,0);
         this._window.findChildByTag("close").procedure = this.onCloseButtonClick;
         Util.setProcDirectly(this.var_352,this.onHover);
         Util.setProcDirectly(this.var_252,this.onHover);
         this.var_910.width = this.var_910.textWidth;
         Util.moveChildrenToRow(this.var_1716,["owner_caption","owner_name"],this.var_910.x,this.var_910.y,3);
         this.var_742.width = this.var_742.textWidth;
         Util.moveChildrenToRow(this.var_1715,["rating_caption","rating_txt"],this.var_742.x,this.var_742.y,3);
         this.var_1144.height = this.var_1144.textHeight + 5;
         Util.moveChildrenToColumn(this.var_740,["embed_info_txt","embed_src_txt"],this.var_1144.y,2);
         this.var_740.height = Util.getLowestPoint(this.var_740) + 5;
         this.var_2937 = this._window.y + this._window.height;
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function onFacebookLike(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_906.setSelection(0,this.var_906.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.events.dispatchEvent(new HabboNavigatorEvent(HabboNavigatorEvent.ZOOM_TOGGLE));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         this.var_354.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._window.visible = false;
         if(this.var_139 != null)
         {
            this.var_139.resetView();
         }
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
   }
}
