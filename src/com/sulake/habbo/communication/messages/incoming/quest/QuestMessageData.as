package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_2061:String;
      
      private var var_2854:int;
      
      private var var_2855:int;
      
      private var var_1984:int;
      
      private var _id:int;
      
      private var var_2060:Boolean;
      
      private var _type:String;
      
      private var var_2059:String;
      
      private var _rewardCurrencyAmount:int;
      
      private var var_2058:String;
      
      private var var_2856:int;
      
      private var var_2853:int;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2061 = param1.readString();
         this.var_2854 = param1.readInteger();
         this.var_2855 = param1.readInteger();
         this.var_1984 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_2060 = param1.readBoolean();
         this._type = param1.readString();
         this.var_2059 = param1.readString();
         this._rewardCurrencyAmount = param1.readInteger();
         this.var_2058 = param1.readString();
         this.var_2856 = param1.readInteger();
         this.var_2853 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this._type = "";
         this.var_2059 = "";
         this._rewardCurrencyAmount = 0;
      }
      
      public function get campaignCode() : String
      {
         return this.var_2061;
      }
      
      public function get localizationCode() : String
      {
         return this.var_2058;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_2854;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_2855;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1984;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_2060;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get imageVersion() : String
      {
         return this.var_2059;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this._rewardCurrencyAmount;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2856;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2853;
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.var_2061;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this.var_2058;
      }
      
      public function get completedCampaign() : Boolean
      {
         return this._id < 1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set accepted(param1:Boolean) : void
      {
         this.var_2060 = param1;
      }
   }
}
