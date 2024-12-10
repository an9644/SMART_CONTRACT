//SPDX-License-Identifier: MIT   
pragma solidity 0.8.26;

contract MyBook{
    string public title; //state variable// free ayit getter function kitum 
    uint16 public price; // sate veriable
    address public owner;
    bool public sold;

    function getBook()public view returns(string memory,uint16){
        return (title,price);
    }
    function setBook(string memory _title,uint16 _price)public{
        title=_title;
        price=_price;
        owner=msg.sender;
        sold=false;
    }
    function ethToWei(uint eval)public pure returns(uint){
        return(eval*1000000000000000000);
    }    string department;
    address designation;
   
    function buyBook()public payable {
        if(msg.value >= ethToWei(price)){
            uint bal= msg.value-ethToWei(price);
            if(bal>0)
            payable (msg.sender).transfer(bal);
            owner=msg.sender;
            sold=true;
        }
    }
     
}
