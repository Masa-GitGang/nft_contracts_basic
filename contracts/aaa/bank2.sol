// SPDX-License-Identifier: MIT

pragma solidity 0.7.5;


contract Bank {
    mapping(address => uint)public balance;

    function getContractBalance() external view returns(uint){
        return address(this).balance;
    }

    function getBalance() external view returns(uint){
        return balance[msg.sender];
    }

    function deposit() external payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) external {
        require(balance[msg.sender] >= _amount, "aaa");
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "bbb");
        balance[msg.sender] -= _amount;
    }
}