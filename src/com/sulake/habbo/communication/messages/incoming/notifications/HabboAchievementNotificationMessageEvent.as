package com.sulake.habbo.communication.messages.incoming.notifications
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.notifications.HabboAchievementNotificationMessageParser;
   
   public class HabboAchievementNotificationMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function HabboAchievementNotificationMessageEvent(param1:Function)
      {
         super(param1,HabboAchievementNotificationMessageParser);
      }
      
      public function get type() : int
      {
         return (var_10 as HabboAchievementNotificationMessageParser).type;
      }
      
      public function get level() : int
      {
         return (var_10 as HabboAchievementNotificationMessageParser).level;
      }
      
      public function get points() : int
      {
         return (var_10 as HabboAchievementNotificationMessageParser).points;
      }
      
      public function get levelRewardPoints() : int
      {
         return (var_10 as HabboAchievementNotificationMessageParser).levelRewardPoints;
      }
      
      public function get levelRewardPointType() : int
      {
         return (var_10 as HabboAchievementNotificationMessageParser).levelRewardPointType;
      }
      
      public function get method_2() : int
      {
         return (var_10 as HabboAchievementNotificationMessageParser).method_2;
      }
      
      public function get badgeID() : String
      {
         return (var_10 as HabboAchievementNotificationMessageParser).badgeID;
      }
      
      public function get achievementID() : int
      {
         return (var_10 as HabboAchievementNotificationMessageParser).achievementID;
      }
      
      public function get removedBadgeID() : String
      {
         return (var_10 as HabboAchievementNotificationMessageParser).removedBadgeID;
      }
   }
}
