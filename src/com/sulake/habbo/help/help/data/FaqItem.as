package com.sulake.habbo.help.help.data
{
   public class FaqItem
   {
       
      
      private var var_1670:int;
      
      private var var_2636:String;
      
      private var var_1669:String;
      
      private var _index:int;
      
      private var _category:FaqCategory;
      
      private var var_2637:Boolean = false;
      
      public function FaqItem(param1:int, param2:String, param3:int, param4:FaqCategory)
      {
         super();
         this.var_1670 = param1;
         this.var_2636 = param2;
         this._index = param3;
         this._category = param4;
      }
      
      public function get questionId() : int
      {
         return this.var_1670;
      }
      
      public function get questionText() : String
      {
         return this.var_2636;
      }
      
      public function get answerText() : String
      {
         return this.var_1669;
      }
      
      public function get hasAnswer() : Boolean
      {
         return this.var_2637;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get category() : FaqCategory
      {
         return this._category;
      }
      
      public function set answerText(param1:String) : void
      {
         this.var_1669 = param1;
         this.var_2637 = true;
      }
   }
}
