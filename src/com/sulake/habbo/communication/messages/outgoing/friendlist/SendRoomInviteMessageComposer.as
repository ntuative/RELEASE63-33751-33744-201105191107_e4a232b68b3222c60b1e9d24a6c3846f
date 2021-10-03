package com.sulake.habbo.communication.messages.outgoing.friendlist
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class SendRoomInviteMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_919:Array;
      
      private var var_1655:String;
      
      public function SendRoomInviteMessageComposer(param1:String)
      {
         this.var_919 = new Array();
         super();
         this.var_1655 = param1;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(this.var_919.length);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_919.length)
         {
            _loc1_.push(this.var_919[_loc2_]);
            _loc2_++;
         }
         _loc1_.push(this.var_1655);
         return _loc1_;
      }
      
      public function addInvitedFriend(param1:int) : void
      {
         this.var_919.push(param1);
      }
      
      public function dispose() : void
      {
         this.var_919 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
