package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.ITextWindow;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class TextCropper implements IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_516:TextField;
      
      private var var_936:TextFormat;
      
      private var var_2947:String = "...";
      
      private var var_2946:int = 20;
      
      public function TextCropper()
      {
         super();
         this.var_516 = new TextField();
         this.var_516.autoSize = TextFieldAutoSize.LEFT;
         this.var_936 = this.var_516.defaultTextFormat;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_516 = null;
            this._disposed = true;
         }
      }
      
      public function crop(param1:ITextWindow) : void
      {
         var _loc3_:int = 0;
         this.var_936.font = param1.fontFace;
         this.var_936.size = param1.fontSize;
         this.var_936.bold = param1.bold;
         this.var_936.italic = param1.italic;
         this.var_516.setTextFormat(this.var_936);
         this.var_516.text = param1.getLineText(0);
         var _loc2_:int = this.var_516.textWidth;
         if(_loc2_ > param1.width)
         {
            _loc3_ = this.var_516.getCharIndexAtPoint(param1.width - this.var_2946,this.var_516.textHeight / 2);
            param1.text = param1.text.slice(0,_loc3_) + this.var_2947;
         }
      }
   }
}
