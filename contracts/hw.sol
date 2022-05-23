// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Homework {
	// 宣告一個變數’x’型態為uint
    uint x;
    address owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "This function can only be called by owner.");
        _;
    }

    function setX(uint _x) public {
        x = _x;
    }

    function getX() public view returns (uint) {
        return x;
    }

    function getOwner() public view returns(address){
        return owner;
    }

    function setOwner(address newOwner) onlyOwner external{
        owner = newOwner;
    }
}
