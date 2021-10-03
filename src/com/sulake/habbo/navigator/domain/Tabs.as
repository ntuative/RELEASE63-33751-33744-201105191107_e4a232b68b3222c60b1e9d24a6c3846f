package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_300:int = 1;
      
      public static const const_198:int = 2;
      
      public static const const_247:int = 3;
      
      public static const const_325:int = 4;
      
      public static const const_216:int = 5;
      
      public static const const_435:int = 1;
      
      public static const const_925:int = 2;
      
      public static const const_811:int = 3;
      
      public static const const_928:int = 4;
      
      public static const const_275:int = 5;
      
      public static const const_704:int = 6;
      
      public static const const_753:int = 7;
      
      public static const const_293:int = 8;
      
      public static const const_398:int = 9;
      
      public static const const_2008:int = 10;
      
      public static const const_775:int = 11;
      
      public static const const_544:int = 12;
       
      
      private var var_422:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_422 = new Array();
         this.var_422.push(new Tab(this._navigator,const_300,const_544,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_475));
         this.var_422.push(new Tab(this._navigator,const_198,const_435,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_475));
         this.var_422.push(new Tab(this._navigator,const_325,const_775,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1216));
         this.var_422.push(new Tab(this._navigator,const_247,const_275,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_475));
         this.var_422.push(new Tab(this._navigator,const_216,const_293,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_691));
         this.setSelectedTab(const_300);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_325;
      }
      
      public function get tabs() : Array
      {
         return this.var_422;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_422)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_422)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_422)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
