package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_2035:int;
      
      private var var_2788:int;
      
      private var var_1497:int;
      
      private var var_2787:int;
      
      private var var_113:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2035 = param1.readInteger();
         this.var_2788 = param1.readInteger();
         this.var_1497 = param1.readInteger();
         this.var_2787 = param1.readInteger();
         this.var_113 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_2035);
      }
      
      public function get callId() : int
      {
         return this.var_2035;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2788;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1497;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2787;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_113;
      }
   }
}
