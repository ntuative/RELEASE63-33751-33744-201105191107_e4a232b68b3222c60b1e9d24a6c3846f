package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1851:Boolean;
      
      private var var_2512:int;
      
      private var var_2514:String;
      
      private var var_345:int;
      
      private var var_2511:int;
      
      private var var_1714:String;
      
      private var var_2510:String;
      
      private var var_2513:String;
      
      private var var_871:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_871 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1851 = false;
            return;
         }
         this.var_1851 = true;
         this.var_2512 = int(_loc2_);
         this.var_2514 = param1.readString();
         this.var_345 = int(param1.readString());
         this.var_2511 = param1.readInteger();
         this.var_1714 = param1.readString();
         this.var_2510 = param1.readString();
         this.var_2513 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_871.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_871 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2512;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2514;
      }
      
      public function get flatId() : int
      {
         return this.var_345;
      }
      
      public function get eventType() : int
      {
         return this.var_2511;
      }
      
      public function get eventName() : String
      {
         return this.var_1714;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2510;
      }
      
      public function get creationTime() : String
      {
         return this.var_2513;
      }
      
      public function get tags() : Array
      {
         return this.var_871;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1851;
      }
   }
}
