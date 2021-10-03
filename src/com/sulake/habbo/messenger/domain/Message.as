package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_945:int = 1;
      
      public static const const_865:int = 2;
      
      public static const const_895:int = 3;
      
      public static const const_1211:int = 4;
      
      public static const const_902:int = 5;
      
      public static const const_1276:int = 6;
       
      
      private var _type:int;
      
      private var var_1137:int;
      
      private var var_2588:String;
      
      private var var_2683:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1137 = param2;
         this.var_2588 = param3;
         this.var_2683 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2588;
      }
      
      public function get time() : String
      {
         return this.var_2683;
      }
      
      public function get senderId() : int
      {
         return this.var_1137;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
