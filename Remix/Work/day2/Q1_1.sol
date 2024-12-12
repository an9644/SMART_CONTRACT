// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Q1_1{
   

    function findLargest(uint _num1,uint _num2, uint _num3)public pure returns(uint) {
        if(_num1>_num2 && _num1>_num3){
            return _num1;
        }else if(_num2>_num3){
            return _num2;
        }else{
            return _num3;
        }
    }
    function checkSign(int _num)public pure returns(string memory){
            if(_num>0) return "Positive";
            else if(_num<0) return "Negative";
            else return "zero";
        }
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

