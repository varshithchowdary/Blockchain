module.exports = {
  networks: {
      development: {
          host: "127.0.0.1", // Localhost
          port: 8545,       // Ganache default port
          network_id: "*",  // Match any network ID
      },
  },
  compilers: {
      solc: {
          version: "0.8.19", // Ensure it matches your Solidity version
      },
  },
};
