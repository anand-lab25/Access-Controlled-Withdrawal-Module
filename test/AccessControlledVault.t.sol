// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/AccessControlledVault.sol";

contract AccessControlledVaultTest is Test {
    AccessControlledVault vault;
    address owner = address(0xA11CE);
    address guardian = address(0xBC);
    address attacker = address(0xDEAD);

    function setUp() {
        vm.prank(owner);
        vault = new AccessControlledVault(guardian);
    }
}
