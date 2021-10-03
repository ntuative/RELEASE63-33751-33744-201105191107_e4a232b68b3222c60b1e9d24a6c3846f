package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2372:String;
      
      private var var_2426:int;
      
      private var var_2294:int;
      
      private var var_2425:String;
      
      private var var_2424:int;
      
      private var var_1996:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2372 = param1.readString();
         this.var_2426 = param1.readInteger();
         this.var_2294 = param1.readInteger();
         this.var_2425 = param1.readString();
         this.var_2424 = param1.readInteger();
         this.var_1996 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2372;
      }
      
      public function get unitPort() : int
      {
         return this.var_2426;
      }
      
      public function get worldId() : int
      {
         return this.var_2294;
      }
      
      public function get castLibs() : String
      {
         return this.var_2425;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2424;
      }
      
      public function get nodeId() : int
      {
         return this.var_1996;
      }
   }
}
