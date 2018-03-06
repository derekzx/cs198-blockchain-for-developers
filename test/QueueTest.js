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
			assert.equal(qSize, 3456, "set correct");
		});

		it("Front is kicked out after time limit", async function() {
			let exampleAddress = "0x123f681646d4a755815f9cb19e1acc8565a0c2ac"
			q.enqueue(exampleAddress);

			
		});
	});
});
