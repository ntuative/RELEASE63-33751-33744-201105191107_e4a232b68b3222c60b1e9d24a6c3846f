package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_529:int = 0;
      
      public static const const_212:int = 1;
      
      public static const const_123:int = 2;
      
      public static const const_851:Array = ["open","closed","password"];
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1640:String;
      
      private var var_2576:int;
      
      private var var_1469:int;
      
      private var var_2721:int;
      
      private var var_2714:int;
      
      private var var_871:Array;
      
      private var var_2720:Array;
      
      private var var_2718:int;
      
      private var var_2643:Boolean;
      
      private var var_2716:Boolean;
      
      private var var_2715:Boolean;
      
      private var var_2719:Boolean;
      
      private var var_2717:int;
      
      private var var_2713:int;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2643;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2643 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2716;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2716 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2715;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2715 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2719;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2719 = param1;
      }
      
      public function get wallThickness() : int
      {
         return this.var_2717;
      }
      
      public function set wallThickness(param1:int) : void
      {
         this.var_2717 = param1;
      }
      
      public function get floorThickness() : int
      {
         return this.var_2713;
      }
      
      public function set floorThickness(param1:int) : void
      {
         this.var_2713 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1640;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1640 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2576;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2576 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1469;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1469 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2721;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2721 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2714;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2714 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_871;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_871 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2720;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2720 = param1;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2718;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2718 = param1;
      }
   }
}
