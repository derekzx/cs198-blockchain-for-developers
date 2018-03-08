'use strict';

const Token = artifacts.require("./Token.sol");
const Queue = artifacts.require("./Queue.sol");
const Crowdsale = artifacts.require("./Crowdsale.sol");

contract('Crowdsale', function(accounts) {
	const args = {}
    let testSale;
    
    beforeEach(async function() {
        //Deploys a crowsale to test
        testSale = await Crowdsale.new();
    });
    describe('Test test', function() {
        console.log("hello");
    });

	

});