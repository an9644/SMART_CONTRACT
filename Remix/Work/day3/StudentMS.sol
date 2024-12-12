// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract StudentMS{
    struct Student{
        string name;
        uint16 sem;
        uint16 CGPA;
        uint16 rollno;
        Dept dept;
    }
        enum Dept{
            CS,
            EC,
            ME
        }
    
    Student public student;

    function setStudent(string memory _name,uint16 _sem,uint16 _CGPA,uint16)