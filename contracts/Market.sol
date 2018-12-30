pragma solidity ^0.4.17;

contract Market {
    
    address public marketPublisher;
    address[] public jobAddresses;
    
    struct Agent {
        
        uint x;
        uint y;
        uint z;
        uint battLife;
        uint costFunction;
        
    }
    
    Agent[] public agents;
    
    
    function Market() public {
        marketPublisher = msg.sender;
        
        agents.push(Agent(2,2,0,1,10));
        agents.push(Agent(1,1,0,1,1));
        
    }
    
    //Add a contract to the market for auction
    //Records jobowner as well 
    //Need a require statement that ensures a 'template' contract is being sent perhaps a struc?
    function addContract(address jobContract) public {
        
        //this function will eventually become payable
        jobAddresses.push(jobContract);
        
        
    }
    
     
}