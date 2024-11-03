// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.6.0;

import {ZombieFactory} from "./zombiefactory.sol";

//interface

contract KittyInterface {
    function getKitty(uint256 _id) external view returns (
        bool isGestating,
        bool isReady,
        uint256 cooldownIndex,
        uint256 nextActionAt,
        uint256 siringWithId,
        uint256 birthTime,
        uint256 matronId,
        uint256 sireId,
        uint256 generation,
        uint256 genes
    );
}

/*

    In Solidity - there are 2 locations to store variables: storage & memory

    Storage: variables stored permanently on the blockchain
    Memory: variables stored temporarily & erased between external function calls on contract

    State variables - variables declared outside functions are by default "storage" & written permanently to the blockchain

    Local variables - variables declared inside functions are by default "memory" & will disappear when the function call ends

    When dealing with structs and arrays - you need to use these keywords (storage or memory)

*/

contract ZombieFeeding is ZombieFactory {

    KittyInterface kittyContract;

    function setKittyContractAddress(address _address) external {
        kittyContract = KittyInterface(_address);
    }

    function feedAndMultiply(uint256 _zombieId, uint256 _targetDna, string memory _species) public {
        require(msg.sender == zombieToOwner[_zombieId]);
        Zombie storage myZombie = zombies[_zombieId];
        _targetDna = _targetDna % dnaModulus;
        uint newDna = (myZombie.dna + _targetDna) / 2;
        if (keccak256(abi.encodePacked(_species)) == (keccak256(abi.encodePacked("kitty")))){
            newDna = newDna - newDna % 100 + 99;
        }
        _createZombie("NoName", newDna);

    }

    function feedOnKitty(uint256 _zombieId, uint256 _kittyId) public {
        uint256 kittyDna;
        (,,,,,,,,,kittyDna) = kittyContract.getKitty(_kittyId);
        feedAndMultiply(_zombieId, kittyDna, "kitty");
    }

}