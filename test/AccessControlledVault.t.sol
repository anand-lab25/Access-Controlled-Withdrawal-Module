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

    function testWithdraw_UnauthorizedReverts() public {
        vm.deal(address(vault), 1 ether);
        vm.prank(attacker);
        vm.expectRevert(AccessControlledVault.Unauthorized.selector);
        vault.withdraw(0.2 ether);
    }

    function testSetGuardian_UnauthorizedReverts() public {
        vm.prank(attacker);
        vm.expectRevert(AccessControlledVault.Unauthorized.selector);
        vault.setGuardian(address(0xACDE));
    }
}
