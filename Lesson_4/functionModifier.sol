// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract FunctionModifier {
    address public owner;
    uint public privateKey;
    
    constructor() {
        owner = msg.sender;
    }
    
    // thiết lập Modifier để hạn chế quyền truy cập, chỉ chủ sở hữu mới có thể truy cập
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        _;
    }
    
    
    // thiết lập chủ sở hữu mới có thể thay đổi privateKey
    function setPrivateKey(uint _privateKey) public onlyOwner {
        privateKey = _privateKey;
    }
}