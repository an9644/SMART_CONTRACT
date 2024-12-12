// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Bank{
    mapping(address=>uint) balanceLedger;
    address public admin;

    constructor(){
        admin=msg.sender;
    }

    modifier  balanceCheck(uint amt){
        require(balanceLedger[msg.sender]>=amt,"Insufficent Balance");
        _;
    }

    function deposit()public payable {
        balanceLedger[msg.sender]=balanceLedger[msg.sender] +msg.value;
    }
    function getBalance()public view returns(uint) {
         return balanceLedger[msg.sender];
    }
    function withdraw(uint amt)public balanceCheck(amt){
      require ( balanceLedger[msg.sender]>=amt,"insufficient amount ");

        balanceLedger[msg.sender]=balanceLedger[msg.sender] - amt;
        payable (msg.sender).transfer(amt);
    }
    function moneytransfer(uint amt,address reciver )public balanceCheck(amt)  {
        // require(balanceLedger[msg.sender]>=amt, "insufficient amount");
        balanceLedger[msg.sender]=balanceLedger[msg.sender] - amt;
        
        payable (reciver).transfer(amt);
    }
}