// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "contracts/Storage.sol";
// import "contracts/4_internal.sol";
import "contracts/ISendFrom.sol"; 

contract MagnetarMarketModule is Ballot{

    // Inside public inside;
    constructor() {
    }

    
    function withdraw(address payable add1) external payable{
        _withdraw(add1);
    }

    function _withdrawToChain(address payable add1, uint gas) private{
        ISendFrom sendFromContract = ISendFrom(add1);
        bool test = sendFromContract.sendFrom{value: gas}();
        console.log("result of calling sendFrom");
        console.log(test);
    } 

    function _withdraw(address payable add1) private{
        uint256 gas;
        console.log("Inside _withdraw() function msg.value is :");
        console.log(msg.value);
        if(msg.value > 0) {gas = msg.value;}
        else{gas = address(this).balance;}
        _withdrawToChain(add1, gas);
    }

    function sendETH() external payable  {
        (bool success, ) = address(this).call{value: 1000000000000000000}("");
        require(success);
    }

    fallback() external payable {}

    

}
