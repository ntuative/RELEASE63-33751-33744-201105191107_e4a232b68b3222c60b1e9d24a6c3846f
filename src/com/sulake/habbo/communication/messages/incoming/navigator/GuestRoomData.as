package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_345:int;
      
      private var var_813:Boolean;
      
      private var var_907:String;
      
      private var _ownerName:String;
      
      private var var_2576:int;
      
      private var var_2405:int;
      
      private var var_2641:int;
      
      private var var_1640:String;
      
      private var var_2639:int;
      
      private var var_2574:Boolean;
      
      private var var_812:int;
      
      private var var_1469:int;
      
      private var var_2640:String;
      
      private var var_871:Array;
      
      private var var_2638:RoomThumbnailData;
      
      private var var_2643:Boolean;
      
      private var var_2642:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_871 = new Array();
         super();
         this.var_345 = param1.readInteger();
         this.var_813 = param1.readBoolean();
         this.var_907 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2576 = param1.readInteger();
         this.var_2405 = param1.readInteger();
         this.var_2641 = param1.readInteger();
         this.var_1640 = param1.readString();
         this.var_2639 = param1.readInteger();
         this.var_2574 = param1.readBoolean();
         this.var_812 = param1.readInteger();
         this.var_1469 = param1.readInteger();
         this.var_2640 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_871.push(_loc4_);
            _loc3_++;
         }
         this.var_2638 = new RoomThumbnailData(param1);
         this.var_2643 = param1.readBoolean();
         this.var_2642 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_871 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_345;
      }
      
      public function get event() : Boolean
      {
         return this.var_813;
      }
      
      public function get roomName() : String
      {
         return this.var_907;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2576;
      }
      
      public function get userCount() : int
      {
         return this.var_2405;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2641;
      }
      
      public function get description() : String
      {
         return this.var_1640;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2639;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2574;
      }
      
      public function get score() : int
      {
         return this.var_812;
      }
      
      public function get categoryId() : int
      {
         return this.var_1469;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2640;
      }
      
      public function get tags() : Array
      {
         return this.var_871;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2638;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2643;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2642;
      }
   }
}
