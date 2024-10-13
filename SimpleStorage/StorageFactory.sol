// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {SimpleStorage} from "./SimpleStorage.sol"; 
//advance import = named import
//always use named import
//import multiple contracts: {SimpleStorage, SimpleStorage2}

contract StorageFactory{

    // uint256 public favoriteNumber
    // type visibility name

    SimpleStorage[] public listOfSimpleStorageContracts; 
    //address[] public listOfSimpleStorageAddresses;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public{
        // Address
        // ABI - Application Binary Interface
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}