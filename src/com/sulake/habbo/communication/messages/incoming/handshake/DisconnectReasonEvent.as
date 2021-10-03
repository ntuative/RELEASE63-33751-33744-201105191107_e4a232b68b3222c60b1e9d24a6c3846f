package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_2062:int = 0;
      
      public static const const_1775:int = 1;
      
      public static const const_1811:int = 2;
      
      public static const const_2107:int = 3;
      
      public static const const_2151:int = 4;
      
      public static const const_2149:int = 5;
      
      public static const const_1854:int = 10;
      
      public static const const_2005:int = 11;
      
      public static const const_2087:int = 12;
      
      public static const const_2112:int = 13;
      
      public static const const_2132:int = 16;
      
      public static const const_2052:int = 17;
      
      public static const const_2168:int = 18;
      
      public static const const_2024:int = 19;
      
      public static const const_2060:int = 20;
      
      public static const const_2018:int = 22;
      
      public static const const_1992:int = 23;
      
      public static const const_2086:int = 24;
      
      public static const const_2025:int = 25;
      
      public static const const_2145:int = 26;
      
      public static const const_1982:int = 27;
      
      public static const const_2110:int = 28;
      
      public static const const_2155:int = 29;
      
      public static const const_2026:int = 100;
      
      public static const const_2042:int = 101;
      
      public static const const_2124:int = 102;
      
      public static const const_2032:int = 103;
      
      public static const const_2125:int = 104;
      
      public static const const_2185:int = 105;
      
      public static const const_2169:int = 106;
      
      public static const const_2078:int = 107;
      
      public static const const_2072:int = 108;
      
      public static const const_2001:int = 109;
      
      public static const const_1981:int = 110;
      
      public static const const_1998:int = 111;
      
      public static const const_2174:int = 112;
      
      public static const const_2015:int = 113;
      
      public static const const_1995:int = 114;
      
      public static const const_2161:int = 115;
      
      public static const const_2104:int = 116;
      
      public static const const_2080:int = 117;
      
      public static const const_2047:int = 118;
      
      public static const const_2057:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1775:
            case const_1854:
               return "banned";
            case const_1811:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
