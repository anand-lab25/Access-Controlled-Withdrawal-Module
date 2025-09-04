// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AccessControlledVault {
    address public owner;
    address public guardian;
    bool public paused;
    event Deposit(address indexed sender, uint256 amount);
    event Withdraw(address indexed recepient, uint256 amount);
    event GuardianChanged(address indexed newGuardian);
    event Paused();
    event Unpaused();
    error Unauthorized();
    error WithdrawPaused();
    error InsufficientBalance();
    modifier onlyOwner() {
        if (msg.sender != owner) revert Unauthorized();
        _;
    }
    modifier onlyGuardian() {
        if (msg.sender != guardian) revert Unauthorized();
        _;
    }

    constructor(address _guardian) {
        owner = msg.sender;
        guardian = _guardian;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external onlyGuardian {
        if (paused) revert WithdrawPaused();
        if (address(this).balance < amount) revert InsufficientBalance();
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "transfer failed");
        emit Withdraw(msg.sender, amount);
    }

    function setGuardian(address newGuardian) external onlyOwner {
        guardian = newGuardian;
        emit GuardianChanged(newGuardian);
    }

    function pauseWithdrawal() external onlyOwner {
        paused = true;
        emit Paused();
    }
}
