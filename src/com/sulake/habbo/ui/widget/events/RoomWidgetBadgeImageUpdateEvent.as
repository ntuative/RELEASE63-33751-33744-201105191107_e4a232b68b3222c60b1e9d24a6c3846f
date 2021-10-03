package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_954:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_2322:String;
      
      private var var_2801:BitmapData;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_954,param3,param4);
         this.var_2322 = param1;
         this.var_2801 = param2;
      }
      
      public function get badgeID() : String
      {
         return this.var_2322;
      }
      
      public function get badgeImage() : BitmapData
      {
         return this.var_2801;
      }
   }
}
