// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage{
    // add 5 to everyone's favorite number
    // overrides
    // virtual override

    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber + 5;
    }
    

}