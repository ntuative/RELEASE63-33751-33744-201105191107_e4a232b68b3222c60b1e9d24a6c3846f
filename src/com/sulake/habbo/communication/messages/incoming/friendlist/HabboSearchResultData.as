package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2361:int;
      
      private var var_1821:String;
      
      private var var_2358:String;
      
      private var var_2359:Boolean;
      
      private var var_2355:Boolean;
      
      private var var_2357:int;
      
      private var var_2356:String;
      
      private var var_2360:String;
      
      private var var_1818:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2361 = param1.readInteger();
         this.var_1821 = param1.readString();
         this.var_2358 = param1.readString();
         this.var_2359 = param1.readBoolean();
         this.var_2355 = param1.readBoolean();
         param1.readString();
         this.var_2357 = param1.readInteger();
         this.var_2356 = param1.readString();
         this.var_2360 = param1.readString();
         this.var_1818 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2361;
      }
      
      public function get avatarName() : String
      {
         return this.var_1821;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2358;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2359;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2355;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2357;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2356;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2360;
      }
      
      public function get realName() : String
      {
         return this.var_1818;
      }
   }
}
