// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Aution{
    struct carAution{
        string car;
        string model;
        uint16 price;
    }
        address admin ;

    mapping (uint256 _id => carAution)public caraution;

    constructor(){
        admin=msg.sender;
    }
    modifier onlyAdmin(){
        require(msg.sender==admin,"Unauthorized");
        _;
    }
    function issue(uint256 _id,string memory _car,string memory _model,uint16 _price)public onlyAdmin{
           
            caraution[_id]=carAution(_car,_model,_price);
    }
    function aution()public payable {
        if(msg.value>caraution.price){
            payable (msg.sender).transfer(msg.value);
        }
    }
}