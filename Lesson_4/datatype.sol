// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract PrimitiveDataTypes {
    // boolean (true or false) -> default value = false
    bool public myBool = true;

    // uint256 (0 -> 2^256 - 1) -> default value = 0
    uint256 public myUint = 123;

    // int256 (-2^255 -> 2^255 - 1) -> default value = 0
    int256 public myInt = -456;

    // address (20 byte -> 160 bit) -> default value = 0x0000000000000000000000000000000000000000
    address public myAddress = 0x1234567890123456789012345678901234567890;
}
