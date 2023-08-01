// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISendFrom {
    function sendFrom() external payable returns (bool);
}