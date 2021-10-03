package com.sulake.habbo.ui.widget.memenu
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPurseUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.ui.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMeMenuMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.utils.WindowToggle;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_148:String = "me_menu_top_view";
      
      public static const const_309:String = "me_menu_my_clothes_view";
      
      public static const const_1148:String = "me_menu_dance_moves_view";
      
      public static const const_708:String = "me_menu_effects_view";
      
      public static const const_808:String = "me_menu_settings_view";
      
      public static const const_679:String = "me_menu_sound_settings";
      
      private static const const_1087:Point = new Point(95,440);
       
      
      private var var_45:IMeMenuView;
      
      private var var_17:IWindowContainer;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1592:int = 0;
      
      private var var_2809:int = 0;
      
      private var var_2966:int = 0;
      
      private var var_2808:Boolean = false;
      
      private var var_2048:int = 0;
      
      private var var_1308:Boolean = false;
      
      private var var_2812:Boolean = false;
      
      private var var_560:Boolean = false;
      
      private var var_2810:Boolean = false;
      
      private var var_2811:int = 0;
      
      private var var_1751:Boolean = false;
      
      private var _config:IHabboConfigurationManager;
      
      public function MeMenuWidget(param1:IRoomWidgetHandler, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboLocalizationManager, param5:IEventDispatcher, param6:IHabboConfigurationManager)
      {
         super(param1,param2,param3,param4);
         this._config = param6;
         this._eventDispatcher = param5;
         if(param6 != null && false)
         {
            this.var_2810 = param6.getKey("client.news.embed.enabled","false") == "true";
         }
         this.changeView(const_148);
         this.hide();
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         this.hide();
         this._eventDispatcher = null;
         if(this.var_45 != null)
         {
            this.var_45.dispose();
            this.var_45 = null;
         }
         this.var_17 = null;
         this._config = null;
         super.dispose();
      }
      
      override public function get mainWindow() : IWindow
      {
         return this.var_17;
      }
      
      private function get mainContainer() : IWindowContainer
      {
         var _loc1_:* = null;
         if(this.var_17 == null)
         {
            _loc1_ = _assets.getAssetByName("memenu");
            if(_loc1_)
            {
               this.var_17 = windowManager.buildFromXML(_loc1_.content as XML) as IWindowContainer;
            }
         }
         if(this.var_17)
         {
            return this.var_17.findChildByTag("MAIN_CONTENT") as IWindowContainer;
         }
         return null;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case const_148:
               _loc2_ = new MeMenuMainView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_708:
               _loc2_ = new MeMenuEffectsView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_1148:
               _loc2_ = new MeMenuDanceView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_309:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_808:
               _loc2_ = new MeMenuSettingsMenuView();
               break;
            case const_679:
               _loc2_ = new MeMenuSoundSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(this.var_45)
            {
               this.var_45.dispose();
               this.var_45 = null;
            }
            this.var_45 = _loc2_;
            this.var_45.init(this,param1);
            this.mainContainer.removeChildAt(0);
            this.mainContainer.addChildAt(this.var_45.window,0);
            this.var_17.visible = true;
            this.var_17.activate();
         }
         this.updateSize();
      }
      
      public function updateSize() : void
      {
         var _loc1_:int = 0;
         if(this.var_45 && this.var_45.window && this.var_17)
         {
            _loc1_ = 5;
            this.var_45.window.position = new Point(_loc1_,_loc1_);
            this.mainContainer.width = this.var_45.window.width + _loc1_ * 2;
            this.mainContainer.height = this.var_45.window.height + _loc1_ * 2;
            this.var_17.x = const_1087.x;
            this.var_17.y = 0 - this.mainContainer.height;
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_719,this.onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_740,this.onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_932,this.onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_975,this.onToolbarClicked);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_778,this.onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_881,this.onHideAvatarEditor);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_145,this.onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_285,this.onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_727,this.onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_131,this.onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_381,this.onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_118,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_466,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetPurseUpdateEvent.const_72,this.onCreditBalance);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_96,this.onNormalMode);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_409,this.onGameMode);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_719,this.onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_740,this.onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_932,this.onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_975,this.onToolbarClicked);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_145,this.onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_285,this.onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_727,this.onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_778,this.onHideAvatarEditor);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_881,this.onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_131,this.onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_381,this.onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_466,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_118,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetPurseUpdateEvent.const_72,this.onCreditBalance);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_96,this.onNormalMode);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_96,this.onGameMode);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         if(this.var_45 != null)
         {
            this.var_17.removeChild(this.var_45.window);
            this.var_45.dispose();
            this.var_45 = null;
         }
         this.var_17.visible = false;
         this.var_560 = false;
         this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(this.var_560 && this.var_45.window.name == const_309))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_922);
            if(messageListener != null)
            {
               if(!this.var_1751)
               {
                  messageListener.processWidgetMessage(_loc2_);
               }
            }
         }
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!this.var_560)
         {
            return;
         }
         if(this.var_45.window.name == const_679)
         {
            (this.var_45 as MeMenuSoundSettingsView).updateSettings(param1);
         }
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_466:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + this.var_560 + " view: " + this.var_45.window.name);
               if(this.var_560 != true || this.var_45.window.name != const_148)
               {
                  return;
               }
               (this.var_45 as MeMenuMainView).setIconAssets("clothes_icon",const_148,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_118:
               this.hide();
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(this.var_560)
         {
            if(this.var_17 != null && WindowToggle.isHiddenByOtherWindows(this.var_17))
            {
               this.var_17.activate();
               return;
            }
            this.var_560 = false;
         }
         else
         {
            this.var_560 = true;
         }
         if(this.var_560)
         {
            _loc2_ = new RoomWidgetMeMenuMessage(RoomWidgetMeMenuMessage.const_911);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
            this.changeView(const_148);
         }
         else
         {
            this.hide();
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         this.var_1308 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               this.var_1308 = true;
            }
         }
         if(this.var_45 != null && this.var_45.window.name == const_708)
         {
            (this.var_45 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(this.var_45 != null && this.var_45.window.name != const_309)
         {
            this.hide();
         }
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_45 != null && this.var_45.window.name == const_309)
         {
            this.changeView(const_148);
         }
      }
      
      private function onHideAvatarEditor(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_45 != null && this.var_45.window.name == const_309)
         {
            this.changeView(const_148);
         }
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = param1.daysLeft != this.var_1592;
         this.var_1592 = param1.daysLeft;
         this.var_2809 = param1.periodsLeft;
         this.var_2966 = param1.pastPeriods;
         this.var_2808 = param1.allowClubDances;
         _loc2_ = Boolean(_loc2_ || param1.clubLevel != this.var_2048);
         this.var_2048 = param1.clubLevel;
         if(_loc2_)
         {
            if(this.var_45 != null)
            {
               this.changeView(this.var_45.window.name);
            }
         }
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               this.var_1308 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               this.var_1308 = false;
         }
      }
      
      private function onCreditBalance(param1:RoomWidgetPurseUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.var_2811 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",this.var_2811.toString());
      }
      
      private function onNormalMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1751 = false;
      }
      
      private function onGameMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1751 = true;
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return this.var_2808;
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return this.var_1592 > 0;
      }
      
      public function get habboClubDays() : int
      {
         return this.var_1592;
      }
      
      public function get habboClubPeriods() : int
      {
         return this.var_2809;
      }
      
      public function get habboClubLevel() : int
      {
         return this.var_2048;
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return this.var_2810;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return this.var_1308;
      }
      
      public function get isDancing() : Boolean
      {
         return this.var_2812;
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         this.var_2812 = param1;
      }
   }
}
