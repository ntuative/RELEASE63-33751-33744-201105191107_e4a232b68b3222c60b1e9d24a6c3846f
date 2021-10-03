package com.sulake.habbo.ui.widget.roomchat
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollableWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class RoomChatHistoryViewer implements IDisposable
   {
      
      private static const const_1519:int = 18;
      
      private static const SCROLLBAR_WIDTH:int = 20;
      
      public static const const_1104:int = 3;
       
      
      private var var_190:RoomChatHistoryPulldown;
      
      private var var_458:Boolean = false;
      
      private var var_457:Number = -1;
      
      private var var_50:IScrollbarWindow;
      
      private var var_670:Number = 1;
      
      private var var_2076:Boolean = false;
      
      private var _widget:RoomChatWidget;
      
      private var var_1084:Boolean = false;
      
      private var var_1987:Boolean = false;
      
      private var var_1986:Boolean = false;
      
      public function RoomChatHistoryViewer(param1:RoomChatWidget, param2:IHabboWindowManager, param3:IWindowContainer, param4:IAssetLibrary)
      {
         super();
         this.var_1084 = false;
         this._widget = param1;
         this.var_190 = new RoomChatHistoryPulldown(param1,param2,param3,param4);
         this.var_190.state = RoomChatHistoryPulldown.const_252;
         var _loc5_:IItemListWindow = param3.getChildByName("chat_contentlist") as IItemListWindow;
         if(_loc5_ == null)
         {
            return;
         }
         param3.removeChild(_loc5_);
         param3.addChild(_loc5_);
         this.var_50 = param2.createWindow("chatscroller","",HabboWindowType.const_1159,HabboWindowStyle.const_46,0 | 0,new Rectangle(param3.rectangle.right - SCROLLBAR_WIDTH,param3.y,SCROLLBAR_WIDTH,param3.height - 0),null,0) as IScrollbarWindow;
         param3.addChild(this.var_50);
         this.var_50.visible = false;
         this.var_50.scrollable = _loc5_ as IScrollableWindow;
      }
      
      public function set disabled(param1:Boolean) : void
      {
         this.var_2076 = param1;
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(this.var_190 == null)
         {
            return;
         }
         this.var_190.state = param1 == true ? 0 : int(RoomChatHistoryPulldown.const_252);
      }
      
      public function get active() : Boolean
      {
         return this.var_458;
      }
      
      public function get scrollbarWidth() : Number
      {
         return !!this.var_458 ? Number(SCROLLBAR_WIDTH) : Number(0);
      }
      
      public function get pulldownBarHeight() : Number
      {
         return RoomChatHistoryPulldown.const_84;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1084;
      }
      
      public function get visible() : Boolean
      {
         if(this.var_190 == null)
         {
            return false;
         }
         return this.var_190.state == RoomChatHistoryPulldown.const_440 || this.var_190.state == RoomChatHistoryPulldown.const_596;
      }
      
      public function dispose() : void
      {
         this.hideHistoryViewer();
         if(this.var_50 != null)
         {
            this.var_50.dispose();
            this.var_50 = null;
         }
         if(this.var_190 != null)
         {
            this.var_190.dispose();
            this.var_190 = null;
         }
         this.var_1084 = true;
      }
      
      public function update(param1:uint) : void
      {
         if(this.var_190 != null)
         {
            this.var_190.update(param1);
         }
         this.moveHistoryScroll();
      }
      
      public function toggleHistoryViewer() : void
      {
         if(this.var_458)
         {
            this.hideHistoryViewer();
         }
         else
         {
            this.showHistoryViewer();
         }
      }
      
      public function hideHistoryViewer() : void
      {
         this.var_670 = 1;
         this.cancelDrag();
         this.var_458 = false;
         this.setHistoryViewerScrollbar(false);
         this.var_190.state = RoomChatHistoryPulldown.const_252;
         if(this._widget != null)
         {
            this._widget.resetArea();
            this._widget.enableDragTooltips();
         }
      }
      
      public function showHistoryViewer() : void
      {
         if(!this.var_458 && !this.var_2076)
         {
            this.var_458 = true;
            this.setHistoryViewerScrollbar(true);
            this.var_190.state = RoomChatHistoryPulldown.const_440;
            if(this._widget != null)
            {
               this._widget.reAlignItemsToHistoryContent();
               this._widget.disableDragTooltips();
            }
         }
      }
      
      private function setHistoryViewerScrollbar(param1:Boolean) : void
      {
         if(this.var_50 != null)
         {
            this.var_50.visible = param1;
            if(param1)
            {
               this.var_50.scrollV = 1;
               this.var_670 = 1;
            }
            else
            {
               this.var_458 = false;
               this.var_457 = -1;
            }
         }
      }
      
      public function containerResized(param1:Rectangle, param2:Boolean = false) : void
      {
         if(this.var_50 != null)
         {
            this.var_50.x = param1.x + param1.width - this.var_50.width;
            this.var_50.y = param1.y;
            this.var_50.height = param1.height - 0;
            if(param2)
            {
               this.var_50.scrollV = this.var_670;
            }
         }
         if(this.var_190 != null)
         {
            this.var_190.containerResized(param1);
         }
      }
      
      private function processDrag(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         if(this.var_457 > 0 && param2)
         {
            if(this.var_1986)
            {
               if(Math.abs(param1 - this.var_457) <= const_1104)
               {
                  return;
               }
               this.var_1986 = false;
            }
            if(!this.var_458)
            {
               this._widget.resizeContainerToLowestItem();
               this.showHistoryViewer();
               this.moveHistoryScroll();
            }
            if(this.var_458)
            {
               this.moveHistoryScroll();
               _loc4_ = this.var_50.scrollable.scrollableRegion.height / this.var_50.scrollable.visibleRegion.height;
               _loc5_ = (param1 - this.var_457) / this.var_50.height;
               _loc3_ = this.var_670 - _loc5_ / _loc4_;
               _loc3_ = Math.max(0,_loc3_);
               _loc3_ = Math.min(1,_loc3_);
               _loc6_ = param1 - this.var_457;
               _loc7_ = true;
               _loc8_ = true;
               if(this.var_50.scrollV < 1 - const_1519 / this.var_50.scrollable.scrollableRegion.height)
               {
                  _loc8_ = false;
               }
               if(_loc8_ || this.var_1987)
               {
                  this._widget.stretchAreaBottomBy(_loc6_);
                  _loc7_ = false;
                  this.var_50.scrollV = 1;
               }
               if(_loc7_)
               {
                  this.var_670 = _loc3_;
               }
               this.var_457 = param1;
            }
         }
         else
         {
            this.var_457 = -1;
         }
      }
      
      public function beginDrag(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         this.var_457 = param1;
         this.var_1987 = param2;
         this.var_1986 = true;
         if(this.var_50 != null)
         {
            this.var_670 = this.var_50.scrollV;
         }
         if(this.var_50 != null)
         {
            _loc3_ = this.var_50.context.getDesktopWindow().getDisplayObject();
            if(_loc3_ != null)
            {
               _loc4_ = _loc3_.stage;
               if(_loc4_ != null)
               {
                  _loc4_.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
                  _loc4_.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
               }
            }
         }
      }
      
      public function cancelDrag() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         this.var_457 = -1;
         if(this.var_50 != null)
         {
            _loc1_ = this.var_50.context.getDesktopWindow().getDisplayObject();
            if(_loc1_ != null)
            {
               _loc2_ = _loc1_.stage;
               if(_loc2_ != null)
               {
                  _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
                  _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
               }
            }
         }
      }
      
      private function moveHistoryScroll() : void
      {
         if(!this.var_458)
         {
            return;
         }
         if(this.var_457 == -1)
         {
            return;
         }
         if(this.var_1987)
         {
            return;
         }
         var _loc1_:Number = this.var_670 - this.var_50.scrollV;
         if(_loc1_ == 0)
         {
            return;
         }
         if(Math.abs(_loc1_) < 0.01)
         {
            this.var_50.scrollV = this.var_670;
         }
         else
         {
            this.var_50.scrollV += _loc1_ / 2;
         }
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         this.cancelDrag();
         if(this._widget != null)
         {
            this._widget.mouseUp();
         }
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         this.processDrag(param1.stageY,param1.buttonDown);
      }
   }
}
