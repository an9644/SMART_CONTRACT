//SPDX-License-Identifier: MIT   
pragma solidity 0.8.26;

contract MyBook{
    struct book{
         string  title; //state variable// free ayit getter function kitum 
         uint16  price; // sate veriable
         address  owner;
         bool  sold;
    }
     book myBook;

    function getBook()public view returns(string memory,uint16){
        return(myBook.title,myBook.price);
    }
    function getBook(string memory _title,uint16 _price)public{
        myBook.title=_title;
        myBook.price=_price;
       myBook.owner=msg.sender;
       myBook.sold=false;
    }
    function ethToWei(uint eval)public pure returns(uint){
        return(eval*1000000000000000000);
    }
    function buyBook()public payable {
        if(msg.value >= ethToWei(myBook.price)){
            uint bal= msg.value-ethToWei(myBook.price);
            if(bal>0)
            payable (msg.sender).transfer(bal);
            myBook.owner=msg.sender;
            myBook.sold=true;
        }
    }
}
