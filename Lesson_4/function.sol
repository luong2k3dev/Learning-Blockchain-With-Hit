// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Function {
    // function có thể trả về nhiều value
    function getUser() public pure returns (uint256, address) {
        uint256 userId = 123;
        address userAddress = 0x1234567890123456789012345678901234567890;
        return (userId, userAddress);
    }

    // value trả về có thể đặt tên
    function getPeople() public pure returns (string memory name, uint age) {
        name = "Luong";
        age = 20;
    }

    // có thể sử dụng Destructuring assignment để lấy giá trị riêng lẻ
    function getNumbers() public pure returns (uint x, uint y, uint z) {
        (x, , z) = (1, 2, 3);
        y = x + z;
    }

    // không thể sử dụng mapping cho đầu vào hoặc đầu ra
    // có thể sử dụng array cho cả đầu vào và đầu ra
    function processArray(uint[] memory inputArray) public pure returns (uint[] memory) {
        uint[] memory outputArray = new uint[](inputArray.length);
        for (uint i = 0; i < inputArray.length; i++) {
            outputArray[i] = inputArray[i] * 10;
        }
        return outputArray;
    }

    // có thể gọi hàm với đầu vào key-value
    function User(string memory name, uint age) public pure returns (string memory, uint) {}

    function callUser() public pure returns (string memory, uint) {
        return User("Luong", 20);
    }

    function callUserWithKeyValue() public pure returns (string memory, uint) {
        return User({name: "Luong", age: 20});
    }
}
