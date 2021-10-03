package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_785;
         param1["bitmap"] = const_985;
         param1["border"] = const_831;
         param1["border_notify"] = const_1645;
         param1["bubble"] = const_859;
         param1["bubble_pointer_up"] = const_1203;
         param1["bubble_pointer_right"] = const_1162;
         param1["bubble_pointer_down"] = const_1281;
         param1["bubble_pointer_left"] = const_1188;
         param1["button"] = const_527;
         param1["button_thick"] = const_716;
         param1["button_icon"] = const_1886;
         param1["button_group_left"] = const_828;
         param1["button_group_center"] = const_857;
         param1["button_group_right"] = const_726;
         param1["canvas"] = const_973;
         param1["checkbox"] = const_762;
         param1["closebutton"] = const_1233;
         param1["container"] = const_442;
         param1["container_button"] = const_862;
         param1["display_object_wrapper"] = const_746;
         param1["dropmenu"] = const_579;
         param1["dropmenu_item"] = const_627;
         param1["frame"] = const_379;
         param1["frame_notify"] = const_1857;
         param1["header"] = const_892;
         param1["html"] = const_1329;
         param1["icon"] = const_1219;
         param1["itemgrid"] = const_1169;
         param1["itemgrid_horizontal"] = const_586;
         param1["itemgrid_vertical"] = const_732;
         param1["itemlist"] = const_1140;
         param1["itemlist_horizontal"] = const_388;
         param1["itemlist_vertical"] = const_424;
         param1["label"] = const_908;
         param1["maximizebox"] = const_1652;
         param1["menu"] = const_1894;
         param1["menu_item"] = const_1768;
         param1["submenu"] = const_1309;
         param1["minimizebox"] = const_1895;
         param1["notify"] = const_1881;
         param1["null"] = const_977;
         param1["password"] = const_949;
         param1["radiobutton"] = const_960;
         param1["region"] = const_554;
         param1["restorebox"] = const_1749;
         param1["scaler"] = const_550;
         param1["scaler_horizontal"] = const_1632;
         param1["scaler_vertical"] = const_1727;
         param1["scrollbar_horizontal"] = const_518;
         param1["scrollbar_vertical"] = const_771;
         param1["scrollbar_slider_button_up"] = const_1248;
         param1["scrollbar_slider_button_down"] = const_1108;
         param1["scrollbar_slider_button_left"] = const_1105;
         param1["scrollbar_slider_button_right"] = const_1334;
         param1["scrollbar_slider_bar_horizontal"] = const_1282;
         param1["scrollbar_slider_bar_vertical"] = const_1109;
         param1["scrollbar_slider_track_horizontal"] = const_1279;
         param1["scrollbar_slider_track_vertical"] = const_1124;
         param1["scrollable_itemlist"] = const_1852;
         param1["scrollable_itemlist_vertical"] = WINDOW_TYPE_SCROLLABLE_ITEMLIST_VERTICAL;
         param1["scrollable_itemlist_horizontal"] = const_1217;
         param1["selector"] = const_779;
         param1["selector_list"] = const_849;
         param1["submenu"] = const_1309;
         param1["tab_button"] = const_714;
         param1["tab_container_button"] = const_1250;
         param1["tab_context"] = const_427;
         param1["tab_content"] = const_1313;
         param1["tab_selector"] = const_802;
         param1["text"] = const_707;
         param1["input"] = const_884;
         param1["toolbar"] = const_1725;
         param1["tooltip"] = const_392;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
