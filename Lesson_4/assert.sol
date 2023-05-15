// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Assert {
    bool public isTrue = false;
    uint x = 1;

    function Div_X_By_Y(uint y) public {
        // Hàm bị gián đoạn và các thay đổi sẽ được hoàn tác nếu hàm assert được gọi hay y = 0
        assert(y == 0);
        x /= y;
    }
}
