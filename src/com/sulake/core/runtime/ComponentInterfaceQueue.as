package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1722:IID;
      
      private var var_1084:Boolean;
      
      private var var_1155:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1722 = param1;
         this.var_1155 = new Array();
         this.var_1084 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1722;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1084;
      }
      
      public function get receivers() : Array
      {
         return this.var_1155;
      }
      
      public function dispose() : void
      {
         if(!this.var_1084)
         {
            this.var_1084 = true;
            this.var_1722 = null;
            while(this.var_1155.length > 0)
            {
               this.var_1155.pop();
            }
            this.var_1155 = null;
         }
      }
   }
}
