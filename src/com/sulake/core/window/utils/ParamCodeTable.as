package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_210;
         param1["bound_to_parent_rect"] = const_99;
         param1["child_window"] = const_1268;
         param1["embedded_controller"] = const_1164;
         param1["resize_to_accommodate_children"] = WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_826;
         param1["mouse_dragging_target"] = const_269;
         param1["mouse_dragging_trigger"] = const_429;
         param1["mouse_scaling_target"] = const_301;
         param1["mouse_scaling_trigger"] = const_479;
         param1["horizontal_mouse_scaling_trigger"] = const_236;
         param1["vertical_mouse_scaling_trigger"] = const_279;
         param1["observe_parent_input_events"] = const_1283;
         param1["optimize_region_to_layout_size"] = const_614;
         param1["parent_window"] = const_1205;
         param1["relative_horizontal_scale_center"] = const_205;
         param1["relative_horizontal_scale_fixed"] = const_143;
         param1["relative_horizontal_scale_move"] = const_405;
         param1["relative_horizontal_scale_strech"] = const_430;
         param1["relative_scale_center"] = const_1136;
         param1["relative_scale_fixed"] = const_970;
         param1["relative_scale_move"] = const_1131;
         param1["relative_scale_strech"] = const_1113;
         param1["relative_vertical_scale_center"] = const_218;
         param1["relative_vertical_scale_fixed"] = const_165;
         param1["relative_vertical_scale_move"] = const_295;
         param1["relative_vertical_scale_strech"] = const_343;
         param1["on_resize_align_left"] = const_913;
         param1["on_resize_align_right"] = const_615;
         param1["on_resize_align_center"] = const_498;
         param1["on_resize_align_top"] = const_761;
         param1["on_resize_align_bottom"] = const_534;
         param1["on_resize_align_middle"] = const_507;
         param1["on_accommodate_align_left"] = const_1289;
         param1["on_accommodate_align_right"] = const_582;
         param1["on_accommodate_align_center"] = const_875;
         param1["on_accommodate_align_top"] = const_1239;
         param1["on_accommodate_align_bottom"] = const_547;
         param1["on_accommodate_align_middle"] = const_698;
         param1["route_input_events_to_parent"] = const_512;
         param1["use_parent_graphic_context"] = const_34;
         param1["draggable_with_mouse"] = const_1194;
         param1["scalable_with_mouse"] = const_1232;
         param1["reflect_horizontal_resize_to_parent"] = const_618;
         param1["reflect_vertical_resize_to_parent"] = const_489;
         param1["reflect_resize_to_parent"] = const_306;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1103;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
