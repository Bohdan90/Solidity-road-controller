pragma solidity ^0.4.21;

import "./TollBoothHolder.sol";
import "./interfaces/RoutePriceHolderI.sol";


contract RoutePriceHolder is RoutePriceHolderI, Owned, TollBoothHolder {

    mapping(address => mapping(address => uint)) routeMap;

    function RoutePriceHolder() public {}

    function setRoutePrice(address entryBooth, address exitBooth, uint priceWeis) fromOwner   public returns(bool success){
        require(entryBooth != exitBooth);
        require(entryBooth != 0 && exitBooth != 0);
        require(isTollBooth(entryBooth) && isTollBooth(exitBooth));
        require(routeMap[entryBooth][exitBooth] != priceWeis);
        routeMap[entryBooth][exitBooth] = priceWeis;
        emit  LogRoutePriceSet(msg.sender, entryBooth, exitBooth, priceWeis);
        return true;
    }

    function getRoutePrice(address entryBooth, address exitBooth) constant public returns(uint priceWeis){
        return routeMap[entryBooth][exitBooth];
    }

}