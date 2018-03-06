'use strict';

/* Add the dependencies you're testing */
const Queue = artifacts.require("./Queue.sol");
// const Crowdsale = artifacts.require("./Crowdsale.sol");
// YOUR CODE HERE

contract('QueueTest', function(accounts) {

	/* Do something before every `describe` method */
	beforeEach(async function() {
		let timeLimit = 1000;
		q = await Queue.new(timeLimit);
	});
	 
	describe('Your string here', function() {
		it("Queue has fixed size of 5", async function() {
			let qSize = q.qsize();
			assert.equal(qSize, 5, "set correct");
		});
	});
});
