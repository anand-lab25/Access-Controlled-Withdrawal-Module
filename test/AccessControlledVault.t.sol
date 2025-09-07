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

    function testWithdraw_PausedReverts() public {
        vm.deal(address(vault), 2 ether);
        vm.prank(owner);
        vault.pauseWithdrawal();
        vm.expectRevert(AccesssControlledVault.WithdrawPaused.selector);
        vm.prank(guardian);
        vault.withdraw(1 ether);
    }

    function testWithdraw_InsufficientBalanceReverts() public {
        vm.deal(address(vault), 0 ether);
        vm.prank(guardian);
        vm.expectRevert(AccessControlledVault.InsufficientBalance.selector);
        vm.withdraw(1 ether);
    }

    function testWithdraw_SuccessEmitsEvents() public {
        vm.deal(address(vault), 2 ether);
        vm.prank(guardian);
        vm.expectEmit(true, false, false, true);
        emit Withdraw(guardian, 1 ether);
        vault.withdraw(1 ether);
    }
}
