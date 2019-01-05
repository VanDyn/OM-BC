const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3'); //Constructor Function

const provider = ganache.provider();
const web3 = new Web3(provider); //Connect to test network

const {interface, bytecode} = require('../compile'); //fetch reference to bytecode and abi from copile.js

let accounts;
let market;

beforeEach(async () => {
	//Get a list of all accounts
	accounts = await web3.eth.getAccounts();

	//Use on account to deploy contract
	market = await new web3.eth.Contract(JSON.parse(interface))
	.deploy({data: bytecode, arguments: []})
	.send({from: accounts[0], gas: '1000000'});

	market.setProvider(provider);
});

describe('Market', () => {
	it('deploys a contract', () => {
		//if value is correct and exists then likely contract is published
		assert.ok(market.options.address);
	});

	it('has a market publisher', async () => {
		const marketPublisher = await market.methods.marketPublisher().call();
		assert.equal(marketPublisher, accounts[0]);
	});

	it('can add a contract', async () =>{
		
		await market.methods.addContract('1','1','1', accounts[0]).send({
			from: accounts[0],
		});

		const contract = await market.methods.getContractAddresses().call({
			from: accounts[0]
		});
		
		//assert.equal(expected,actual)
		assert.equal(accounts[0], contract[0]);
		assert.equal(1,contract.length);
	});

});