package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1980:int = 1;
      
      public static const const_1875:int = 2;
       
      
      private var var_939:String;
      
      private var var_2465:int;
      
      private var var_2470:int;
      
      private var var_2468:int;
      
      private var var_2467:int;
      
      private var var_2466:Boolean;
      
      private var var_2195:Boolean;
      
      private var var_2197:int;
      
      private var var_2196:int;
      
      private var var_2469:Boolean;
      
      private var var_2471:int;
      
      private var var_2472:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_939 = param1.readString();
         this.var_2465 = param1.readInteger();
         this.var_2470 = param1.readInteger();
         this.var_2468 = param1.readInteger();
         this.var_2467 = param1.readInteger();
         this.var_2466 = param1.readBoolean();
         this.var_2195 = param1.readBoolean();
         this.var_2197 = param1.readInteger();
         this.var_2196 = param1.readInteger();
         this.var_2469 = param1.readBoolean();
         this.var_2471 = param1.readInteger();
         this.var_2472 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_939;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2465;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2470;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2468;
      }
      
      public function get responseType() : int
      {
         return this.var_2467;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2466;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2195;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2197;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2196;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2469;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2471;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2472;
      }
   }
}
