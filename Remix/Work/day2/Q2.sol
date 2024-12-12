// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Q2{
    uint8 year;

    function findLeap(uint16  _year)public pure returns(string memory){
        if(_year%4 == 0) return "This Year is a Leap Year";
        else return "its not a Leap year";
    }
}