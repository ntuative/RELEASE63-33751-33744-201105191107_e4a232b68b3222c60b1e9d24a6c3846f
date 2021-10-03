package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.habbo.utils.FixedSizeStack;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AvatarInfoView
   {
      
      private static const const_1486:int = 25;
      
      private static const const_1050:int = 3;
       
      
      protected var _window:IWindowContainer;
      
      protected var _widget:AvatarInfoWidget;
      
      protected var _userId:int;
      
      protected var _userName:String;
      
      protected var var_1621:int;
      
      protected var var_2147:Boolean;
      
      protected var var_2387:int;
      
      protected var var_1356:Boolean;
      
      protected var var_2148:FixedSizeStack;
      
      protected var var_2146:int = -1000000;
      
      public function AvatarInfoView(param1:AvatarInfoWidget)
      {
         this.var_2148 = new FixedSizeStack(const_1486);
         super();
         this._widget = param1;
      }
      
      public static function setup(param1:AvatarInfoView, param2:int, param3:String, param4:int, param5:int, param6:Boolean = false) : void
      {
         param1._userId = param2;
         param1._userName = param3;
         param1.var_1621 = param5;
         param1.var_2387 = param4;
         param1.var_2147 = param6;
         param1.updateWindow();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userType() : int
      {
         return this.var_1621;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2387;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get allowNameChange() : Boolean
      {
         return this.var_2147;
      }
      
      public function dispose() : void
      {
         this._widget = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      protected function addMouseClickListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
         }
      }
      
      protected function updateWindow() : void
      {
         var _loc2_:* = null;
         if(!this._widget || !this._widget.assets || !this._widget.windowManager)
         {
            return;
         }
         if(!this._window)
         {
            _loc2_ = this._widget.assets.getAssetByName("avatar_info_widget").content as XML;
            this._window = this._widget.windowManager.buildFromXML(_loc2_,0) as IWindowContainer;
            if(!this._window)
            {
               return;
            }
            this.setImageAsset(this._window.findChildByName("pointer") as IBitmapWrapperWindow,"arrow_down_gray");
            this.setImageAsset(this._window.findChildByName("pen_icon") as IBitmapWrapperWindow,"edit_pen_icon");
         }
         var _loc1_:IWindow = this._window.findChildByName("name");
         _loc1_.caption = this._userName;
         if(!this.var_2147)
         {
            this._window.findChildByName("change_name_container").visible = false;
            this._window.findChildByName("border").height = 22;
            this._window.findChildByName("border").width = _loc1_.width + 16;
         }
         else
         {
            this.addMouseClickListener(this._window.findChildByName("change_name_container"),this.clickHandler);
         }
      }
      
      protected function clickHandler(param1:WindowMouseEvent) : void
      {
         this._widget.messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_854));
         this._widget.disposeView();
      }
      
      public function setImageAsset(param1:IBitmapWrapperWindow, param2:String) : void
      {
         if(!param1 || !this._widget || !this._widget.assets)
         {
            return;
         }
         var _loc3_:BitmapDataAsset = this._widget.assets.getAssetByName(param2) as BitmapDataAsset;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         if(!_loc4_)
         {
            return;
         }
         if(param1.bitmap)
         {
            param1.bitmap.fillRect(param1.bitmap.rect,0);
         }
         else
         {
            param1.bitmap = new BitmapData(param1.width,param1.height,true,0);
         }
         param1.bitmap.draw(_loc4_);
      }
      
      public function show() : void
      {
         if(this._window != null)
         {
            this._widget.windowManager.getDesktop(0).addChild(this._window);
            this._window.visible = true;
            this._window.activate();
         }
      }
      
      public function hide() : void
      {
         if(this._window != null)
         {
            this._widget.windowManager.getDesktop(0).removeChild(this._window);
            this._window.visible = false;
         }
      }
      
      public function update(param1:Rectangle, param2:Point, param3:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(!param1)
         {
            return;
         }
         if(!this._window)
         {
            this.updateWindow();
         }
         if(!this.var_1356)
         {
            _loc4_ = -this._window.height;
            if(this.var_1621 == RoomObjectTypeEnum.const_157 || this.var_1621 == RoomObjectTypeEnum.const_545)
            {
               _loc4_ += param1.height > 50 ? 25 : 0;
            }
            else
            {
               _loc4_ -= 4;
            }
            _loc5_ = param2.y - param1.top;
            this.var_2148.addValue(_loc5_);
            _loc6_ = this.var_2148.getMax();
            if(_loc6_ < this.var_2146 - const_1050)
            {
               _loc6_ = this.var_2146 - const_1050;
            }
            _loc7_ = param2.y - _loc6_;
            this.var_2146 = _loc6_;
            this._window.x = param2.x - this._window.width / 2;
            this._window.y = _loc7_ + _loc4_;
         }
         this._window.blend = param3;
         this.show();
      }
   }
}
