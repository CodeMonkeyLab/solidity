pragma solidity ^0.4.18;

contract ReentryProtected {

  // The reentry protection state mutex.
  bool private rentrancy_lock = false;
  
  // Sets and resets mutex in order to block functin reentry
  modifier preventReentry() {
    require(!rentrancy_lock);
    rentrancy_lock = true;
    _;
    delete rentrancy_lock;
    return;
  }

  // Blocks function entry if mutex is set
  modifier noReentry() {
    require(!rentrancy_lock);
    _;
  }
}
