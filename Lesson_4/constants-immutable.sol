// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Constants {
    // Gán giá trị cố định ngay khi khởi tạo
    int public constant MAX_VALUE = type(int256).max;
    int public constant MIN_VALUE = type(int256).min;

    // Giá trị cố định được thiết lập trong constructor
    address public immutable MY_IMMUTABLE_ADDRESS;

    constructor(address _address) {
        MY_IMMUTABLE_ADDRESS = _address;
    }
}
