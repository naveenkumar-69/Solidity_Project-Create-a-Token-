// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {
    string public name;
    string public symbol;
    uint256 public totalSupply;
    mapping(address => uint256) public balances;

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        balances[msg.sender] = _totalSupply;
    }

    function mint(address recipient, uint256 value) public {
        totalSupply += value;
        balances[recipient] += value;
    }

    function burn(address owner, uint256 value) public {
        require(balances[owner] >= value, "Insufficient balance");
        totalSupply -= value;
        balances[owner] -= value;
    }
}
