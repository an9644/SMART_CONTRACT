// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Q1_3{
    uint8 num;

    function getDigit(uint _num)public pure returns(string memory){
        if(_num==0) return "Zero";
        else if(_num==1) return "One";
        else if(_num==2) return "Two";
        else if(_num==3) return "Three";
        else if(_num==4) return "Four";
        else if(_num==5) return "Five";
        else return "Invalid Input";
    }


}