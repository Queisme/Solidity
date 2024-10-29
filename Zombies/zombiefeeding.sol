// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.6.0;

import {ZombieFactory} from "./zombiefactory.sol";

/*

    In Solidity - there are 2 locations to store variables: storage & memory

    Storage: variables stored permanently on the blockchain
    Memory: variables stored temporarily & erased between external function calls on contract

    State variables - variables declared outside functions are by default "storage" & written permanently to the blockchain

    Local variables - variables declared inside functions are by default "memory" & will disappear when the function call ends

    When dealing with structs and arrays - you need to use these keywords (storage or memory)

*/

contract ZombieFeeding is ZombieFactory {

    function feedAndMultiply(uint256 _zombieId, uint256 _targetDna) public {
        require(msg.sender == zombieToOwner[_zombieId]);
        Zombie storage myZombie = zombies[_zombieId];
    }

}