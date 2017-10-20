var Arbitration = artifacts.require('./Arbitration.sol');

module.exports = function(deployer) {
  deployer.deploy(Arbitration);
};
