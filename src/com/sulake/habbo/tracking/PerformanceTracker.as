package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var _connection:IConnection = null;
      
      private var var_195:IHabboConfigurationManager = null;
      
      private var var_575:int = 0;
      
      private var var_544:Number = 0;
      
      private var var_2960:Array;
      
      private var var_1570:String = "";
      
      private var var_1999:String = "";
      
      private var var_2528:String = "";
      
      private var var_2531:String = "";
      
      private var var_1853:Boolean = false;
      
      private var var_2003:GarbageMonitor = null;
      
      private var var_1571:int = 0;
      
      private var var_2750:Boolean;
      
      private var var_2002:int = 1000;
      
      private var var_1569:int = 0;
      
      private var _reportInterval:int = 60;
      
      private var var_2000:int = 0;
      
      private var var_2001:int = 10;
      
      private var var_1572:int = 0;
      
      private var var_2749:Number = 0.15;
      
      private var var_2752:Boolean = true;
      
      private var var_2751:Number = 0;
      
      public function PerformanceTracker()
      {
         this.var_2960 = [];
         super();
         this.var_1999 = Capabilities.version;
         this.var_2528 = Capabilities.os;
         this.var_1853 = Capabilities.isDebugger;
         this.var_1570 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         if(this.var_1570 == null)
         {
            this.var_1570 = "unknown";
         }
         this.var_2003 = new GarbageMonitor();
         this.updateGarbageMonitor();
         this.var_2000 = getTimer();
      }
      
      public function get flashVersion() : String
      {
         return this.var_1999;
      }
      
      public function get averageUpdateInterval() : int
      {
         return this.var_544;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         this.var_2002 = param1;
      }
      
      public function set reportInterval(param1:int) : void
      {
         this._reportInterval = param1;
      }
      
      public function set reportLimit(param1:int) : void
      {
         this.var_2001 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         this.var_195 = param1;
         this._reportInterval = int(this.var_195.getKey("performancetest.interval","60"));
         this.var_2002 = int(this.var_195.getKey("performancetest.slowupdatelimit","1000"));
         this.var_2001 = int(this.var_195.getKey("performancetest.reportlimit","10"));
         this.var_2749 = Number(this.var_195.getKey("performancetest.distribution.deviancelimit.percent","10"));
         this.var_2752 = Boolean(int(this.var_195.getKey("performancetest.distribution.enabled","1")));
         this.var_2750 = Boolean(this.var_195.getKey("monitor.garbage.collection","0") == "1");
      }
      
      public function dispose() : void
      {
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_2003.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            this.var_2003.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function update(param1:uint, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Number = NaN;
         if(this.var_2750)
         {
            _loc4_ = this.updateGarbageMonitor();
            if(_loc4_ != null)
            {
               ++this.var_1571;
               Logger.log("Garbage collection");
            }
         }
         var _loc3_:Boolean = false;
         if(param1 > this.var_2002)
         {
            ++this.var_1569;
            _loc3_ = true;
         }
         else
         {
            ++this.var_575;
            if(this.var_575 <= 1)
            {
               this.var_544 = param1;
            }
            else
            {
               _loc5_ = Number(this.var_575);
               this.var_544 = this.var_544 * (_loc5_ - 1) / _loc5_ + Number(param1) / _loc5_;
            }
         }
         if(param2 - this.var_2000 > this._reportInterval * 1000 && this.var_1572 < this.var_2001)
         {
            _loc6_ = 0;
            Logger.log("*** Performance tracker: average frame rate " + 1000 / this.var_544 + "/s, system memory usage : " + _loc6_ + " bytes");
            _loc7_ = true;
            if(this.var_2752 && this.var_1572 > 0)
            {
               _loc8_ = this.differenceInPercents(this.var_2751,this.var_544);
               if(_loc8_ < this.var_2749)
               {
                  _loc7_ = false;
               }
            }
            this.var_2000 = param2;
            if(_loc7_ || _loc3_)
            {
               this.var_2751 = this.var_544;
               if(this.sendReport(param2))
               {
                  ++this.var_1572;
               }
            }
         }
      }
      
      private function sendReport(param1:int) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this._connection != null)
         {
            _loc2_ = null;
            _loc3_ = param1 / 1000;
            _loc4_ = -1;
            _loc5_ = 0;
            _loc2_ = new PerformanceLogMessageComposer(_loc3_,this.var_1570,this.var_1999,this.var_2528,this.var_2531,this.var_1853,_loc5_,_loc4_,this.var_1571,this.var_544,this.var_1569);
            this._connection.send(_loc2_);
            this.var_1571 = 0;
            this.var_544 = 0;
            this.var_575 = 0;
            this.var_1569 = 0;
            return true;
         }
         return false;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
   }
}
