const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3'); //Constructor Function

const web3 = new Web3(ganache.provider()); //Connect to test network


