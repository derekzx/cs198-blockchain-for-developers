'use strict';

/* Add the dependencies you're testing */
const Queue = artifacts.require("./Queue.sol");
// const Crowdsale = artifacts.require("./Crowdsale.sol");
// YOUR CODE HERE

contract('QueueTest', function(accounts) {
	/* Define your constant variables and instantiate constantly changing 
	 * ones
	 */
	 /*
	const args = {};
	let x, y, z;
	*/
	// YOUR CODE HERE

	/* Do something before every `describe` method */
	beforeEach(async function() {
		let timeLimit = 1000;
		q = await Queue.new(timeLimit);
	});
/*
	 Group test cases together 
	 * Make sure to provide descriptive strings for method arguements and
	 * assert statements
	 */
	 
	describe('Your string here', function() {
		it("Queue has fixed size of 5", async function() {
			let qSize = q.qsize();
			assert.equal(qSize, 5, "set correct");
		});
		// YOUR CODE HERE
	});
/*
	describe('Your string here', function() {
		// YOUR CODE HERE
	});*/
});
