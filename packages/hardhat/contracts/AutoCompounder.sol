//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

//this will be one vault
contract AutoCompounder {
  address public immutable owner;

  mapping(address => uint256) public balances;
  mapping(address => uint256) public userDeposited;
  uint256 public totalDeposited;
  uint256 public totalBalance;

  constructor(address _owner) {
    owner = _owner;
  }

  //get lp contract
  function deposit(uint256 lpTokens) public {
    require(lpTokens > 0, "deposit is to few");
    balances[msg.sender] += lpTokens;
    userDeposited[msg.sender] += lpTokens;
  }

  function stakeLps(address user, uint256 lpTokens) internal {}

  function withdraw(uint256 lpTokens) public {
    require(balances[msg.sender] > 0, "nothing to withdraw");
    require(balances[msg.sender] >= lpTokens, "lp tokens are to few");
    balances[msg.sender] -= lpTokens;
  }

  function harvest() public {}

  function distribute() public {}

  function balanceOf(address account) public view returns (uint256) {
    return balances[account];
  }

  function calculateApr() public view returns (uint256) {}
}
