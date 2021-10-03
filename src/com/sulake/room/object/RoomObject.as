package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_1111:int = 0;
       
      
      private var _id:int;
      
      private var _type:String = "";
      
      private var var_95:Vector3d;
      
      private var var_432:Vector3d;
      
      private var var_1666:Vector3d;
      
      private var var_1667:Vector3d;
      
      private var var_585:Array;
      
      private var var_69:RoomObjectModel;
      
      private var _visualization:IRoomObjectVisualization;
      
      private var var_586:IRoomObjectEventHandler;
      
      private var _updateID:int;
      
      private var var_2219:int = 0;
      
      public function RoomObject(param1:int, param2:int, param3:String)
      {
         super();
         this._id = param1;
         this.var_95 = new Vector3d();
         this.var_432 = new Vector3d();
         this.var_1666 = new Vector3d();
         this.var_1667 = new Vector3d();
         this.var_585 = new Array(param2);
         var _loc4_:Number = param2 - 1;
         while(_loc4_ >= 0)
         {
            this.var_585[_loc4_] = 0;
            _loc4_--;
         }
         this._type = param3;
         this.var_69 = new RoomObjectModel();
         this._visualization = null;
         this.var_586 = null;
         this._updateID = 0;
         this.var_2219 = var_1111++;
      }
      
      public function dispose() : void
      {
         this.var_95 = null;
         this.var_432 = null;
         if(this.var_69 != null)
         {
            this.var_69.dispose();
            this.var_69 = null;
         }
         this.var_585 = null;
         this.setVisualization(null);
         this.setEventHandler(null);
      }
      
      public function getId() : int
      {
         return this._id;
      }
      
      public function getType() : String
      {
         return this._type;
      }
      
      public function getInstanceId() : int
      {
         return this.var_2219;
      }
      
      public function getLocation() : IVector3d
      {
         this.var_1666.assign(this.var_95);
         return this.var_1666;
      }
      
      public function getDirection() : IVector3d
      {
         this.var_1667.assign(this.var_432);
         return this.var_1667;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return this.var_69;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return this.var_69;
      }
      
      public function getState(param1:int) : int
      {
         if(param1 >= 0 && param1 < this.var_585.length)
         {
            return this.var_585[param1];
         }
         return -1;
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return this._visualization;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_95.x != param1.x || this.var_95.y != param1.y || this.var_95.z != param1.z)
         {
            this.var_95.x = param1.x;
            this.var_95.y = param1.y;
            this.var_95.z = param1.z;
            ++this._updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_432.x != param1.x || this.var_432.y != param1.y || this.var_432.z != param1.z)
         {
            this.var_432.x = (param1.x % 360 + 360) % 360;
            this.var_432.y = (param1.y % 360 + 360) % 360;
            this.var_432.z = (param1.z % 360 + 360) % 360;
            ++this._updateID;
         }
      }
      
      public function setState(param1:int, param2:int) : Boolean
      {
         if(param2 >= 0 && param2 < this.var_585.length)
         {
            if(this.var_585[param2] != param1)
            {
               this.var_585[param2] = param1;
               ++this._updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != this._visualization)
         {
            if(this._visualization != null)
            {
               this._visualization.dispose();
            }
            this._visualization = param1;
            if(this._visualization != null)
            {
               this._visualization.object = this;
            }
         }
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == this.var_586)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = this.var_586;
         if(_loc2_ != null)
         {
            this.var_586 = null;
            _loc2_.object = null;
         }
         this.var_586 = param1;
         if(this.var_586 != null)
         {
            this.var_586.object = this;
         }
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return this.var_586;
      }
      
      public function getUpdateID() : int
      {
         return this._updateID;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return this.getEventHandler();
      }
   }
}
