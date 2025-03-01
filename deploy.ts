/* eslint-disable jsdoc/require-description */
import { ethers } from "hardhat";

/**
 *
 */
async function main() {
  const SponsoredSearchAuction = await ethers.getContractFactory("SponsoredSearchAuction");
  const auction = await SponsoredSearchAuction.deploy();
  await auction.deployed();
  console.log("SponsoredSearchAuction deployed to:", auction.address);
}

main().catch(error => {
  console.error(error);
  process.exitCode = 1;
});
