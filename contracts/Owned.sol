pragma solidity ^0.4.21;

import "./interfaces/OwnedI.sol";


contract Owned is OwnedI {

  address currOwner;

  modifier fromOwner {
    require(msg.sender == currOwner);
    _;
  }

  function Owned() public {
    currOwner = msg.sender;
  }

  function setOwner(address newOwner)
  fromOwner
  public
  returns (bool success)
  {
    require(newOwner != 0);
    require(newOwner != currOwner);
    emit LogOwnerSet(currOwner, newOwner);
    currOwner = newOwner;
    return true;
  }


  //Starting with solc 0.4.17, constant is depricated in favor of two new and more specific modifiers.
  function getOwner()
  constant
  public
  returns (address owner)
  {
    return currOwner;
  }
}