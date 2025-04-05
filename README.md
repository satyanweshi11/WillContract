<h1 align="center">📜 Will - Smart Inheritance Contract</h1>

<p align="center">
  <em>Trustless legacy planning using Ethereum & Solidity</em><br/>
  <strong>Automatic inheritance distribution once the owner is deceased</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Language-Solidity-black?style=flat-square&logo=ethereum" />
  <img src="https://img.shields.io/badge/License-MIT-green?style=flat-square" />
  <img src="https://img.shields.io/badge/Status-Working-brightgreen?style=flat-square" />
  <img src="https://img.shields.io/badge/Security-Basic%20Checks-red?style=flat-square" />
</p>

<hr/>

<h2>⚖️ What is Will?</h2>

<p>
<code>Will</code> is a decentralized smart contract written in Solidity that allows a user to set up a secure and automated inheritance plan. When the contract owner marks themselves as deceased, the stored Ether is distributed to predetermined wallets.
</p>

---

<h2>🧠 Core Concepts</h2>

<ul>
  <li><strong>Owner-based access control</strong>: Only the contract deployer can assign inheritance.</li>
  <li><strong>Deceased switch</strong>: Simulates death via a manual trigger.</li>
  <li><strong>Payable logic</strong>: Uses Solidity's <code>transfer</code> method to securely send Ether.</li>
  <li><strong>Mappings</strong>: Associates inheritance amounts to each wallet.</li>
  <li><strong>Modifiers</strong>: Clean and readable access control rules.</li>
</ul>

---

<h2>📜 Code Overview</h2>

```solidity
address owner;
uint fortune;
bool isDead;

constructor() payable {
    owner = msg.sender;
    fortune = msg.value;
    isDead = false;
}
