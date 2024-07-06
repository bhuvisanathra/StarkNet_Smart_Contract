// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19 <=0.9.0;

contract LaxmiChitFund {
    
    // Mapping to store balances of each address
    mapping (address => uint) private balances;

    // Event for deposit logging
    event Deposit(address indexed _from, uint _value);
    
    // Event for withdrawal logging
    event Withdrawal(address indexed _to, uint _value);
    
    // Function to deposit Ether into the contract
    function deposit() public payable {
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    // Function to withdraw Ether from the contract
    function withdraw(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        emit Withdrawal(msg.sender, _amount);
    }

    // Function to check the balance of the caller
    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    // Function to check the balance of any address (only owner can call this)
    function getBalanceOf(address _account) public view returns (uint) {
        return balances[_account];
    }
}
