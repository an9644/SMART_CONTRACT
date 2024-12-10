//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyBook{
    string title;
    uint16 price;

    function getMessage()public view returns(string memory,uint16){
        return (title,price);
    }
    function setMessage(string memory _title,uint16 _price)public{
        title=_title;
        price=_price;
    }
}
