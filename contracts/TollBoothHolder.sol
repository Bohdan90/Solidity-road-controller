pragma solidity ^0.4.21;

import "./Owned.sol";
import "./interfaces/TollBoothHolderI.sol";


contract TollBoothHolder is TollBoothHolderI, Owned {

  mapping(address => bool) tollBoothMap;

function TollBoothHolder() public {}

  function addTollBooth(address tollBooth) fromOwner public returns (bool success){
    require(!tollBoothMap[tollBooth]);
    require(tollBooth != 0);
    tollBoothMap[tollBooth] = true;
    emit LogTollBoothAdded(msg.sender, tollBooth);
    return true;
  }

  function isTollBooth(address tollBooth) constant public returns (bool isIndeed){
    return tollBoothMap[tollBooth];
  }

  function removeTollBooth(address tollBooth) fromOwner public returns (bool success){
    require(tollBoothMap[tollBooth]);
    require(tollBooth != 0);
    tollBoothMap[tollBooth] = false;
    emit LogTollBoothRemoved(msg.sender, tollBooth);
    return true;
  }


}