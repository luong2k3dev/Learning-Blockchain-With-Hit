// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract ViewAndPure {
    uint public x = 1;

    // Không có biến trạng thái nào bị thay đổi
    function getX() public view returns (uint) {
        return x;
    }

    // Không có biến trạng thái nào bị thay đổi hoặc đọc
    function multiply(uint i, uint j) public pure returns (uint) {
        return i * j;
    }
}
