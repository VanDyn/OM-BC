pragma solidity ^0.4.17;

contract Market {
    
    address public marketPublisher;
   
    
    //Outline structure of the contract. 
    //To begin only have simple move jobs.
    struct Contract {
        
        uint x;
        uint y;
        uint z;
        
    }
    
    mapping (address => Contract) contracts; 
    address[] public contractAddresses;
    
    function Market() public {
        marketPublisher = msg.sender;
    }
    
    //Add a contract to the market for auction
    //this function will eventually become payable
    function addContract(uint _x, uint _y, uint _z) public {
        
        var liveContract = contracts[msg.sender];
        
        liveContract.x = _x;
        liveContract.y = _y;
        liveContract.z = _z;
        
        //Use contract owners address to reference job
        contractAddresses.push(msg.sender);
        
        //This should be changed to 
        sendToAuction(_x,_y,_z);
    }
    
    //Return all contract addresses
    function getContractAddresses() view public returns(address[]){
        return contractAddresses;
    }
    
    //Returns index contract by address
    function getContract(address _address) view public returns (uint, uint, uint){
        return (contracts[_address].x, contracts[_address].y, contracts[_address].z);
    }
    
    
    function sendToAuction(uint _x, uint _y, uint _z) private {
        
        Auctioneer auc = new Auctioneer();
        auc.auctionJob(_x,_y,_z);
        
    }
    
     
}


contract Auctioneer {
    
    struct Agent {
        uint costFunction;
    }
    
    Agent[] public agents;
    
    function Auctioneer() public {
        
    }
    
    function addAgents(uint _cost_function) public {
        agents.push(Agent(_cost_function));
    }
    
    function auctionJob(uint _x, uint _y, uint _z) public returns (uint) {
        return retrieveBids();
    }
    
    function retrieveBids() private returns (uint){
        return agents[0].costFunction;
    }
    
    
}