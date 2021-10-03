package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_217:int;
      
      private var var_2448:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_217 = param1;
         this.var_2448 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_217,this.var_2448];
      }
      
      public function dispose() : void
      {
      }
   }
}
