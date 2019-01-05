pragma solidity ^0.4.17;

contract Auctioneer {
    
    struct Agent {
        uint costFunction;
    }
    
    Agent[] public agents;
    uint public numberOfAgents;
    
    function addAgents(uint _cost_function) public {
        agents.push(Agent(_cost_function));
    }
    
    function agentCount() public returns (uint){
        numberOfAgents = agents.length;
        return numberOfAgents;
    }
    
    function auctionJob() public view returns (uint) {
        //Validate there are agents to bid 
        require(agentCount() > 0);
        return retrieveBids();
    }
    
    //Tobe implemented when actual cost function
    /* function auctionJob(uint _x, uint _y, uint _z) public returns (uint) {
        return retrieveBids();
    }*/
    
    function retrieveBids() private view returns (uint) {
        return agents[0].costFunction;
    }
    
    
}