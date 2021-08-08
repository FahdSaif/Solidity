pragma solidity 0.8.4;

contract myCryptoBank{
    uint256 public bankCapital;
    address payable owner;
    event banknotice(string);
    
    modifier isOwner ( address _owner)
    {
        if(_owner==owner)
        {
            _;
        }
    }
    
    constructor() payable{
        require(msg.value >= 50 ether, "Hi Owner you must send atleast 50 Ether");
        owner = payable(msg.sender);
        bankCapital=msg.value;
        emit banknotice("The bank has commenced with the paid up capital");
    }
    
    function closeBank() payable public isOwner(msg.sender){
        selfdestruct(owner);
        emit banknotice("The bank is closed");
    }
}
