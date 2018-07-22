
// <div id="myval"></div>
  $( document ).ready(function() {
    let Web3 = require('web3');
    let web3 = new Web3(new Web3.providers.HttpProvider('https://api.myetherapi.com/eth'));
    let vendingJson = '[{"constant":true,"inputs":[],"name":"available","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"amountRaised","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"CloseVending","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"price","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"claimFunding","outputs":[],"payable":false,"type":"function"},{"inputs":[{"name":"holdingAddress","type":"address"},{"name":"token","type":"address"},{"name":"budget","type":"uint256"},{"name":"rate","type":"uint256"}],"payable":false,"type":"constructor"},{"payable":true,"type":"fallback"}]';
    let contractABI = JSON.parse(vendingJson);
    console.log(contractABI);

    let MyContract = web3.eth.contract(contractABI);

    // input values here
    let card14addr   = "0x0565ac44e5119a3224b897De761a46A92aA28ae8";
    let card14vend1addr = "0xa27c29ce0c7096cc27f1f165dc265daf152b0f45";

    let card15addr   = "0xdb7F262237Ad8acca8922aA2c693a34D0d13e8fe";
    let card15vend1addr = "0xc2b2cd010812df044363687a0287efe84cfee1f1";

    let card16addr   = "0x1b63532CcB1FeE0595c7fe2Cb35cFD70ddF862Cd";
    let card16vend1addr = "0x558cefca4779f3c3d9203b3fb0f3b5bc54e681e9";

    let card20addr   = "0xD0ec99E99cE22f2487283A087614AEe37F6B1283";
    let card20vend1addr = "0x6E561B66f393166d611f40A1e82E373f00270393";



    //outputs
    //vending machine quantity values output
    $('#output14vend1supply').html(MyContract.at(card14vend1addr).available().toString());
    $('#output15vend1supply').html(MyContract.at(card15vend1addr).available().toString());
    $('#output16vend1supply').html(MyContract.at(card16vend1addr).available().toString());
    $('#output20vend1supply').html(MyContract.at(card20vend1addr).available().toString());

    //card address output for site
    $('#outputcard14addr').html(card14addr);
    $('#outputcard14vend1addr').html(card14vend1addr);

    $('#outputcard15addr').html(card15addr);
    $('#outputcard15vend1addr').html(card15vend1addr);

    $('#outputcard16addr').html(card16addr);
    $('#outputcard16vend1addr').html(card16vend1addr);

    $('#outputcard20addr').html(card20addr);
    $('#outputcard20vend1addr').html(card20vend1addr);

  });
