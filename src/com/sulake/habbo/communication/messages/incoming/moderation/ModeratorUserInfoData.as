package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2257:int;
      
      private var var_2252:int;
      
      private var var_777:Boolean;
      
      private var var_2254:int;
      
      private var var_2256:int;
      
      private var var_2255:int;
      
      private var var_2253:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2257 = param1.readInteger();
         this.var_2252 = param1.readInteger();
         this.var_777 = param1.readBoolean();
         this.var_2254 = param1.readInteger();
         this.var_2256 = param1.readInteger();
         this.var_2255 = param1.readInteger();
         this.var_2253 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2257;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2252;
      }
      
      public function get online() : Boolean
      {
         return this.var_777;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2254;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2256;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2255;
      }
      
      public function get banCount() : int
      {
         return this.var_2253;
      }
   }
}
