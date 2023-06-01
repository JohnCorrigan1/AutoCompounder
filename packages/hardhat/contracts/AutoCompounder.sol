//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

//this will be one vault
contract AutoCompounder {
  mapping(address => uint256) public balances;
  mapping(address => uint256) public userDeposited;
  uint256 public totalDeposited;
  uint256 public totalBalance;

  function deposit(uint256 lpTokens) public {}

  function stakeLps(address user, uint256 lpTokens) public {}

  function withdraw(uint256 lpTokens) public {}

  function harvest() public {}

  function distribute() public {}

  function balanceOf(address account) public view returns (uint256) {}

  function calculateApr() public view returns (uint256) {}
}
