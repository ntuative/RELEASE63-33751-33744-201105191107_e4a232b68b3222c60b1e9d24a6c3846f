package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_412:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1120:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1256:String = "RWOCM_PIXELS";
      
      public static const const_1303:String = "RWOCM_CREDITS";
       
      
      private var var_2422:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_412);
         this.var_2422 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2422;
      }
   }
}
