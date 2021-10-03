package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_2587:Boolean;
      
      private var var_2583:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         this.var_2587 = Boolean(parseInt(param1.@club));
         this.var_2583 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return this.var_2587;
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_2583;
      }
   }
}
