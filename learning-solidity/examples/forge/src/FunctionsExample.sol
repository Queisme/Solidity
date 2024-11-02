// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract FunctionsExample {
    function example1() private pure {
        // PRIVATE - Call me within this contract only
        // PURE - CANNOT read/write to storage
    }

    function example2() internal view {
        // INTERNAL - Call me within this contract + inheritance
        // VIEW - Can read from storage but CANNOT write to storage
    }

    function example3() public payable {
        // PUBLIC - Call me inside and outside this contract
        // PAYABLE - Send me some ether
    }

    function example4() external {
        // EXTERNAL - Call me from outside this contract

    }
}