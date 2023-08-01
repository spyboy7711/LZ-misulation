// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "hardhat/console.sol";
// import "contracts/5_internal.sol";

contract Sendfrom{


    constructor(){
    }

    function sendFrom() external payable returns (bool) {

        if(msg.value > 0){
            console.log("Inside Sendfrom received value is");
            console.log(msg.value);
            return true;
        }
        else {
            console.log("In side msg.value is not greater than zero");
            return false;
        }
    }


    fallback() external payable {}
    receive() external payable {}
}