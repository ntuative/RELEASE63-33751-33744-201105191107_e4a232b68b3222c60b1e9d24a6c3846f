package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetFurniInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_349:String = "RWFIUE_FURNI";
       
      
      private var _id:int = 0;
      
      private var _category:int = 0;
      
      private var _name:String = "";
      
      private var var_1640:String = "";
      
      private var var_46:BitmapData = null;
      
      private var var_2676:Boolean = false;
      
      private var var_2677:Boolean = false;
      
      private var var_1661:Boolean = false;
      
      private var var_1662:Boolean = false;
      
      private var var_2178:Boolean = false;
      
      private var var_1932:int = -1;
      
      private var var_2655:int = -1;
      
      private var var_1109:int = -1;
      
      private var var_1251:String = "";
      
      public function RoomWidgetFurniInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set category(param1:int) : void
      {
         this._category = param1;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1640 = param1;
      }
      
      public function get description() : String
      {
         return this.var_1640;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_46 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function set isWallItem(param1:Boolean) : void
      {
         this.var_2676 = param1;
      }
      
      public function get isWallItem() : Boolean
      {
         return this.var_2676;
      }
      
      public function set isStickie(param1:Boolean) : void
      {
         this.var_2677 = param1;
      }
      
      public function get isStickie() : Boolean
      {
         return this.var_2677;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1661 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1661;
      }
      
      public function set isRoomController(param1:Boolean) : void
      {
         this.var_1662 = param1;
      }
      
      public function get isRoomController() : Boolean
      {
         return this.var_1662;
      }
      
      public function set isAnyRoomController(param1:Boolean) : void
      {
         this.var_2178 = param1;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         return this.var_2178;
      }
      
      public function set expiration(param1:int) : void
      {
         this.var_1932 = param1;
      }
      
      public function get expiration() : int
      {
         return this.var_1932;
      }
      
      public function set catalogPageId(param1:int) : void
      {
         this.var_2655 = param1;
      }
      
      public function get catalogPageId() : int
      {
         return this.var_2655;
      }
      
      public function set offerId(param1:int) : void
      {
         this.var_1109 = param1;
      }
      
      public function get offerId() : int
      {
         return this.var_1109;
      }
      
      public function set extraParam(param1:String) : void
      {
         this.var_1251 = param1;
      }
      
      public function get extraParam() : String
      {
         return this.var_1251;
      }
   }
}
