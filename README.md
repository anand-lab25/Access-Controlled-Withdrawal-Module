# 🔐 access-controlled-withdrawal-module

A minimal ETH vault contract with role-based access control for withdrawals, designed to demonstrate defensive programming, modular architecture, and audit-ready event traceability.

## ⚙️ Design Philosophy

- **Role Separation**: `owner` and `guardian` roles for controlled access.
- **Custom Errors**: `Unauthorized`, `WithdrawPaused`, `InsufficientBalance` for gas-efficient reverts.
- **Pause Logic**: Withdrawals can be paused/unpaused by authorized roles.
- **Minimal MVP**: Core logic implemented cleanly before layering in advanced features.

## 🧪 Testing Strategy

- Revert coverage for unauthorized access and paused withdrawals
- Event verification for deposits, withdrawals, and role changes
- Fuzzing for withdrawal amounts and role interactions
- Composability checks with mock receivers

## 🧠 Testing Philosophy

Tests are designed not just for correctness, but for auditability and survivability.  
Each case isolates a specific failure mode or role interaction, ensuring the vault behaves predictably under edge conditions.  
Custom errors and event emissions are verified to support gas-aware design and traceable execution.



## 🧠 Signals to Recruiters

- Defensive engineering and role-based access control
- Gas-aware design and custom error usage
- Event traceability and modular thinking
- Audit-ready structure and repo hygiene

## 🧑‍💻 Author

Built by [James](https://github.com/anand-lab25), protocol engineer in training focused on Solidity, EVM mechanics, and audit-ready smart contract modules.
