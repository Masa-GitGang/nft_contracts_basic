pragma solidity 0.8.4;

contract Bank {
    mapping(address => uint)public balance;

    function getBalance() external view returns(uint){
        return balance[msg.sender];
    }

    function deposit() external payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) external {
        require(balance[msg.sender] >= _amount, "aaa");
        balance[msg.sender] -= _amount;
        (bool success, ) = payable(msg.sender).call{value: _amount}("");
        require(success, "bbb");
    }

    function transfer(address _to, uint _amount) public {
        require(balance[msg.sender] >= _amount, "ccc");
        require(msg.sender != _to, "ddd");
        balance[msg.sender] -= _amount;
        balance[_to] += _amount;
    }
}