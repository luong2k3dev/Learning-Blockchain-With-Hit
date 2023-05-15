// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Example {
    uint public x;

    // nếu ko thỏa mãn điều kiện và xuất thông báo lỗi
    // tất cả các thay đổi trong trạng thái contract sẽ được hoàn tác
    function setValueWithRequire(uint _x) public {
        require(_x > 0, "Value must be greater than 0");
        x = _x;
    }

    // nếu ko thỏa mãn điều kiện và xuất thông báo lỗi
    // tất cả các thay đổi trong trạng thái contract trước đó sẽ vẫn được giữ lại
    function setValueWithRevert(uint _x) public {
        if (_x <= 0) revert("Value must be greater than 0");
        x = _x;
    }
}
