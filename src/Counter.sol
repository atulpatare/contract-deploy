// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

contract Counter {
    uint256 counter;

    function updateCounter() public {
        counter ++;
    }

    function getCounter() public view returns(uint256) {
        return counter;
    }
}
