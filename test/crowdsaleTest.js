'use strict';

const Token = artifacts.require("./Token.sol");
const Queue = artifacts.require("./Queue.sol");
const Crowdsale = artifacts.require("./Crowdsale.sol");

contract('Crowdsale', function(accounts) {
	const args = {}
    let testSale;
    
    beforeEach(async function() {
        //Deploys a crowdsale to test
        testSale = await Crowdsale.new();
        //may need to initiate another owner contract & user contract to interact with this
    });
    describe('~Crowdsale Works~', function() {
        describe('Owner Token Operations', function() {
            it('Owner able to mint tokens', function() {
                //YOUR CODE HERE
            });
            it('Owner able to burn tokens', function() {
                //YOUR CODE HERE
            });
        });
        describe('User Token Operations', function() {
            it('User able to buy tokens', function() {
                //YOUR CODE HERE
            });
            it('User able to refund tokens', function() {
                //YOUR CODE HERE
            });
        });
        
    });

	

});