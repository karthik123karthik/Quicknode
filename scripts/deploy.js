
const hre = require("hardhat");

async function main() {
  const MyNftcontractFactory = await hre.ethers.getContractFactory('MyBestFriendNFT');
  const contract = await  MyNftcontractFactory.deploy("0x0A469bAF8DddD88fBF79D78EC3438ad3816BEE23");
  await contract.deployed();
  console.log("contract balance is:",contract.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
