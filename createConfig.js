var truffleConfig = require("./truffle-config");
var Web3 = require('web3');
var web3 = new Web3(Web3.givenProvider || 'http://localhost:8545');
console.log(truffleConfig.networks.development.from);
var account;
web3.eth.getAccounts()
.then(accs => {
    account = accs[0];
    console.log(account);
});