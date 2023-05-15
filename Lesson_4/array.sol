// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Array {
    uint256[] public myArray = [1, 2, 3, 4, 5];

    function addToArray(uint256 _element) public {
        myArray.push(_element);
    }

    function getArrayElement(uint256 _index) public view returns (uint256) {
        require(_index < myArray.length, "Index out of range");
        return myArray[_index];
    }

    function removeArrayElement(uint256 _index) public {
        require(_index < myArray.length, "Index out of range");
        for (uint256 i = _index; i < myArray.length - 1; i++) {
            myArray[i] = myArray[i + 1];
        }
        myArray.pop();
    }

    function setArrayElement(uint256 _index, uint256 _newValue) public {
        require(_index < myArray.length, "Index out of range");
        myArray[_index] = _newValue;
    }
}
