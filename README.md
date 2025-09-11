🔐 access-controlled-withdrawal-module 

Audit-ready ETH vault module engineered for composability, gas-efficiency, and production-grade access control. 
Designed to signal professional judgment, modular thinking, and repo hygiene.

![Audit-Ready](https://img.shields.io/badge/Audit--Ready-Yes-green)
![Survivability-Logic](https://img.shields.io/badge/Survivability--Logic-Embedded-blue)
![Gas-Profiled](https://img.shields.io/badge/Gas--Profiled-Foundry-lightgrey)


## 📦 Module Overview

- This vault module enforces ETH withdrawal permissions via role-based access control.  
- Designed for composability, audit-readiness, and gas-aware execution under adversarial conditions.  
- Implements minimal MVP logic with pause toggling, custom errors, and traceable event emissions.


## 🎯 Why This Matters

This module demonstrates how I approach smart contract engineering:  
- **Security-first**: Role separation, pause logic, and custom errors  
- **Audit-aware**: Event traceability and curated coverage summaries  
- **Gas-conscious**: Profiling and optimization across core flows  
- **Repo hygiene**: Structured commits, curated README, and survivability logic


## ⚙️ Design Philosophy

- **Role Separation**: `owner` and `guardian` roles for controlled access and operational resilience.
- **Custom Errors**: `Unauthorized`, `WithdrawPaused`, `InsufficientBalance` for gas-efficient reverts and clear failure modes.
- **Pause Logic**: Withdrawals can be paused/unpaused by authorized roles to mitigate risk.
- **Minimal MVP**: Core logic implemented cleanly before layering in advanced features. Favoring simplicity over complexity.

## 🧪 Testing Strategy

- Revert coverage for unauthorized access and paused withdrawals.
- Event verification for deposits, withdrawals, and role changes.
- Currently covers zero-value withdrawal and unauthorized access scenarios.
- Composability checks with mock receivers.

## 🧠 Testing Philosophy

Tests written in Foundry using forge-std utilities for revert matching, event decoding, and composability checks. 
Each test narrates a failure mode or role boundary, supporting auditability and survivability logic.


## 🚨 Coverage Summary

- ✅ 100% function coverage  
- ✅ 90.91% statement coverage  
- ✅ 71.43% branch coverage  
- 🔍 Remaining branches documented and intentionally skipped due to unreachable fallback paths.
Coverage metrics curated to reflect not just execution paths, but audit-relevant edge cases and intentional design gaps.


## ⛽ Gas Profiling
Gas usage was measured using Foundry’s built-in profiler to ensure cost-efficiency and composability across core vault operations.

| Function             | Min    | Avg    | Max    | Calls |
|----------------------|--------|--------|--------|--------|
| pauseWithdrawal()    | 29,335 | 29,335 | 29,335 | 2      |
| paused()             | 2,517  | 2,517  | 2,517  | 2      |
| receive()            | 21,120 | 21,883 | 22,646 | 2      |
| setGuardian()        | 23,888 | 25,579 | 27,270 | 2      |
| unpauseWithdrawal()  | 26,491 | 26,491 | 26,491 | 1      |
| withdraw()           | 23,868 | 27,506 | 32,743 | 5      |

Custom errors reduce revert cost and improve traceability.

Role-based logic ensures predictable gas usage across authorized and unauthorized flows.

Pause/unpause operations are optimized for low-cost toggling under access control.

Withdrawals show stable gas behavior across success, failure, and paused states.

Deployment cost: 589,879 gas Contract size: 2,629 bytes.


## 🧠 Signals to Recruiters

- Defensive engineering and role-based access control.
- Gas-aware design and custom error usage.
- Event traceability and modular thinking.
- Audit-ready structure and repo hygiene.
- README and commit taxonomy reflect ownership, survivability logic, and engineering clarity.

![Foundry](https://img.shields.io/badge/Tested%20With-Foundry-blue)

## 🧾 Commit Taxonomy

Commits follow a structured format to narrate engineering decisions:

- `docs: embed gas profiling table and deployment cost`
- `docs: articulate testing philosophy and failure mode narration`
- `docs: add recruiter signaling section with survivability logic`
- `docs: refine module overview for composability emphasis`
- `test: add revert coverage for unauthorized withdrawal`
- `feat: implement guardian role with setGuardian()`
- `chore: separate raw gas output from curated summary`

This taxonomy supports audit trails and recruiter review.


## 🧠 TL;DR

- Minimal ETH vault with role-based access control, pause logic, and custom errors.  
- Tested with Foundry, gas-profiled, and designed for auditability and survivability.  
- Built to signal professional judgment, modular thinking, and repo hygiene.



## 🧑‍💻 Author

Built by [James](https://github.com/anand-lab25), protocol engineer in training focused on Solidity, EVM mechanics, and audit-ready smart contract modules.
Every module reflects survivability logic, audit-readiness, and professional judgment.


---

📬 Feedback, suggestions, or audit insights welcome via [GitHub Issues](https://github.com/anand-lab25/access-controlled-withdrawal-module/issues).  
This module is part of a growing portfolio focused on composable, audit-ready smart contract primitives.

## 📬 Let’s Connect

If you're hiring Solidity engineers who treat every repo like a production-grade artifact, I’d love to talk.

- 📧 anand.business1988@gmail.com 
- 🧑‍💻 [Portfolio](https://github.com/anand-lab25)
