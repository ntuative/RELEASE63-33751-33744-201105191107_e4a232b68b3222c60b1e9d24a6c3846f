package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2627:int;
      
      private var var_2629:int;
      
      private var var_2630:int;
      
      private var var_2628:String;
      
      private var var_1655:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2627 = param1.readInteger();
         this.var_2629 = param1.readInteger();
         this.var_2630 = param1.readInteger();
         this.var_2628 = param1.readString();
         this.var_1655 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2627;
      }
      
      public function get minute() : int
      {
         return this.var_2629;
      }
      
      public function get chatterId() : int
      {
         return this.var_2630;
      }
      
      public function get chatterName() : String
      {
         return this.var_2628;
      }
      
      public function get msg() : String
      {
         return this.var_1655;
      }
   }
}
