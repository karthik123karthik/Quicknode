require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config({path:".env"});

const QUICKNODE_URL = process.env.QUICK_NODE_URL;
const PRIVATE_KEY  = process.env.PRIVATE_KEY;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks:{
    goerli:{
      url:QUICKNODE_URL,
      accounts:[PRIVATE_KEY]
    }
  }
};
