// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Q1_2{
    uint16 num;

   

    function checkSign(int _num)public pure returns(string memory){
            if(_num>0) return "Positive";
            else if(_num<0) return "Negative";
            else return "zero";
        }

}

