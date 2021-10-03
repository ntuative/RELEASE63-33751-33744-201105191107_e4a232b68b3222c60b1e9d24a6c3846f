package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class MovingObjectLogic extends ObjectLogicBase
   {
      
      public static const const_950:int = 500;
      
      private static var var_664:Vector3d = new Vector3d();
       
      
      private var var_451:Vector3d;
      
      private var var_95:Vector3d;
      
      private var var_1020:Number = 0.0;
      
      private var var_1949:int = 0;
      
      private var var_2691:int;
      
      private var var_1019:int = 500;
      
      public function MovingObjectLogic()
      {
         this.var_451 = new Vector3d();
         this.var_95 = new Vector3d();
         super();
      }
      
      protected function get lastUpdateTime() : int
      {
         return this.var_1949;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_95 = null;
         this.var_451 = null;
      }
      
      override public function set object(param1:IRoomObjectController) : void
      {
         super.object = param1;
         if(param1 != null)
         {
            this.var_95.assign(param1.getLocation());
         }
      }
      
      protected function set moveUpdateInterval(param1:int) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         this.var_1019 = param1;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         if(param1.loc != null)
         {
            this.var_95.assign(param1.loc);
         }
         var _loc2_:RoomObjectMoveUpdateMessage = param1 as RoomObjectMoveUpdateMessage;
         if(_loc2_ == null)
         {
            return;
         }
         if(object != null)
         {
            if(param1.loc != null)
            {
               _loc3_ = _loc2_.targetLoc;
               this.var_2691 = this.var_1949;
               this.var_451.assign(_loc3_);
               this.var_451.sub(this.var_95);
            }
         }
      }
      
      protected function getLocationOffset() : IVector3d
      {
         return null;
      }
      
      override public function update(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:IVector3d = this.getLocationOffset();
         var _loc3_:IRoomObjectModelController = object.getModelController();
         if(_loc3_ != null)
         {
            if(_loc2_ != null)
            {
               if(this.var_1020 != _loc2_.z)
               {
                  this.var_1020 = _loc2_.z;
                  _loc3_.setNumber(RoomObjectVariableEnum.const_786,this.var_1020);
               }
            }
            else if(this.var_1020 != 0)
            {
               this.var_1020 = 0;
               _loc3_.setNumber(RoomObjectVariableEnum.const_786,this.var_1020);
            }
         }
         if(this.var_451.length > 0 || _loc2_ != null)
         {
            _loc4_ = param1 - this.var_2691;
            if(_loc4_ == this.var_1019 >> 1)
            {
               _loc4_++;
            }
            if(_loc4_ > this.var_1019)
            {
               _loc4_ = this.var_1019;
            }
            if(this.var_451.length > 0)
            {
               var_664.assign(this.var_451);
               var_664.mul(_loc4_ / Number(this.var_1019));
               var_664.add(this.var_95);
            }
            else
            {
               var_664.assign(this.var_95);
            }
            if(_loc2_ != null)
            {
               var_664.add(_loc2_);
            }
            if(object != null)
            {
               object.setLocation(var_664);
            }
            if(_loc4_ == this.var_1019)
            {
               this.var_451.x = 0;
               this.var_451.y = 0;
               this.var_451.z = 0;
            }
         }
         this.var_1949 = param1;
      }
   }
}
