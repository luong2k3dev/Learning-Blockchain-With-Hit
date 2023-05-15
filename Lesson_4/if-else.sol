// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract IfElse {
    int public number;

    function setNumber(int _number) public {
        number = _number;
    }

    function checkNumber() public view returns (string memory) {
        if (number < 0) {
            return "negative number";
        } else if (number > 0) {
            return "positive number";
        } else {
            return "number 0";
        }
    }
}
