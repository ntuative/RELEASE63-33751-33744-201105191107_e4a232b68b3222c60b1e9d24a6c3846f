package com.sulake.habbo.communication.messages.incoming.notifications
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.notifications.HabboAchievementBonusMessageParser;
   
   public class HabboAchievementBonusMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function HabboAchievementBonusMessageEvent(param1:Function)
      {
         super(param1,HabboAchievementBonusMessageParser);
      }
      
      public function get method_2() : int
      {
         return (var_10 as HabboAchievementBonusMessageParser).method_2;
      }
      
      public function get realName() : String
      {
         return (var_10 as HabboAchievementBonusMessageParser).realName;
      }
   }
}
