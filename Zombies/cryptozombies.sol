// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {
    uint256 dnaDigits = 16;
    uint256 dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint256 dna;
    }

    Zombie[] public zombies;

    /* function eatHamburgers(string memory _name, uint _amount) public {
            
            ** it's convention - but not required - to start function parameter
            variable names with an underscore to differentiate them from global
            variables **

            this is a function that takes 2 parameters: a string & a uint

            function visibility is public

            function parameter variable, _name, should be stored in memory - required for all 
            reference types such as: arrays, structs, mappings, strings
    }*/

    function _createZombie(string memory _name, uint256 _dna) private {
        zombies.push(Zombie(_name, _dna));
    }

    /* 
    
    ** it's convention - but not required - to start a private function name with an underscore to differentiate them from public functions **

    In Solidity, functions are public by default - meaning any other contract can call your contract's function and execute its code 
    
    Marking your functions private means only other functions within your contract will be able to call that function 
        
    */

    function _generateRandomDna(string memory _str) private view {}
}
