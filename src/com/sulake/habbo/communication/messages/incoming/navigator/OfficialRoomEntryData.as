package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1127:int = 1;
      
      public static const const_983:int = 2;
      
      public static const const_702:int = 3;
      
      public static const const_1728:int = 4;
       
      
      private var _index:int;
      
      private var var_2840:String;
      
      private var var_2844:String;
      
      private var var_2842:Boolean;
      
      private var var_2843:String;
      
      private var var_1077:String;
      
      private var var_2841:int;
      
      private var var_2405:int;
      
      private var _type:int;
      
      private var var_2284:String;
      
      private var var_1064:GuestRoomData;
      
      private var var_1065:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2840 = param1.readString();
         this.var_2844 = param1.readString();
         this.var_2842 = param1.readInteger() == 1;
         this.var_2843 = param1.readString();
         this.var_1077 = param1.readString();
         this.var_2841 = param1.readInteger();
         this.var_2405 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1127)
         {
            this.var_2284 = param1.readString();
         }
         else if(this._type == const_702)
         {
            this.var_1065 = new PublicRoomData(param1);
         }
         else if(this._type == const_983)
         {
            this.var_1064 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_1064 != null)
         {
            this.var_1064.dispose();
            this.var_1064 = null;
         }
         if(this.var_1065 != null)
         {
            this.var_1065.dispose();
            this.var_1065 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2840;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2844;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2842;
      }
      
      public function get picText() : String
      {
         return this.var_2843;
      }
      
      public function get picRef() : String
      {
         return this.var_1077;
      }
      
      public function get folderId() : int
      {
         return this.var_2841;
      }
      
      public function get tag() : String
      {
         return this.var_2284;
      }
      
      public function get userCount() : int
      {
         return this.var_2405;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_1064;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_1065;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1127)
         {
            return 0;
         }
         if(this.type == const_983)
         {
            return this.var_1064.maxUserCount;
         }
         if(this.type == const_702)
         {
            return this.var_1065.maxUsers;
         }
         return 0;
      }
   }
}
