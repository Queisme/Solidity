// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "../lib/forge-std/src/Test.sol";
import {Example} from "../src/Example.sol";

contract ExampleItest is Test {
    Example public example;

    function setUp() public {
        example = new Example(Example.Choice.Right);
    }
    function testExample() public {}
}