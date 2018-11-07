
// <div id="myval"></div>
  $( document ).ready(function() {
    let Web3 = require('web3');
    let web3 = new Web3(new Web3.providers.HttpProvider('https://api.myetherwallet.com/eth'));
    let vendingJson = '[{"constant":true,"inputs":[],"name":"available","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"amountRaised","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"CloseVending","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"price","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"claimFunding","outputs":[],"payable":false,"type":"function"},{"inputs":[{"name":"holdingAddress","type":"address"},{"name":"token","type":"address"},{"name":"budget","type":"uint256"},{"name":"rate","type":"uint256"}],"payable":false,"type":"constructor"},{"payable":true,"type":"fallback"}]';
    let contractABI = JSON.parse(vendingJson);
    console.log(contractABI);

    let MyContract = web3.eth.contract(contractABI);

    // input values here
    let card28addr   = "0x59D190e8A2583C67E62eEc8dA5EA7f050d8BF27e";
    let card28vend1addr = "0x3273eF350E9ffC8f33eA80971650c7c627B43120";
    let card29addr   = "0xD3540bCD9c2819771F9D765Edc189cBD915FEAbd";
    let card29vend1addr = "0x39B058eC8B2fa19Cec655A87EaC127Ba434111b1";
    let card30addr   = "0x7f5b230dc580d1e67df6ed30dee82684dd113d1f";
    let card30vend1addr = "0x338C6fbcEff5433412382590a7de6da03Bb57389";

    //outputs
    //vending machine quantity values output
    $('#output28vend1supply').html(MyContract.at(card28vend1addr).available().toString());
    $('#output29vend1supply').html(MyContract.at(card29vend1addr).available().toString());
    $('#output30vend1supply').html(MyContract.at(card30vend1addr).available().toString());

    //card address output for site
    $('#outputcard28addr').html(card28addr);
    $('#outputcard28vend1addr').html(card28vend1addr);

    $('#outputcard29addr').html(card29addr);
    $('#outputcard29vend1addr').html(card29vend1addr);

    $('#outputcard30addr').html(card30addr);
    $('#outputcard30vend1addr').html(card30vend1addr);
  });
