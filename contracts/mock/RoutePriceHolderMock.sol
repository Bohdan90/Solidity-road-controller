pragma solidity ^0.4.16;

import "../Owned.sol";
import "../TollBoothHolder.sol";
import "../RoutePriceHolder.sol";

contract RoutePriceHolderMock is TollBoothHolder, RoutePriceHolder {

    function RoutePriceHolderMock() public {
    }
}