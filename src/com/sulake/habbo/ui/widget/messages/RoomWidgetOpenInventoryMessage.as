package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_955:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1155:String = "inventory_effects";
      
      public static const const_1302:String = "inventory_badges";
      
      public static const const_1699:String = "inventory_clothes";
      
      public static const const_1679:String = "inventory_furniture";
       
      
      private var var_2218:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_955);
         this.var_2218 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2218;
      }
   }
}
