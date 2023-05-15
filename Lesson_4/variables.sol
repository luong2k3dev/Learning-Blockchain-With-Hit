// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Variables {
    // State variable (biến trạng thái) -> Khai báo bên ngoài function và lưu trữ trên blockchain
    uint256 public stateVariable = 123;

    // Global variable (biến toàn cục) -> Cung cấp thông tin về blockchain
    uint256 public globalVariable = block.number;

    // Local variable (biến cục bộ) -> Khai báo bên trong function và không được lưu trữ trên blockchain
    function setLocalVariable(uint256 _number) public pure returns (uint256) {
        uint256 localVariable = _number * 2;
        return localVariable;
    }
}
