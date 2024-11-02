// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Test} from "forge-std/Test.sol";
import {Example2} from "../src/Example2.sol";

contract Example2Test is Test {
    Example2 public example2;

    function setUp() public {
        example2 = new Example2();
    }

    function testExample2() public view {}


}
