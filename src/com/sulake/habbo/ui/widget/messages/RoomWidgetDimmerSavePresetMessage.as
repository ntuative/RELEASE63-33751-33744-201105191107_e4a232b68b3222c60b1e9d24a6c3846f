package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_741:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2279:int;
      
      private var var_2281:int;
      
      private var _color:uint;
      
      private var var_1294:int;
      
      private var var_2280:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_741);
         this.var_2279 = param1;
         this.var_2281 = param2;
         this._color = param3;
         this.var_1294 = param4;
         this.var_2280 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2279;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2281;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1294;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2280;
      }
   }
}
