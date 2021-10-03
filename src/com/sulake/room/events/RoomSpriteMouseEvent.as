package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_2018:String = "";
      
      private var var_1648:String = "";
      
      private var var_2484:String = "";
      
      private var var_2480:Number = 0;
      
      private var var_2479:Number = 0;
      
      private var var_2186:Number = 0;
      
      private var var_2183:Number = 0;
      
      private var var_2478:Boolean = false;
      
      private var var_2483:Boolean = false;
      
      private var var_2481:Boolean = false;
      
      private var var_2482:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_2018 = param2;
         this.var_1648 = param3;
         this.var_2484 = param4;
         this.var_2480 = param5;
         this.var_2479 = param6;
         this.var_2186 = param7;
         this.var_2183 = param8;
         this.var_2478 = param9;
         this.var_2483 = param10;
         this.var_2481 = param11;
         this.var_2482 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_2018;
      }
      
      public function get canvasId() : String
      {
         return this.var_1648;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2484;
      }
      
      public function get screenX() : Number
      {
         return this.var_2480;
      }
      
      public function get screenY() : Number
      {
         return this.var_2479;
      }
      
      public function get localX() : Number
      {
         return this.var_2186;
      }
      
      public function get localY() : Number
      {
         return this.var_2183;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2478;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2483;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2481;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2482;
      }
   }
}
