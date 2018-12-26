pragma solidity ^0.4.21;

import "./interfaces/RegulatorI.sol";
import "./interfaces/RegulatedI.sol";


contract Regulated is RegulatedI {

  address previousRegulator;

  function Regulated (address regulator) public {
    require(regulator != 0);
    previousRegulator = regulator;
  }

  function setRegulator(address newRegulator) public returns (bool success)
  {
    require(previousRegulator == msg.sender);
    require(newRegulator != 0);
    require(previousRegulator != newRegulator);
    previousRegulator = newRegulator;
    emit LogRegulatorSet(previousRegulator, newRegulator);
    return true;
  }

  function getRegulator() constant public returns (RegulatorI regulator){
    return RegulatorI(previousRegulator);
  }
}