// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./Counter.sol";

contract DeployTest is DSTest {
    Counter counter;

    function setUp() public {
        counter = new Counter();
    }

    function test_counter() public {
        counter.updateCounter();
        assertEq(counter.getCounter(), 1);
    }

    function test_counter_value() public {
        uint256 count = counter.getCounter();
        
        assertEq(count, 0);
        counter.updateCounter();

        count = counter.getCounter();
        assertEq(count, 1);
    }
}
