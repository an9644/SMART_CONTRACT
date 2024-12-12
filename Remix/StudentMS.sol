// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract StudentMS{

    struct Student{
      string name;
       uint8 CGPA;
      uint16 rollno;
      uint8 sem;
      Dep dept;
      bool exist;
    }
    enum Dep { CS, EC, ME }
        address public staffadvisor;


    mapping(uint16 => Student) private Details;
     
    constructor() {
        staffadvisor = msg.sender;
    }

    modifier admin(){
        require(msg.sender == staffadvisor,"Unauthorized");
        _;
    }
    modifier studVerify(uint16 rollno){
        require(Details[rollno].exist,"rollno does not exist");
        _;
    }

    function addStudent(string memory _name,uint8 _CGPA,uint16 _rollno,uint8 _sem,Dep _dept) public  admin {
            
            require(!Details[_rollno].exist, "rollno is already exists");
            Details[_rollno] = Student(_name,_CGPA,_rollno,_sem,_dept,true);
    }

     function getStudent(uint16 _rollno) public view admin returns (string memory name, uint8 sem, Dep dept, uint8 CGPA, uint16 rollno) {
        
        Student memory student = Details[_rollno];
        return (student.name, student.sem, student.dept, student.CGPA, student.rollno);
    }

    function editData(uint8 _sem,Dep _dept,uint8 _CGPA,uint16 _rollno) public admin studVerify(_rollno){

                Student storage student = Details[_rollno];
                student.sem= _sem;
                student.dept = _dept;
                student.CGPA = _CGPA; 
    }

    function editName(string memory _name,uint16 _rollno) public studVerify(_rollno){

                Student storage student = Details[_rollno];
                student.name= _name;
               
    }




}