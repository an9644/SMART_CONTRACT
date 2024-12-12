// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Aution{
    struct carAution{
        string car;
        string model;
        uint16 price;
    }
        address admin ;
        address  owner;
        address buyer;


    mapping (uint16 _id => carAution)public caraution;

    constructor(){
        admin=msg.sender;
    }
    modifier onlyAdmin(){
        require(msg.sender==admin,"Unauthorized");
        _;
    }
    function issue(uint16 _id,string memory _car,string memory _model,uint16 _price)public onlyAdmin{
            caraution[_id]=carAution(_car,_model,_price);
            owner=msg.sender;

    }
    function aution(uint16 _id)public payable {
        if(msg.value>caraution[_id].price){
            uint bal=msg.value-caraution[_id].price;
            if(bal>0)
                payable (msg.sender).transfer(bal) ;
                owner=msg.sender;
        }else{
             payable (buyer).transfer(msg.value);
            revert("Insufficient funds .amount refunded");
        }
    }
}