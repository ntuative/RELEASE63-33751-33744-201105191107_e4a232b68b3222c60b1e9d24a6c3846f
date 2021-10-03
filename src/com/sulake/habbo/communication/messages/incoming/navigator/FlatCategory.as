package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1996:int;
      
      private var var_2660:String;
      
      private var var_292:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1996 = param1.readInteger();
         this.var_2660 = param1.readString();
         this.var_292 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1996;
      }
      
      public function get nodeName() : String
      {
         return this.var_2660;
      }
      
      public function get visible() : Boolean
      {
         return this.var_292;
      }
   }
}
