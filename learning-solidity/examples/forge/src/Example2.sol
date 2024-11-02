// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {console} from "forge-std/console.sol";

contract Example2 {
    uint256 a = 100; // storage slot - 0x....0
    uint256 b = type(uint256).max; // storage slot 0x....1
    bool c = true; // storage slot 0x....2

    constructor (){
        // SSTORE - store to a storage location
        // SLOAD - read from a storage location

        uint256 x;
        assembly {
            x := sload(0x0)
        }

        console.log(a);

        console.log(x);
    }
}