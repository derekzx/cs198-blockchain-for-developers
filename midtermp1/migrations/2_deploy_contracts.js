var Crowdsale = artifacts.require("./Crowdsale.sol");
var Queue = artifacts.require("./Queue.sol");
var Token = artifacts.require("./Token.sol");

module.exports = function(deployer) {
	// deployer.deploy(Token).then(function() {
	// 	return deployer.deploy(Crowdsale, Token.address);
	// }).then(function() {}),
	//Is the second deployment needed?
	deployer.deploy(Crowdsale);
	deployer.deploy(Token);
	deployer.deploy(Queue);
};
