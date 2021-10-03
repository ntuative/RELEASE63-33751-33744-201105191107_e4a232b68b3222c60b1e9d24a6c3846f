package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarSleepUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1917:Boolean;
      
      public function RoomObjectAvatarSleepUpdateMessage(param1:Boolean = false)
      {
         super();
         this.var_1917 = param1;
      }
      
      public function get isSleeping() : Boolean
      {
         return this.var_1917;
      }
   }
}
