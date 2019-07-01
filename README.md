# Curio Cards Directory Site

This repo is for the Ruby on Rails card directory and project information site located at <https://Curio.Cards>

## Project Overview

Curio Cards is an Ethereum art project created by Travis Uhrig, Thomas Hunt, and Rhett Creighton. It's an online collection of rare digital artwork, with rarity achieved with ethereum tokens you can buy, own, and trade. The project came out of discussions around digital scarcity, limitations for artists selling digital artwork, and expanding on the San Francisco Bitcoin Meetup Groups' Annual Art Show.

Released May 09th of 2017, Curio appears to be the first non-fungible art token sold on mainnet Ethereum (please drop us a line if you know of an earlier project). Over the span of 4 months Curio Cards deployed 30 card contracts representing 30 rare digital print series' made by 7 artists.

## Ethereum Smart Contract

Curio Cards is referenced in the ERC-721 EIP, a standardized non-fungible-tokens contract that was developed after Curio's release. Curio contains many features and concepts that were included in ERC-721 and since become standard for NFTs, such as:

- Automatic vending machine style purchasing
- Non-divisible tokens with a limited supply
- IPFS hashes to embed the artwork into the smart contract
- Ownership of a token representing ownership of publicly viewable digital artwork

Curio's token smart contract is a modified ERC-20 contract created by Rhett Creighton and Michael C.
