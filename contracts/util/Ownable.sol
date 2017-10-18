pragma solidity ^0.4.18;

import './ReentryProtected.sol';

/**
 * Only allow Owner to do action
 */
contract Ownable {

  // Current owner must be set manually
  address public owner;

  // An address authorised to take ownership
  address public newOwner;

  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }


/**********************
* Events
***********************/

  // Logged when owner initiates a change of ownership
  event ChangeOwnerTo(address indexed _to);

  // Logged when new owner accepts ownership
  event ChangedOwner(address indexed _from, address indexed _to);

/**********************
* Change Owner
***********************/

  // To initiate an ownership change
  function changeOwner(address _newOwner)
    public
    noReentry
    onlyOwner
    returns (bool)
  {
    ChangeOwnerTo(_newOwner);
    newOwner = _newOwner;
    return true;
  }

  // To accept ownership. Required to prove new address can call the contract.
  function acceptOwnership()
    public
    noReentry
    returns (bool)
  {
    require(msg.sender == newOwner);
    ChangedOwner(owner, newOwner);
    owner = newOwner;
    return true;
  }
}
