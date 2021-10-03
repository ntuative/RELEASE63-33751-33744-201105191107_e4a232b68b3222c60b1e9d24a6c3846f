package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1097:int;
      
      private var var_1778:int;
      
      private var var_2632:int;
      
      private var var_2097:int;
      
      private var var_1613:int;
      
      private var var_2322:String = "";
      
      private var var_2852:String = "";
      
      private var var_2851:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1097 = param1.readInteger();
         this.var_2322 = param1.readString();
         this.var_1778 = param1.readInteger();
         this.var_2632 = param1.readInteger();
         this.var_2097 = param1.readInteger();
         this.var_1613 = param1.readInteger();
         this.var_2851 = param1.readInteger();
         this.var_2852 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1097;
      }
      
      public function get points() : int
      {
         return this.var_1778;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2632;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2097;
      }
      
      public function get method_2() : int
      {
         return this.var_1613;
      }
      
      public function get badgeID() : String
      {
         return this.var_2322;
      }
      
      public function get achievementID() : int
      {
         return this.var_2851;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2852;
      }
   }
}
