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
    function addContract(uint _x, uint _y, uint _z, address _auction) public {
        
        // var liveContract = contracts[msg.sender];
        
        // liveContract.x = _x;
        // liveContract.y = _y;
        // liveContract.z = _z;
        
        //Use contract owners address to reference job
        contractAddresses.push(_auction);
        

       //sendToAuction(_x,_y,_z,_auction);
    }
    
    //Return all contract addresses
    function getContractAddresses() view public returns(address[]){
        return contractAddresses;
    }
    
    //Returns index contract by address
    function getContract(address _address) view public returns (uint){
        //return (contracts[_address].x, contracts[_address].y, contracts[_address].z);
        return (contracts[_address].x);
    }
    
    
    function sendToAuction(uint _x, uint _y, uint _z, address _auction) private {
        
        Auctioneer auc = Auctioneer(_auction);
        auc.auctionJob();
        
    }
    
    // To be implemented when cost function implemented
    /*  function sendToAuction(uint _x, uint _y, uint _z) private {
        
        Auctioneer auc = new Auctioneer();
        auc.auctionJob(_x,_y,_z);
        
    }*/
    
     
}


contract Auctioneer {
    

    
    function addAgents(uint _cost_function) public;
    function auctionJob() public view returns (uint);
    
    //Tobe implemented when actual cost function
    /* function auctionJob(uint _x, uint _y, uint _z) public returns (uint) {
        return retrieveBids();
    }*/
    
    function retrieveBids() private view returns (uint);
    
}

