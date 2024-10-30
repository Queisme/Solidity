// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {console} from "../lib/forge-std/src/console.sol";

contract Example {
    uint8 a = 255; // 0 -> 255
    uint256 b = 22; // alias: uint

    constructor() {
        a += 1; //results in a runtime error (underflow or overflow)
    }

    int8 c = 127; // -128 -> 127
    int256 d = -55; // alias int256

    bool myCondition = true;

    enum Choice {
        Up,
        Down,
        Left,
        Right
    }

    Choice choice = Choice.Up;
}