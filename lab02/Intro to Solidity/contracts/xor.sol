pragma solidity 0.4.19;


contract XOR {
    function xor(uint a, uint b) public pure returns (uint) {
      if (((a==1)&&(b==1))||((a==0)&&(b==0))) {
          return 0;
      }
      return 1;
    }
}
