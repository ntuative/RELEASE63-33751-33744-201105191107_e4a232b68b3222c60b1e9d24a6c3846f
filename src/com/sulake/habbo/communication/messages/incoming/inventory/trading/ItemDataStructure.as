package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2207:int;
      
      private var var_1395:String;
      
      private var var_2821:int;
      
      private var var_2819:int;
      
      private var _category:int;
      
      private var var_2140:String;
      
      private var var_1594:int;
      
      private var var_2824:int;
      
      private var var_2823:int;
      
      private var var_2820:int;
      
      private var var_2822:int;
      
      private var var_2818:Boolean;
      
      private var var_2987:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2207 = param1;
         this.var_1395 = param2;
         this.var_2821 = param3;
         this.var_2819 = param4;
         this._category = param5;
         this.var_2140 = param6;
         this.var_1594 = param7;
         this.var_2824 = param8;
         this.var_2823 = param9;
         this.var_2820 = param10;
         this.var_2822 = param11;
         this.var_2818 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2207;
      }
      
      public function get itemType() : String
      {
         return this.var_1395;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2821;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2819;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2140;
      }
      
      public function get extra() : int
      {
         return this.var_1594;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2824;
      }
      
      public function get creationDay() : int
      {
         return this.var_2823;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2820;
      }
      
      public function get creationYear() : int
      {
         return this.var_2822;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2818;
      }
      
      public function get songID() : int
      {
         return this.var_1594;
      }
   }
}
