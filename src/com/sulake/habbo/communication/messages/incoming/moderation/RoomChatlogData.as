package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomChatlogData
   {
       
      
      private var var_1920:Boolean;
      
      private var _roomId:int;
      
      private var var_907:String;
      
      private var var_1921:Array;
      
      public function RoomChatlogData(param1:IMessageDataWrapper)
      {
         this.var_1921 = new Array();
         super();
         this.var_1920 = param1.readBoolean();
         this._roomId = param1.readInteger();
         this.var_907 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1921.push(new ChatlineData(param1));
            _loc3_++;
         }
         Logger.log("READ ROOMCHATLOGDATA: " + this.var_1920 + ", " + this._roomId + ", " + this.var_907 + ", " + this.chatlog.length);
      }
      
      public function get isPublic() : Boolean
      {
         return this.var_1920;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_907;
      }
      
      public function get chatlog() : Array
      {
         return this.var_1921;
      }
   }
}
