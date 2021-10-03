package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2279:int;
      
      private var var_2281:int;
      
      private var var_2728:String;
      
      private var var_2729:int;
      
      private var var_2727:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2279 = param1;
         this.var_2281 = param2;
         this.var_2728 = param3;
         this.var_2729 = param4;
         this.var_2727 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2279,this.var_2281,this.var_2728,this.var_2729,int(this.var_2727)];
      }
      
      public function dispose() : void
      {
      }
   }
}
