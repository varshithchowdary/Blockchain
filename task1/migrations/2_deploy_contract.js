const BasicContract = artifacts.require("BasicContract");

module.exports = function (deployer) {
    deployer.deploy(BasicContract, "Hello, Blockchain!"); // Pass the initial message
};
