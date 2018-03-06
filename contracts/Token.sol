pragma solidity ^0.4.15;

import './interfaces/ERC20Interface.sol';

/**
 * @title Token
 * @dev Contract that implements ERC20 token standard
 * Is deployed by `Crowdsale.sol`, keeps track of balances, etc.
 */

contract Token is ERC20Interface {
// 	// YOUR CODE HERE
	uint public remainingSupply;
	uint public totalSupply;
	mapping(address => uint) balances;
	mapping(address => mapping(address => uint)) allowed;

	bool public hasOwnerSetup;

	// Events:
	// All standard events from ERC20Interface.sol
	// Fired on buyers burning their tokens
	event TokensBurned(address burnerAddress, uint tokensBurnt);

	modifier ownerHasNotSetup() {
		if (hasOwnerSetup == true) {
			return;
		}
		_;
	}

	// totalSupply would be set on deployment of Crowdsale.sol
	function Token() public {
      	hasOwnerSetup = false;
  	}

	function setTokenSupply(uint _initialSupply) public ownerHasNotSetup() returns (bool success) {
		totalSupply = _initialSupply;
		return hasOwnerSetup;
	}	
	  
	// 	Must implement ERC20Interface.sol fully
	// 	contract ERC20Interface {
	//     function totalSupply() public constant returns (uint);
	function totalSupply() public view returns(uint) {
		return totalSupply;
	}

	//     function balanceOf(address tokenOwner) public constant returns (uint balance);
	function balanceOf(address tokenOwner) public view returns(uint balance) {
		return balances[tokenOwner];
	}

	// this function returns the amount of tokens approved by the owner that can be transferred to spender's account
	//     function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
	function allowance(address tokenOwner, address spender) public constant returns (uint remaining) {
		return allowed[tokenOwner][spender];
	}

	//     function transfer(address to, uint tokens) public returns (bool success);
	function transfer(address to, uint tokens) public returns (bool success) {
		if (tokens > balances[msg.sender]) {
			revert();
			return false;
		}
			balances[msg.sender] = balances[msg.sender] - tokens;
			balances[to] = balances[to] + tokens;
			Transfer(msg.sender, to, tokens)
			return true;
	}

	// Token owner approves spender to 'transfer from' account
	//     function approve(address spender, uint tokens) public returns (bool success);
	function approve(address spender, uint tokens) public returns (bool success) {
			allowed[msg.sender][spender] = allowed[msg.sender][spender] + tokens;
			Approval(msg.sender, spender, tokens)
			return true;
	}
	//     function transferFrom(address from, address to, uint tokens) public returns (bool success);
	function transferFrom(address from, address to, uint tokens) public returns (bool success) {
		if (tokens > balances[from]) {
			revert();
			return false;
		}
		balances[from] = balances[from] - tokens;
    allowed[from][msg.sender] = allowed[from][msg.sender] - tokens;
    balances[to] = balances[to] + tokens;
    Transfer(from, to, tokens);
    return true;
	}

	// Users:
	// Must be able to burn their tokens
	// This amount would be subtracted from totalSupply
	function burnToken(uint tokens) public returns (bool success) {
		if (tokens > balances[msg.sender]) {
			return false;
		} else {
			totalSupply -= tokens;
			balances[msg.sender] -= tokens;
			TokensBurned(msg.sender, tokens);
			return true;
		}

	}

	// Must work in conjunction with Crowdsale.sol
	function addToken(uint amount) public returns (bool success) {
		totalSupply += amount;
		return true;
	}

	function subtractToken(uint amount) public returns (bool success) {
		totalSupply -= amount;
		return true;
	}

	function addToBalance(address buyer, uint amount) public returns (bool success){
    	balances[buyer] += amount;
		return true;
  	}

  	function removeFromBalance(address seller, uint amount) public returns (bool success) {
    	balances[seller] -= amount;
		return true;
  	}

	// function remainingSupply() public returns (uint) {
	// 	return remainingSupply;
	// }




}
