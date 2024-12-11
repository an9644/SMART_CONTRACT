// SPDX-License-Identifier: MIT
import "./Inheritance.sol";
pragma solidity 0.8.26;

contract Employee is Person{
    uint empId;

    
    function  setEmployeeDetails(string memory _name,uint _age,uint _empId)public{
        setPerson(_name,_age);
        empId=_empId;
    }
 function getEmployeeDetails() public view returns (string memory, uint, uint) {
        // return (getName(), getAge(), empId);

}

}