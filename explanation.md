### What's going on in `Mystery.sol`?

###Done by:
1. Derek Chin
2. Jackson Chui

##### Answer:
1. When contract is constructed the input address a is assigned to the variable add
2. variable g represents the gas amount for the transactio
3. variable ocode is read from the memory at 0x40
4. variable addr is the addressed retrieved from the storage address (add) and runs it gets the first 40 bytes in unsigned form
5. address (at 0) is copied into the o_code address
6. Variable retval is the return value for the function call
7. Function call calls contract at addr with g gas with input memory o_code. Size of input is the size of o_code.
8. If call error it returns 0, if call succeeds it returns 1
8. If call errors we jump to 0x02 which is an invalid memory address which causes the code to erro out. Else 1 is returned.