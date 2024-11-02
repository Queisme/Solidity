// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {console} from "../lib/forge-std/src/console.sol";

contract Example {
    uint8 a = 255; // 0 -> 255
    //uint256 b = 22; // alias: uint
    uint256 b = type(uint256).max; // max value for unsigned int

    int8 c = 127; // -128 -> 127
    int256 d = -55; // alias int256

    bool myCondition = true; //default is false

    enum Choice {
        Up,
        Down,
        Left,
        Right
    }

    constructor(Choice choice) {
        //a += 1; //results in a runtime error (arithmatic underflow or overflow)
        /*
        unchecked {
            a += 1;
            a += 1;
            a += 1;
        console.log(a);
        */
        //console.logBytes32(bytes32(b));
        //console.logInt(type(int256).min);
        //console.logInt(type(int256).max);
        
        if(myCondition){
            console.log("Waka waka waka");
        }
        
       if (choice == Choice.Up){
        console.log("That's up");
       }

       if (choice == Choice.Down){
        console.log("And that's down");
       }

       if (choice == Choice.Right){
        console.log("That's right");
       }

       if (choice == Choice.Left){
        console.log("And that's left");
       }
       
    }
}