# Decentralized Marketplace Lite

This repository provides a clean, production-ready smart contract for building a decentralized marketplace. It is perfect for developers who want to integrate peer-to-peer trading into their dApps.

## How it Works
1. **List Item:** A seller lists an item by providing a price and metadata (or token ID).
2. **Escrow:** The contract holds the listing details securely.
3. **Purchase:** A buyer sends the required funds to the contract.
4. **Settlement:** The contract automatically sends the payment to the seller and marks the item as sold.



## Features
* **Safe Transfers:** Uses the "pull-over-push" pattern for withdrawals to prevent reentrancy attacks.
* **Low Gas:** Optimized state management to keep listing and buying costs minimal.
* **Order Tracking:** Integrated event logging for easy frontend indexing.
