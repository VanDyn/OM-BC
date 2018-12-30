const path = require('path'); //Get ABI code from compiler after solidity code compiled
const fs = require('fs');
const solc = require('solc');

//Generates path point directly to market file
const marketPath = path.resolve(__dirname, 'contracts', 'Market.sol');
const source = fs.readFileSync(marketPath, 'utf8');


module.exports = solc.compile(source,1).contracts[':Market'];


