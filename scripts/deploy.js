const hre = require("hardhat");

async function main() {
    const BuyMeCoffee = await hre.ethers.ContractFactory("BuyMeCoffee");
    const buymecoffee = await BuyMeCoffee.deploy("dada");
    console.log("Your Contract has been deployed to : " + buymecoffee.address);
}


main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});

// const { ethers } = require("hardhat");

// const contract = require("../artifacts/contracts/BuyMeCoffee.sol/BuyMeCoffee.json");
// console.log(JSON.stringify(contract.abi));
