// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract SimpleBank {
    mapping( address => uint ) private account_book;


    function withdraw(uint amount) external payable {
        require( account_book[msg.sender] >= amount, "Insufficient balance" );
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        require( sent, "fail send" );
        account_book[msg.sender] -= amount;
    }

    function deposit() external payable {
        account_book[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint) {
        return account_book[msg.sender];
    }
}