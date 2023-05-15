// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract Y {
    uint age;

    constructor(uint _age) {
        age = _age;
    }
}

// Kế thừa contract X, Y và khởi tạo các tham số trong phần khai báo contract
contract B is X("Luong"), Y(20) {

}

// Kế thừa contract X, Y và các tham số của chúng được khởi tạo trong hàm tạo của contract
contract C is X, Y {
    constructor(string memory _name, uint _age) X(_name) Y(age) {}
}

// Thứ tự khởi tạo : X Y D
contract D is X, Y {
    constructor() X("Luong") Y(20) {}
}

// Thứ tự khởi tạo : Y X E
contract E is X, Y {
    constructor() Y(20) X("Luong") {}
}
