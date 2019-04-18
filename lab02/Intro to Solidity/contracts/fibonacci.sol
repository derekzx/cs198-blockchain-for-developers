pragma solidity 0.4.19;


contract Fibonacci {
    /* Carry out calculations to find the nth Fibonacci number */
    function fibRecur(uint n) public pure returns (uint) {
        if (n == 0) return 0;
        if (n == 1) return 1;
        else return fibRecur(n-1) + fibRecur(n-2);
    }

    /* Carry out calculations to find the nth Fibonacci number */
    function fibIter(uint n) public returns (uint) {
        uint a=1;
        uint b=1;
        uint result;
        if ((n == 1) || (n == 2)) {
            result = 1;
        }
        uint loop = 2;
        while (loop<(n+5)) {
            result = a + b;
                if (loop==n) {
                    break;
                }
            a = b;
            b = result;
            loop++;
        }
        return result;
    }
}
