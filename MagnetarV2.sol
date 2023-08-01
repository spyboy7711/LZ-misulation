// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "contracts/MagnetarMarketModule.sol";
import "hardhat/console.sol";
import "contracts/Storage.sol";

contract MagnetarV2 is Ballot{
    constructor(address payable add, address add1) {
         myContractInstance = add;
         _add1 = add1;

    }

    function burst() external payable{
        for (uint256 i = 0; i <2; i++) {
                bytes memory callData = abi.encodeWithSignature("withdraw(address)", _add1);
                 _executeModule(payable(myContractInstance), callData);
           
        }
    }

    function _executeModule(
        address _instanceAddress,
        bytes memory _data
    ) private returns (bytes memory returnData) {
        bool success;
        (success, returnData) = _instanceAddress.delegatecall(_data);
        console.log("result of delegatecall");
        console.log(success);
    }

    receive() external payable {}

}
