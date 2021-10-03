package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_131:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_136:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_878:int = 2;
      
      public static const const_921:int = 3;
      
      public static const const_1827:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1820:String = "";
      
      private var var_2262:int;
      
      private var var_2265:int = 0;
      
      private var var_2263:int = 0;
      
      private var var_618:String = "";
      
      private var var_46:BitmapData = null;
      
      private var var_283:Array;
      
      private var var_1394:int = 0;
      
      private var var_2462:String = "";
      
      private var var_2463:int = 0;
      
      private var var_2464:int = 0;
      
      private var var_1660:Boolean = false;
      
      private var var_1818:String = "";
      
      private var var_2799:Boolean = false;
      
      private var var_2794:Boolean = true;
      
      private var var_1268:int = 0;
      
      private var var_2793:Boolean = false;
      
      private var var_2797:Boolean = false;
      
      private var var_2792:Boolean = false;
      
      private var var_2796:Boolean = false;
      
      private var var_2795:Boolean = false;
      
      private var var_2798:Boolean = false;
      
      private var var_2800:int = 0;
      
      private var var_1661:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_283 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1820 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1820;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2262 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2262;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2265 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2265;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2263 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2263;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_618 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_618;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_46 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_283 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_283;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1394 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1394;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2462 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2462;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2799 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2799;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1268 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1268;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2793 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2793;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2797 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2797;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2792 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2792;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2796 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2796;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2795 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2795;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2798 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2798;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2800 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2800;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2794 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2794;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1661 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1661;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2463 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2463;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2464 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2464;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1660 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1660;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1818 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1818;
      }
   }
}
