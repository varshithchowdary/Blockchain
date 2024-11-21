module.exports = {
  networks: {
    development: {
      host: "127.0.0.1", // Localhost
      port: 8545,        // Ganache port
      network_id: "*",   // Match any network
    },
  },
  compilers: {
    solc: {
      version: "0.8.19", // Use a compatible Solidity version
    },
  },
};
