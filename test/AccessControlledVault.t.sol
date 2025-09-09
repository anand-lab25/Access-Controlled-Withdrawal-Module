// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/AccessControlledVault.sol";

contract AccessControlledVaultTest is Test {
    AccessControlledVault vault;
    address owner = address(0xA11CE);
    address guardian = address(0xBC);
    address attacker = address(0xDEAD);
    event Withdraw(address indexed recepient, uint256 amount);
    event GuardianChanged(address indexed newGuardian);
    event Deposit(address indexed sender, uint256 amount);
    event Paused();
    event Unpaused();

    function setUp() public {
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
        vm.expectRevert(AccessControlledVault.WithdrawPaused.selector);
        vm.prank(guardian);
        vault.withdraw(1 ether);
    }

    function testWithdraw_InsufficientBalanceReverts() public {
        vm.deal(address(vault), 0 ether);
        vm.prank(guardian);
        vm.expectRevert(AccessControlledVault.InsufficientBalance.selector);
        vault.withdraw(1 ether);
    }

    function testWithdraw_SuccessEmitsEvents() public {
        vm.deal(address(vault), 2 ether);
        vm.prank(guardian);
        vm.expectEmit(true, false, false, true);
        emit Withdraw(guardian, 1 ether);
        vault.withdraw(1 ether);
    }

    function testSetGuardian_UpdateGuardian() public {
        vm.deal(address(vault), 2 ether);
        vm.prank(owner);
        vm.expectEmit(true, false, false, true, address(vault));
        emit GuardianChanged(guardian);
        vault.setGuardian(guardian);
    }

    function testReceiveEmitsDepositL() public {
        vm.deal(address(this), 2 ether);
        vm.expectEmit(true, false, false, true, address(vault));
        emit Deposit(address(this), 1 ether);
        (bool sent, ) = address(vault).call{value: 1 ether}("");
        assertTrue(sent);
    }

    function testPauseWithdrawalEmitsEventAndSetsState() public {
        vm.prank(owner);
        vm.expectEmit(false, false, false, true, address(vault));
        emit Paused();
        vault.pauseWithdrawal();
        assertTrue(vault.paused());
    }

    function testUnpauseWithdrawal() public {
        vm.prank(owner);
        vm.expectEmit(false, false, false, true, address(vault));
        emit Unpaused();
        vault.unpauseWithdrawal();
        assertFalse(vault.paused());
        vm.deal(address(vault), 2 ether);
        vm.prank(guardian);
        vault.withdraw(1 ether);
    }

    function testRevertZeroValueDoesNotEmits() public {
        vm.deal(address(vault), 2 ether);
        (bool sent, ) = address(vault).call{value: 0 ether}("");
        assertFalse(sent);
    }
}
