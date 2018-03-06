pragma solidity ^0.4.15;

/**
 * @title Queue
 * @dev Data structure contract used in `Crowdsale.sol`
 * Allows buyers to line up on a first-in-first-out basis
 * See this example: http://interactivepython.org/courselib/static/pythonds/BasicDS/ImplementingaQueueinPython.html
 */

contract Queue {
	/* State variables */
	// Must have a finite size, please keep this set to 5
	uint8 size = 5;
	uint8 currentSize;
	//Not sure if this is correct but I cannot find any members which can access Array type data efficeintly
	mapping(address => uint) queuersAddressToIndex;
	mapping(uint => address) queuersIndexToAddress;
	mapping(address => uint) timeInQueue;
	// Must have a time limit someone can keep their spot in the front; this prevents griefing
	uint public timeLimit;

	/* Add events */
	// 	Events:
	event QueueTimeLimitReached(address removedAddress);

	/* Add constructor */
	function Queue(uint _timeLimit) {
		timeLimit = _timeLimit;
		currentSize = 0;
	}

	/* Returns the number of people waiting in line */
	function qsize() external view returns(uint8) {
		return currentSize;
	}

	/* Returns whether the queue is empty or not */
	function empty() external view returns(bool) {
		if (currentSize == 0) {
			return true;
		}
		return false;
	}
	
	/* Returns the address of the person in the front of the queue */
	function getFirst() constant returns(address) {
		return queuersIndexToAddress[1];
	}
	
	/* Allows `msg.sender` to check their position in the queue */
	function checkPlace() constant returns(uint8) {
		return uint8(queuersAddressToIndex[msg.sender]);
	}
	
	/* Allows anyone to expel the first person in line if their time
	 * limit is up
	 */
	function checkTime() external{
		address first = queuersIndexToAddress[1];
		//Time in queue unsure whether it depends on time in the 1st position or in queue
		uint currentTimeInQueue = now - timeInQueue[first];

		if (currentTimeInQueue > timeLimit) {
			dequeue();
			QueueTimeLimitReached(first);
		}
	}
	
	/* Removes the first person in line; either when their time is up or when
	 * they are done with their purchase
	 */
	function dequeue() private {
		queuersAddressToIndex[queuersIndexToAddress[index]] = 0;
		timeInQueue[queuersIndexToAddress[index]] = 0;
		for (uint index = 1; index < 5; index++) {
			//QItA 	[1 | 0xabc] --> to be deleted
			//		[2 | 0xbcd] --> to be moved up
			//QAtI  [0xabc | 1] --> to be deleted
			//		[0xbcd | 2] --> to be moved up
			queuersIndexToAddress[index] = queuersIndexToAddress[index+1];
			queuersAddressToIndex[queuersIndexToAddress[index+1]] = index;
		}
		currentSize -= 1;
	}

	/* Places `addr` in the first empty position in the queue */
	function enqueue(address addr) external{
		if (currentSize < size) {
			currentSize += 1;
			queuersIndexToAddress[currentSize] = msg.sender;
			queuersAddressToIndex[msg.sender] = currentSize;
			//unsure about function, check out comment in CheckTime()
			timeInQueue[msg.sender] = now;
		}
		//Not allowed to overwrite if queue is full
		revert();
	}
}
