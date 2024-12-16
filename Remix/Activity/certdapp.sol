// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Certi{
    struct Certificate{
        string name;
        string course;
        string grade;
        string date;
        bool exist;
    }
        address admin ;

    mapping (uint256 _id => Certificate)public certificates;

    constructor(){
        admin=msg.sender;
    }
    modifier onlyAdmin(){
        require(msg.sender==admin,"Unauthorized");
        _;
    }

    function issue(uint256 _id,string memory _name,string memory _course,string memory _grade,string memory _date)public onlyAdmin{
        require(!certificates[_id].exist, "details  is already exists");
            certificates[_id] = Certificate(_name,_course,_grade,_date,true);          
    }
}