package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_933:int;
      
      private var var_777:Boolean;
      
      private var var_1971:Boolean;
      
      private var var_618:String;
      
      private var var_1469:int;
      
      private var var_1820:String;
      
      private var var_1819:String;
      
      private var var_1818:String;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1818 = param3;
         this.var_1820 = param4;
         this.var_933 = param5;
         this.var_777 = param6;
         this.var_1971 = param7;
         this.var_618 = param8;
         this.var_1469 = param9;
         this.var_1819 = param10;
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
      
      public function get allowFollow() : Boolean
      {
         return this.var_1971;
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
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_933 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_777 = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         this.var_1971 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_618 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1469 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1820 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1819 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1818 = param1;
      }
   }
}
