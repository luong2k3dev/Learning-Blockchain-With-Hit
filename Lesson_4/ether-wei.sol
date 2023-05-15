// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract EtherAndWei {
    // 1 ether = 10^18 wei -> Các giao dịch được thanh toán bằng ether
    uint public oneEther = 1 ether;
    uint public oneWei = 1 wei;

    function convertEtherToWei(uint _ether) public pure returns (uint) {
        return _ether * 1 ether;
    }

    function convertWeiToEther(uint _wei) public pure returns (uint) {
        return _wei / 1 ether;
    }
}
