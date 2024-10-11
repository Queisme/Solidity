// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; //stating our version

contract SimpleStorage {
    //Basic Types: boolean (true, false), 
    //             uint (unsigned integer, positive whole number),
    //             int (a signed whole number, positive or neg),
    //             address (an address - like metamask account addy),
    //             bytes ()
    //bool hasFavoriteNumber = true;
    //uint256 favoriteNumber = 88; //can set their bits, uint default = 256; intialized without assignment defaults to 0
    //int256 favoriteInt = -88;
    //string favoriteNumberinText = "eighty-eight"; //are bytes object just with text - can convert to bytes easily
    //address myAddress = 0x9Edc8dCDe643578d840C8470DB9733A083c9123B;
    //bytes32 favoriteBytes32 = "cat"; //represent hex. bytes32 is needed & largest.
    
    // Function Visibility Specifiers (there are 4) - if you don't actively label it will default to internal
    // public - visible externally & internally
    // private - only visibile in the current contract
    // external - only visible externally (only for functions)
    // internal - only visible internally
    
    uint256 myFavoriteNumber; // defaults to internal so must add public if you want to see it
                              // implicitly converted to a storage variable since it was added inside a contract and outside of a function
    
    //uint256[] listOfFavoriteNumbers; //[0, 7, 86, 90, 1110]
    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    // creating a list (or array) of Person(s)
    // this is a dynamic array - because its size can shrink & grow without limit
    Person[] public listOfPeople; // []

    // if you look up a name it will automatically pull up their number que -> 1110
    mapping(string => uint256) public nameToFavoriteNumber;


    // this is a static array - this lists max size is 3
    // Person[3] public listOfPeople; 

    //Person public pat = Person({favoriteNumber: 7, name: "Pat"});
    //Person public mariah = Person({favoriteNumber: 13, name: "Mariah"});
    //Person public jon = Person({favoriteNumber: 5, name: "Jon"});
    //Person public que = Person({favoriteNumber: 1110, name: "Que"});



    //this function is updating something
    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
        
    }

    // view, pure 
    // view - a function marked view means we're going to read state from the blockchain
    //        and disallow updating state
    // pure - disallow updating state and they disallow reading from state or storage
    // // this view function is only reading from the blockchain & returning that
    function retrieve() public view returns(uint256){
        return myFavoriteNumber;
    }
    // // this pure function doesn't allow reading from state or storage
    //function retrieve() public pure returns(uint256){
    //    return 1110;
    //}

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // EVM Overview (Ethereum Virtual Machine) - how to compile and deploy smart contracts to the blockchain
    // EVM can access & store information in 6 places:

    // 1. Stack
    // 2. Memory - Temp variables that can be modified
    // 3. Storage - Permanent variables that can be modified
    // 4. Calldata - Temp variables that cannot be modified
    // 5. Code
    // 6. Logs

    // EVM compatiable blockchains & layer 2's
    // 1. Ethereum
    // 2. Polygon
    // 3. Arbitrum
    // 4. Optimism
    // 5. Zksync
    // 6. ++more


}