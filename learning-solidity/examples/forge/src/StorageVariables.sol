// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract StorageVariables {
    //these are storage variables - aka - state variables
    uint256 a; // storage slot - 0x0
    uint256 b; // storage slot - 0x1
    bool public c; // storage slot - 0x2
    function store() external {
        // stores b in a
        a = b;
        // this is a local variable - aka - automatic variable
        //uint256 x = b;
    }
}