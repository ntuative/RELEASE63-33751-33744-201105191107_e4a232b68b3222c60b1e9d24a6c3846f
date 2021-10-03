package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var _id:int;
      
      private var var_2740:String = "";
      
      private var var_933:String;
      
      private var var_1473:Boolean;
      
      private var var_2454:Boolean = true;
      
      private var var_2741:int;
      
      private var var_2739:String;
      
      public function Breed(param1:XML)
      {
         super(param1);
         this._id = parseInt(param1.@id);
         this.var_2741 = parseInt(param1.@pattern);
         this.var_933 = String(param1.@gender);
         this.var_1473 = Boolean(parseInt(param1.@colorable));
         this.var_2740 = String(param1.@localizationKey);
         if(param1.@sellable && param1.@sellable == "0")
         {
            this.var_2454 = false;
         }
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get gender() : String
      {
         return this.var_933;
      }
      
      public function get isColorable() : Boolean
      {
         return this.var_1473;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2454;
      }
      
      public function get patternId() : int
      {
         return this.var_2741;
      }
      
      public function get avatarFigureString() : String
      {
         return this.var_2739;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         this.var_2739 = param1;
      }
      
      public function get localizationKey() : String
      {
         return this.var_2740;
      }
   }
}
