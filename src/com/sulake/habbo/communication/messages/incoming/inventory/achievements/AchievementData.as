package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1097:int;
      
      private var var_329:String;
      
      private var var_1924:int;
      
      private var var_2632:int;
      
      private var var_2097:int;
      
      private var var_1925:int;
      
      private var var_1926:Boolean;
      
      private var _category:String;
      
      private var var_2631:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1097 = param1.readInteger();
         this.var_329 = param1.readString();
         this.var_1924 = Math.max(1,param1.readInteger());
         this.var_2632 = param1.readInteger();
         this.var_2097 = param1.readInteger();
         this.var_1925 = param1.readInteger();
         this.var_1926 = param1.readBoolean();
         this._category = param1.readString();
         this.var_2631 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_329;
      }
      
      public function get level() : int
      {
         return this.var_1097;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_1924;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2632;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2097;
      }
      
      public function get currentPoints() : int
      {
         return this.var_1925;
      }
      
      public function get finalLevel() : Boolean
      {
         return this.var_1926;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get levelCount() : int
      {
         return this.var_2631;
      }
      
      public function get firstLevelAchieved() : Boolean
      {
         return this.var_1097 > 1 || this.var_1926;
      }
      
      public function setMaxProgress() : void
      {
         this.var_1925 = this.var_1924;
      }
   }
}
