// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract GasTransaction {
    // Số ether cần trả phụ thuộc vào số gas đã sử dụng trong giao dịch và giá gas đã chọn.
    uint public gasSpent;
    uint public gasPrice;

    constructor(uint _gasSpent, uint _gasPrice) {
        gasSpent = _gasSpent;
        gasPrice = _gasPrice;
    }

    function calculateEther() public view returns (uint) {
        return gasSpent * gasPrice;
    }
}
