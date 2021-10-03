package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2907:int;
      
      private var var_2906:int;
      
      private var var_2905:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2907 = param1;
         this.var_2906 = param2;
         this.var_2905 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2907,this.var_2906,this.var_2905];
      }
      
      public function dispose() : void
      {
      }
   }
}
