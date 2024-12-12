// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Certi{
    struct Certificate{
        string name;
        string course;
        string grade;
        string date;
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

    function issue(uint256 _id,string memory _name,string memory _coures,string memory _grade,string memory _date)public onlyAdmin{
            // id=_id;
            // name=_name;
            // coures=_coures;
            // certificate.grade=_grade;
            // date=_date;
            certificates[_id]=Certificate(_name,_coures,_grade,_date);
    }
}