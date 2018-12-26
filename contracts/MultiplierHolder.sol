pragma solidity ^0.4.21;

import "./Owned.sol";
import "./interfaces/MultiplierHolderI.sol";


contract MultiplierHolder is MultiplierHolderI, Owned {
    mapping(uint => uint) vehicleTypesMap;

    function MultiplierHolder()  public {}

    function setMultiplier(uint vehicleType, uint multiplier) fromOwner public returns(bool success){
        require(vehicleType != 0);
        require(vehicleTypesMap[vehicleType] != multiplier);
        vehicleTypesMap[vehicleType] = multiplier;
        emit LogMultiplierSet(msg.sender, vehicleType, multiplier);
        return true;
    }

    function getMultiplier(uint vehicleType) constant public returns(uint multiplier){
        return vehicleTypesMap[vehicleType];
    }
}