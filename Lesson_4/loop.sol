// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Loop {
    function sumCaculate(uint256 n) public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < n; i++) {
            sum += i;
        }
        return sum;
    }

    function sumCaculate2(uint256 n) public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 0;
        while (i < n) {
            sum += i;
            i++;
        }
        return sum;
    }
}
