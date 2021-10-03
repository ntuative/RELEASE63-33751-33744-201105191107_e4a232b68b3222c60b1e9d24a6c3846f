package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetAvatarInfoEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectNameEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserDataUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserLocationUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetGetUserLocationMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class AvatarInfoWidget extends RoomWidgetBase implements IUpdateReceiver
   {
       
      
      private var var_23:Component;
      
      private var var_195:IHabboConfigurationManager;
      
      private var _view:AvatarInfoView;
      
      private var var_196:Boolean = false;
      
      private var var_1751:Boolean = false;
      
      private var var_1168:Timer;
      
      private var var_2940:int = 3000;
      
      private var var_1427:Boolean;
      
      private var var_924:Boolean;
      
      private var _blend:Number;
      
      private var var_1428:int;
      
      private var var_2941:int = 500;
      
      private var var_295:AvatarInfoData;
      
      private var var_2362:Boolean;
      
      private var var_1750:int = -1;
      
      private var var_2939:Boolean;
      
      private var var_754:AvatarInfoView;
      
      private var var_755:AvatarMenuView;
      
      public function AvatarInfoWidget(param1:IRoomWidgetHandler, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboConfigurationManager, param5:IHabboLocalizationManager, param6:Component)
      {
         super(param1,param2,param3,param5);
         this.var_23 = param6;
         this.var_195 = param4;
         this.var_1427 = false;
         this.var_924 = false;
         this.var_1168 = new Timer(this.var_2940,1);
         this.var_1168.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this.var_295 = new AvatarInfoData();
         this.var_2362 = Boolean(this.var_195.getBoolean("menu.avatar.enabled",false));
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_195;
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this.var_924 = true;
         this.var_1428 = 0;
      }
      
      private function getOwnCharacterInfo() : void
      {
         messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_912,0,0));
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(this.var_23)
         {
            this.var_23.removeUpdateReceiver(this);
            this.var_23 = null;
         }
         if(this.var_754)
         {
            this.var_754.dispose();
            this.var_754 = null;
         }
         if(this.var_755)
         {
            this.var_755.dispose();
            this.var_755 = null;
         }
         this._view = null;
         this.var_195 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetAvatarInfoEvent.const_125,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_131,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_136,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_145,this.updateEventHandler);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_349,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.const_107,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserDataUpdateEvent.const_130,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_171,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_96,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_409,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectNameEvent.const_525,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_919,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_406,this.updateEventHandler);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetAvatarInfoEvent.const_125,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_131,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_136,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_145,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_349,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.const_107,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserDataUpdateEvent.const_130,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_171,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_96,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_409,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectNameEvent.const_525,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_406,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_406,this.updateEventHandler);
      }
      
      private function updateEventHandler(param1:RoomWidgetUpdateEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(param1.type)
         {
            case RoomWidgetAvatarInfoEvent.const_125:
               _loc2_ = param1 as RoomWidgetAvatarInfoEvent;
               this.updateView(_loc2_.userId,_loc2_.userName,_loc2_.roomIndex,RoomObjectTypeEnum.const_157,_loc2_.allowNameChange,null);
               this.var_196 = true;
               break;
            case RoomWidgetRoomObjectNameEvent.const_525:
               if(RoomWidgetRoomObjectNameEvent(param1).category == RoomObjectCategoryEnum.const_33)
               {
                  this.updateView(RoomWidgetRoomObjectNameEvent(param1).userId,RoomWidgetRoomObjectNameEvent(param1).userName,RoomWidgetRoomObjectNameEvent(param1).roomIndex,RoomObjectTypeEnum.const_157,false,null);
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_145:
            case RoomWidgetFurniInfoUpdateEvent.const_349:
               this.removeView();
               break;
            case RoomWidgetUserInfoUpdateEvent.const_131:
               this.getOwnCharacterInfo();
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_919:
               if(!(this._view is AvatarMenuView))
               {
                  this.var_1750 = RoomWidgetRoomObjectUpdateEvent(param1).id;
                  messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_982,RoomWidgetRoomObjectUpdateEvent(param1).id,RoomWidgetRoomObjectUpdateEvent(param1).category));
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_406:
               if(!(this._view is AvatarMenuView))
               {
                  if(RoomWidgetRoomObjectUpdateEvent(param1).id == this.var_1750)
                  {
                     if(this._view && !this._view.allowNameChange)
                     {
                        this.removeView();
                        this.var_1750 = -1;
                     }
                  }
               }
               break;
            case RoomWidgetUserInfoUpdateEvent.const_136:
               _loc3_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.var_295.amIAnyRoomController = _loc3_.amIAnyRoomController;
               this.var_295.amIController = _loc3_.amIController;
               this.var_295.amIOwner = _loc3_.amIOwner;
               this.var_295.canBeAskedAsFriend = _loc3_.canBeAskedAsFriend;
               this.var_295.canBeKicked = _loc3_.canBeKicked;
               this.var_295.canTrade = _loc3_.canTrade;
               this.var_295.canTradeReason = _loc3_.canTradeReason;
               this.var_295.hasFlatControl = _loc3_.hasFlatControl;
               this.var_295.isIgnored = _loc3_.isIgnored;
               this.var_295.respectLeft = _loc3_.respectLeft;
               this.updateView(_loc3_.webID,_loc3_.name,_loc3_.userRoomId,RoomObjectTypeEnum.const_157,false,!!_loc3_.isSpectatorMode ? null : this.var_295);
               break;
            case RoomWidgetUserInfoUpdateEvent.BOT:
               _loc4_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.updateView(_loc4_.webID,_loc4_.name,_loc4_.userRoomId,RoomObjectTypeEnum.const_545,false,null);
               break;
            case RoomWidgetPetInfoUpdateEvent.const_107:
               _loc5_ = param1 as RoomWidgetPetInfoUpdateEvent;
               this.updateView(_loc5_.id,_loc5_.name,_loc5_.roomIndex,RoomObjectTypeEnum.const_215,false,null);
               break;
            case RoomWidgetUserDataUpdateEvent.const_130:
               if(!this.var_196)
               {
                  this.getOwnCharacterInfo();
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_171:
               _loc6_ = param1 as RoomWidgetRoomObjectUpdateEvent;
               if(this._view && this._view.roomIndex == _loc6_.id)
               {
                  this.disposeView();
               }
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_96:
               this.var_1751 = false;
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_409:
               this.var_1751 = true;
         }
         this.checkUpdateNeed();
      }
      
      private function updateView(param1:int, param2:String, param3:int, param4:int, param5:Boolean, param6:AvatarInfoData) : void
      {
         this.var_924 = false;
         if(this.var_1168.running)
         {
            this.var_1168.stop();
         }
         var _loc7_:Boolean = param6 != null && this.var_2362;
         if(_loc7_ && !(this._view is AvatarMenuView))
         {
            this.disposeView();
         }
         if(this._view == null || this._view.userId != param1 || this._view.userName != param2 || this._view.roomIndex != param3 || this._view.userType != param4 || param5)
         {
            if(this._view)
            {
               this.disposeView();
            }
            if(!this.var_1751)
            {
               if(_loc7_)
               {
                  if(!this.var_755)
                  {
                     this.var_755 = new AvatarMenuView(this);
                  }
                  this._view = this.var_755;
                  AvatarMenuView.setup(this._view as AvatarMenuView,param1,param2,param3,param4,param6);
               }
               else
               {
                  if(!this.var_754)
                  {
                     this.var_754 = new AvatarInfoView(this);
                  }
                  this._view = this.var_754;
                  AvatarInfoView.setup(this._view,param1,param2,param3,param4,param5);
               }
            }
         }
         else if(this._view is AvatarMenuView)
         {
            if(this._view.userName == param2)
            {
               this.disposeView();
            }
         }
      }
      
      public function disposeView() : void
      {
         if(this._view)
         {
            if(this.var_2939)
            {
               this._view.hide();
            }
            else
            {
               this._view.dispose();
               this.var_754 = null;
               this.var_755 = null;
            }
            this._view = null;
            this.var_1427 = true;
            this.var_924 = false;
         }
      }
      
      public function removeView() : void
      {
         if(!this.var_1427)
         {
            this.var_1427 = true;
            this.var_1168.start();
         }
         else if(!this.var_924)
         {
            this.disposeView();
         }
      }
      
      public function checkUpdateNeed() : void
      {
         if(!this.var_23)
         {
            return;
         }
         if(this._view)
         {
            this.var_23.registerUpdateReceiver(this,10);
         }
         else
         {
            this.var_23.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(!this._view)
         {
            return;
         }
         _loc2_ = messageListener.processWidgetMessage(new RoomWidgetGetUserLocationMessage(this._view.userId,this._view.userType)) as RoomWidgetUserLocationUpdateEvent;
         if(!_loc2_)
         {
            return;
         }
         if(this.var_924)
         {
            this.var_1428 += param1;
            this._blend = 1 - this.var_1428 / Number(this.var_2941);
         }
         else
         {
            this._blend = 1;
         }
         if(this._blend <= 0)
         {
            this.disposeView();
            return;
         }
         this._view.update(_loc2_.rectangle,_loc2_.screenLocation,this._blend);
      }
   }
}
