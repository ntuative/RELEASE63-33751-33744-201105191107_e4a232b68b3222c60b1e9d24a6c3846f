package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1185:String = "M";
      
      public static const const_1701:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_173:Number = 0;
      
      private var var_174:Number = 0;
      
      private var var_432:int = 0;
      
      private var _name:String = "";
      
      private var var_1621:int = 0;
      
      private var var_913:String = "";
      
      private var var_618:String = "";
      
      private var var_2267:String = "";
      
      private var var_2262:int;
      
      private var var_2265:int = 0;
      
      private var var_2264:String = "";
      
      private var var_2266:int = 0;
      
      private var var_2263:int = 0;
      
      private var var_2328:String = "";
      
      private var var_179:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_179 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_179)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_173;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_179)
         {
            this.var_173 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_174;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_179)
         {
            this.var_174 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_432;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_432 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_179)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_1621;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_1621 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_913;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_913 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_618;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_618 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2267;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_2267 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2262;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_2262 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2265;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_2265 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2264;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_2264 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2266;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_2266 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2263;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_2263 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2328;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_2328 = param1;
         }
      }
   }
}
