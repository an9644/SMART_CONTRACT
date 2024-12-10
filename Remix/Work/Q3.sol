// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Q3{
    struct Employee{
    string  name;
    string department;
    string designation;
    uint16 salary;
    address payable  paymentad;
    }
    Employee  public employee;
    

    function setEmployee(string memory _name ,
                        string memory _department,
                        string  memory _designation,
                        address payable  _paymentad,
                         uint16 _salary)public {
                            employee.name=_name;
                            employee.department=_department;
                            employee.designation=_designation;
                            employee.salary=_salary;
                            employee.paymentad=_paymentad;
                        }
    function getEmployee()public view returns(string memory,string memory,string memory,uint16){
            return (employee.name,employee.department,employee.designation,employee.salary);
    }
    function ethToWei(uint eval)public pure returns(uint){
        return(eval*1000000000000000000);
    }
    function payemp() public payable {
            uint salary =ethToWei(employee.salary);
                        require(msg.value >= employee.salary, "Insufficient payment amount");
                        require(employee.paymentad != address(0), "Employee wallet not set");
                        employee.paymentad.transfer(salary);
            }
}