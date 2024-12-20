// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {

    // declare event
    event NewZombie(uint zombieId, string name, uint dna);

    uint256 dnaDigits = 16;
    uint256 dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint256 dna;
    }

    Zombie[] public zombies;

    mapping (uint256 => address) public zombieToOwner;
    mapping (address => uint256) ownerZombieCount;

    // A mapping is a key-value store for storing & lookin up data

    /* function eatHamburgers(string memory _name, uint _amount) public {
            
            ** it's convention - but not required - to start function parameter
            variable names with an underscore to differentiate them from global
            variables **

            this is a function that takes 2 parameters: a string & a uint

            function visibility is public

            function parameter variable, _name, should be stored in memory - required for all 
            reference types such as: arrays, structs, mappings, strings
    }*/

    function _createZombie(string memory _name, uint256 _dna) internal {
        uint256 id = zombies.push(Zombie(_name, _dna)) - 1;
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        emit NewZombie(id, _name, _dna);

        // msg.sender - is a global variable that is available to all functions which refers to the address of the person (or contract) that called the current function
        // A contract will sit on the blockchain doing nothing until someone calls one of its functions. There will always be a msg.msg.sender

    }

    /* 
    
    ** it's convention - but not required - to start a private function name with an underscore to differentiate them from public functions **

    In Solidity, functions are PUBLIC by default - meaning any other contract can call your contract's function and execute its code 
    
    Marking your functions PRIVATE means only other functions within your contract will be able to call that function 

    INTERNAL is the same as PRIVATE - except it's also accessible to contracts that inherit from this contract

    EXTERNAL is similar to PUBLIC - except these functions can ONLY be called outside the contract, meaning, they can't be called by other functions inside that contract

    

    Events are a way for your contract to communicate that something happened on the blockchain to your app front-end which can be listening for certain events & take action when they happen - declare the event with the state variables

    
        
    */

    function _generateRandomDna(string memory _str) private view returns (uint256) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    /*

    Ethereum has the hash function keccak256 built in

    */

   function createRandomzombie(string memory _name) public {
        require(ownerZombieCount[msg.sender] == 0);
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

    // require - makes it so the function will throw an error and stop executing if some condition is not true


    /*

    function sayHiToQue(string memory _name) public returns (string memory) {
        // Solidity doesn't have native string comparison so we have to compare their keccak256 hashes to see if strings are equal

        require(keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Que")));

        // if true, function will proceed

        return "Hi!";
    }



    */
}

contract ZombieFeeding is ZombieFactory {
    
}
