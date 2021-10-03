package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1957:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_209:MsgWithRequestId;
      
      private var var_661:RoomEventData;
      
      private var var_2669:Boolean;
      
      private var var_2670:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2361:int;
      
      private var var_273:GuestRoomData;
      
      private var var_1017:PublicRoomShortData;
      
      private var var_2667:int;
      
      private var var_2673:Boolean;
      
      private var var_2668:int;
      
      private var var_2671:Boolean;
      
      private var var_1938:int;
      
      private var var_2674:Boolean;
      
      private var var_1390:Array;
      
      private var var_1536:Array;
      
      private var var_2666:int;
      
      private var var_1535:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1257:Boolean;
      
      private var var_2675:int;
      
      private var var_2672:Boolean;
      
      private var var_2665:int = 0;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1390 = new Array();
         this.var_1536 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_273 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_273 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_1017 = null;
         this.var_273 = null;
         this._currentRoomOwner = false;
         if(param1.privateRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_1017 = param1.publicSpace;
            this.var_661 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_661 != null)
         {
            this.var_661.dispose();
            this.var_661 = null;
         }
         if(this.var_1017 != null)
         {
            this.var_1017.dispose();
            this.var_1017 = null;
         }
         if(this.var_273 != null)
         {
            this.var_273.dispose();
            this.var_273 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_273 != null)
         {
            this.var_273.dispose();
         }
         this.var_273 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_661 != null)
         {
            this.var_661.dispose();
         }
         this.var_661 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_209 != null && this.var_209 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_209 != null && this.var_209 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_209 != null && this.var_209 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_209 = param1;
         this.var_1257 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_209 = param1;
         this.var_1257 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_209 = param1;
         this.var_1257 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_209 == null)
         {
            return;
         }
         this.var_209.dispose();
         this.var_209 = null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_209 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_209 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_209 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_661;
      }
      
      public function get avatarId() : int
      {
         return this.var_2361;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2669;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2670;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_273;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_1017;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2673;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2668;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1938;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2671;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2675;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2667;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2674;
      }
      
      public function get adIndex() : int
      {
         return this.var_2665;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2672;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2361 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2668 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2673 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2669 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2670 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2671 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1938 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2675 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2667 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2674 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2665 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2672 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1390 = param1;
         this.var_1536 = new Array();
         for each(_loc2_ in this.var_1390)
         {
            if(_loc2_.visible)
            {
               this.var_1536.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1390;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1536;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2666 = param1.limit;
         this.var_1535 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1535 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_273.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_273 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_273.flatId;
         return this.var_1938 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1535 >= this.var_2666;
      }
      
      public function startLoading() : void
      {
         this.var_1257 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1257;
      }
   }
}
