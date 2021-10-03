package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2692:String;
      
      private var var_1953:String;
      
      private var var_2693:String;
      
      private var var_1951:Boolean;
      
      private var var_1952:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2692 = String(param1["set-type"]);
         this.var_1953 = String(param1["flipped-set-type"]);
         this.var_2693 = String(param1["remove-set-type"]);
         this.var_1951 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1952 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1952;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1952 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2692;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1953;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2693;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1951;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1951 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1953 = param1;
      }
   }
}
