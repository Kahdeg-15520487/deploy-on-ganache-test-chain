var CertificationRegistry = artifacts.require("./CertificationRegistry.sol");
var OrganizationalCertification = artifacts.require("./OrganizationalCertification.sol");
var IndividualCertification = artifacts.require("./IndividualCertification.sol");
var fs = require('fs'); 

module.exports = function(deployer, network, accounts) {
  let account = accounts[0];
  console.log(account);
  deployer.deploy(CertificationRegistry, {gas:5000000, from: account})
          .then(async function(contract){
            let contractAddress = CertificationRegistry.address;
            console.log(contractAddress);
            //save account's address and contract's address
            fs.writeFile('ethconn.json', JSON.stringify({AccountAddress: account, MasterContract: contractAddress}) , function (err) {
              if (err) throw err;
              console.log('Saved!');
            }); 
            console.log(contract);
            //add account's address to rosenadmin
            await contract.addRosenCertAdmin(account);
          });
};
