pragma solidity ^0.4.18;

contract ERC20 {

  // Total Supply
  function totalSupply() constant returns (uint256 totalSupply);

  // Token Symbol
  function symbol() constant returns (string symbol)

  // Token Name
  function name() constant returns (string name)

  // Token Decimal places
  function decimals() constant returns (uint8 decimals)  

  function balanceOf(address who) public constant returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
  function allowance(address owner, address spender) public constant returns (uint256);
  function transferFrom(address from, address to, uint256 value) public returns (bool);
  function approve(address spender, uint256 value) public returns (bool);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}
