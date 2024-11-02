// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {Example3} from "../src/Example3.sol";

contract ExampleTest3 is Test {
    Example3 public example3;
    
    function setUp() public {
        example3 = new Example3(2, 2);
    }

    function testExample3() public view {
        assertEq(example3.sum(), 4);
    }
}