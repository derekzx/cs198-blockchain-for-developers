pragma solidity 0.4.19;


contract Concatenate {
    function concatWithoutImport(string _s, string _t) public returns (string) {
        bytes memory a = bytes(_s);
        bytes memory b = bytes(_t);
        string memory stringAB = new string(a.length + b.length);
        bytes memory bresult = bytes(stringAB);
        uint count = 0;
        for (uint i = 0; i<a.length; i++) {
            bresult[count++] = a[i];
        }
        for (uint j = 0; j<b.length; j++) {
            bresult[count++] = b[j];
        }
        return string(bresult);
    }

    /* BONUS */
    function concatWithImport(string s, string t) public returns (string) {

    }
}
