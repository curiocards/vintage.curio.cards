# Curio Cards Directory Site

This repo is for the original Ruby on Rails card directory and project information site located at [https://Vintage.Curio.Cards](https://vintage.curio.cards/)

**The new website is available at this repository: https://github.com/fafrd/curio-cards-site-2021**

## Project Overview

Curio Cards is an Ethereum art project created by Travis Uhrig, Thomas Hunt, and Rhett Creighton. It's an online collection of rare digital artwork, with rarity achieved with ethereum tokens you can buy, own, and trade. The project came out of discussions around digital scarcity, limitations for artists selling digital artwork, and expanding on the San Francisco Bitcoin Meetup Groups' Annual Art Show.

Released May 09th of 2017, Curio appears to be the first non-fungible art token sold on mainnet Ethereum (please drop us a line if you know of an earlier project). Over the span of 4 months Curio Cards deployed 30 card contracts representing 30 rare digital print series' made by 7 artists. All funds raised from the sale of cards went to the artist.

## Ethereum Smart Contract

The original Curio Cards are referenced in the ERC-721 EIP, a standardized non-fungible-tokens contract that was developed after Curio's release. Curio contains many features and concepts that were included in ERC-721 and since become standard for NFTs, such as:

- Automatic vending machine style purchasing
- Non-divisible tokens with a limited supply
- IPFS hashes to embed the artwork into the smart contract
- Ownership of a token representing ownership of publicly viewable digital artwork

In 2021 a wrapper contract was deployed that allowed native Curio Cards to be compatible with platforms like OpenSea. The Curios 2021 Wrapper contract is based on the ERC-1155 standard and created by Moon.
- [Curio Cards ERC1155 Wrapper Code](https://etherscan.io/address/0x73DA73EF3a6982109c4d5BDb0dB9dd3E3783f313#code)

Curio 2017 token smart contract is a modified ERC-20 contract created by Rhett Creighton, with contribution from Michael C.
- [Card 1 Contract Code](https://etherscan.io/address/0x6Aa2044C7A0f9e2758EdAE97247B03a0D7e73d6c#code)
- [Card 2 Contract Code](https://etherscan.io/address/0xE9A6A26598B05dB855483fF5eCc5f1d0C81140c8#code)
- [Card 3 Contract Code](https://etherscan.io/address/0x3f8131B6E62472CEea9cb8Aa67d87425248a3702#code)
- [Card 4 Contract Code](https://etherscan.io/address/0x4F1694be039e447B729ab11653304232Ae143C69#code)
- [Card 5 Contract Code](https://etherscan.io/address/0x5a3D4A8575a688b53E8b270b5C1f26fd63065219#code)
- [Card 6 Contract Code](https://etherscan.io/address/0x1Ca6AC0Ce771094F0F8a383D46BF3acC9a5BF27f#code)
- [Card 7 Contract Code](https://etherscan.io/address/0x2647bd8777e0C66819D74aB3479372eA690912c3#code)
- [Card 8 Contract Code](https://etherscan.io/address/0x2FCE2713a561bB019BC5A110BE0A19d10581ee9e#code)
- [Card 9 Contract Code](https://etherscan.io/address/0xbf4Cc966F1e726087c5C55aac374E687000d4d45#code)
- [Card 10 Contract Code](https://etherscan.io/address/0x72b34d637C0d14acE58359Ef1bF472E4b4c5712#code)
- [Card 11 Contract Code](https://etherscan.io/address/0xb36c87F1f1539c5FC6f6e7b1C632e1840C9B66b4#code)
- [Card 12 Contract Code](https://etherscan.io/address/0xD15af10A258432e7227367499E785C3532b50271#code)
- [Card 13 Contract Code](https://etherscan.io/address/0x2d922712f5e99428c65b44f09Ea389373d185bB3#code)
- [Card 14 Contract Code](https://etherscan.io/address/0x0565ac44e5119a3224b897De761a46A92aA28ae8#code)
- [Card 15 Contract Code](https://etherscan.io/address/0xdb7F262237Ad8acca8922aA2c693a34D0d13e8fe#code)
- [Card 16 Contract Code](https://etherscan.io/address/0x1b63532CcB1FeE0595c7fe2Cb35cFD70ddF862Cd#code)
- [Card 17 Contract Code](https://etherscan.io/address/0xF59536290906F204C3c7918D40C1Cc5f99643d0B#code)
- [Card 18 Contract Code](https://etherscan.io/address/0xA507D9d28bbca54cBCfFad4BB770C2EA0519F4F0#code)
- [Card 19 Contract Code](https://etherscan.io/address/0xf26BC97Aa8AFE176e275Cf3b08c363f09De371fA#code)
- [Card 20 Contract Code](https://etherscan.io/address/0xD0ec99E99cE22f2487283A087614AEe37F6B1283#code)
- [Card 21 Contract Code](https://etherscan.io/address/0xB7A5a84Ff90e8Ef91250fB56c50a7bB92a6306EE#code)
- [Card 22 Contract Code](https://etherscan.io/address/0x148fF761D16632da89F3D30eF3dFE34bc50CA765#code)
- [Card 23 Contract Code](https://etherscan.io/address/0xCDE7185B5C3Ed9eA68605a960F6653AA1a5b5C6C#code)
- [Card 24 Contract Code](https://etherscan.io/address/0xE67dad99c44547B54367E3e60fc251fC45a145C6#code)
- [Card 25 Contract Code](https://etherscan.io/address/0xC7f60C2b1DBDfd511685501EDEb05C4194D67018#code)
- [Card 26 Contract Code](https://etherscan.io/address/0x1cB5BF4Be53eb141B56f7E4Bb36345a353B5488c#code)
- [Card 27 Contract Code](https://etherscan.io/address/0xfb9f3fa2502d01d43167a0a6e80be03171df407e#code)
- [Card 28 Contract Code](https://etherscan.io/address/0x59D190e8A2583C67E62eEc8dA5EA7f050d8BF27e#code)
- [Card 29 Contract Code](https://etherscan.io/address/0xD3540bCD9c2819771F9D765Edc189cBD915FEAbd#code)
- [Card 30 Contract Code](https://etherscan.io/address/0x7f5b230dc580d1e67df6ed30dee82684dd113d1f#code)
