package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1039:BigInteger;
      
      private var var_2363:BigInteger;
      
      private var var_1936:BigInteger;
      
      private var var_2663:BigInteger;
      
      private var var_1532:BigInteger;
      
      private var var_1937:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1532 = param1;
         this.var_1937 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1532.toString() + ",generator: " + this.var_1937.toString() + ",secret: " + param1);
         this.var_1039 = new BigInteger();
         this.var_1039.fromRadix(param1,param2);
         this.var_2363 = this.var_1937.modPow(this.var_1039,this.var_1532);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1936 = new BigInteger();
         this.var_1936.fromRadix(param1,param2);
         this.var_2663 = this.var_1936.modPow(this.var_1039,this.var_1532);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2363.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2663.toRadix(param1);
      }
   }
}
