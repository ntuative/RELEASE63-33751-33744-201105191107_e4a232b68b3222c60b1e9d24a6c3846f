package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_933:int;
      
      private var var_777:Boolean;
      
      private var var_1817:Boolean;
      
      private var var_618:String;
      
      private var var_1469:int;
      
      private var var_1820:String;
      
      private var var_1819:String;
      
      private var var_1818:String;
      
      private var var_2377:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_933 = param1.readInteger();
         this.var_777 = param1.readBoolean();
         this.var_1817 = param1.readBoolean();
         this.var_618 = param1.readString();
         this.var_1469 = param1.readInteger();
         this.var_1820 = param1.readString();
         this.var_1819 = param1.readString();
         this.var_1818 = param1.readString();
         this.var_2377 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_933;
      }
      
      public function get online() : Boolean
      {
         return this.var_777;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1817;
      }
      
      public function get figure() : String
      {
         return this.var_618;
      }
      
      public function get categoryId() : int
      {
         return this.var_1469;
      }
      
      public function get motto() : String
      {
         return this.var_1820;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1819;
      }
      
      public function get realName() : String
      {
         return this.var_1818;
      }
      
      public function get facebookId() : String
      {
         return this.var_2377;
      }
   }
}
