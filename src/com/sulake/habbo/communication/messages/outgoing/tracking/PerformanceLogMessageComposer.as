package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2527:int = 0;
      
      private var var_1570:String = "";
      
      private var var_1999:String = "";
      
      private var var_2528:String = "";
      
      private var var_2531:String = "";
      
      private var var_1853:int = 0;
      
      private var var_2529:int = 0;
      
      private var var_2532:int = 0;
      
      private var var_1571:int = 0;
      
      private var var_2530:int = 0;
      
      private var var_1569:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2527 = param1;
         this.var_1570 = param2;
         this.var_1999 = param3;
         this.var_2528 = param4;
         this.var_2531 = param5;
         if(param6)
         {
            this.var_1853 = 1;
         }
         else
         {
            this.var_1853 = 0;
         }
         this.var_2529 = param7;
         this.var_2532 = param8;
         this.var_1571 = param9;
         this.var_2530 = param10;
         this.var_1569 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2527,this.var_1570,this.var_1999,this.var_2528,this.var_2531,this.var_1853,this.var_2529,this.var_2532,this.var_1571,this.var_2530,this.var_1569];
      }
   }
}
