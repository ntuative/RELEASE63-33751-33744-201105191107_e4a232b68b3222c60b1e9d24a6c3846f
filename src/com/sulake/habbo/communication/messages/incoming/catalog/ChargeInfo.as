package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2191:int;
      
      private var var_2193:int;
      
      private var var_1276:int;
      
      private var var_1277:int;
      
      private var var_1984:int;
      
      private var var_2192:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2191 = param1.readInteger();
         this.var_2193 = param1.readInteger();
         this.var_1276 = param1.readInteger();
         this.var_1277 = param1.readInteger();
         this.var_1984 = param1.readInteger();
         this.var_2192 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2191;
      }
      
      public function get charges() : int
      {
         return this.var_2193;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1276;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1277;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2192;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1984;
      }
   }
}
