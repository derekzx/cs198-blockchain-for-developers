'use strict';

/* Add the dependencies you're testing */
const Queue = artifacts.require("./Queue.sol");
// const Crowdsale = artifacts.require("./Crowdsale.sol");
// YOUR CODE HERE

contract('QueueTest', function(accounts) {
	const args = {_timeLimit: 1000};
	let q;

	/* Do something before every `describe` method */
	beforeEach(async function() {
		//YOUR CODE HERE
		q = await Queue.new();
		q.setTimeLimit(args._timeLimit).call();
		//TypeError: q.setTimeLimit(...).call is not a function
	});
	 
	describe('Your string here', function() {

		it("enqueue works", async function() {
			let firstAddress = "0x123f681646d4a755815f9cb19e1acc8565a0c2ac";
			let secondAddress = "0x321f681646d4a755815f9cb19e1acc8565a0c2ac";
			q.enqueue(firstAddress);
			assert.equal(q.getFirst(), firstAddress, "first element added correctly");
			q.enqueue(secondAddress);
			assert.equal(q.getFirst(), firstAddress, "LIFO works correctly for enqueue");
		});

		it("dequeue works", async function() {
			let firstAddress = "0x123f681646d4a755815f9cb19e1acc8565a0c2ac"
			let secondAddress = "0x321f681646d4a755815f9cb19e1acc8565a0c2ac"
			q.enqueue(firstAddress);
			q.enqueue(secondAddress);

			assert.equal(q.dequeue(), firstAddress, "first dequeued");
			assert.equal(q.dequeue(), secondAddress, "second dequeued");
		});

		it("size works", async function() {
			let firstAddress = "0x123f681646d4a755815f9cb19e1acc8565a0c2ac"
			let secondAddress = "0x321f681646d4a755815f9cb19e1acc8565a0c2ac"

			q.enqueue(firstAddress);
			assert.equal(q.qsize(), 1, "size of 1");

			q.enqueue(secondAddress);
			assert.equal(q.qsize(), 2, "size of 2");

			q.dequeue();
			assert.equal(q.qsize(), 1, "back to 1");

		});

		it("checkPlace works", async function() {
			let firstAddress = "0x123f681646d4a755815f9cb19e1acc8565a0c2ac"
			let secondAddress = "0x321f681646d4a755815f9cb19e1acc8565a0c2ac"
			let thirdAddress = q.address;
			q.enqueue(firstAddress);
			q.enqueue(secondAddress);
			q.enqueue(thirdAddress);

			assert.equal(q.checkPlace(), 3, "3rd in line");
		});

	});
});
