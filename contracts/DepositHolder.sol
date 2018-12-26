pragma solidity ^0.4.21;

import "./Owned.sol";
import "./interfaces/DepositHolderI.sol";

contract DepositHolder is DepositHolderI, Owned {

    uint deposit;

        function DepositHolder(uint depositWeis) public {
        require(depositWeis > 0);
        deposit = depositWeis;
    }

    function setDeposit(uint depositWeis) fromOwner public returns(bool _success){
        require(depositWeis != 0);
        require(depositWeis != deposit);
        deposit = depositWeis;
        emit LogDepositSet(msg.sender, deposit);
        return true;
    }

    function getDeposit() constant public returns(uint depositWeis){
        return deposit;
    }
}