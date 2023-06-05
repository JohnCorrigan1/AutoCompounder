import { expect } from "chai";
import { ethers } from "hardhat";
import { AutoCompounder } from "../typechain-types";

describe("AutoCompounder", function () {
  // We define a fixture to reuse the same setup in every test.

  let autoCompounder: AutoCompounder;
  before(async () => {
    const [owner] = await ethers.getSigners();
    const yourContractFactory = await ethers.getContractFactory("AutoCompounder");
    autoCompounder = (await yourContractFactory.deploy(owner.address)) as AutoCompounder;
    await autoCompounder.deployed();
  });

  describe("Deployment", function () {
    it("Should have 0 balance", async function () {
      const [owner] = await ethers.getSigners();
      expect(await autoCompounder.balanceOf(owner.address)).to.equal(0);
    });

    it("Should not allow withdraw", async function () {
      expect(await autoCompounder.withdraw(1)).to.be.revertedWith("nothing to withdraw");
    });

    it("Should not allow deposit of 0", async function () {
      expect(await autoCompounder.deposit(0)).to.be.revertedWith("deposit is to few");
    });
  });
});
