// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Mapping {
    // Khai báo một mapping với kiểu của key là address và kiểu của value là uint256
    mapping(address => uint256) public myMap;

    // gán giá trị _value cho myMap tại key _key.
    function set(address _key, uint256 _value) public {
        myMap[_key] = _value;
    }

    // lấy giá trị từ myMap tại key _key và trả về giá trị đó.
    function get(address _key) public view returns (uint256) {
        return myMap[_key];
    }

    // xóa cặp key-value tại key _key khỏi myMap
    function remove(address _key) public {
        delete myMap[_key];
    }
}

contract NestedMapping {
    // struct User lưu trữ thông tin người dùng gồm tên, địa chỉ, và số tiền hiện tại nắm giữ
    struct User {
        string name;
        address addr;
        uint256 amount;
    }

    // mapping lưu trữ thông tin người dùng theo địa chỉ
    mapping(address => User) public users;
    
    // mapping lưu trữ danh sách người dùng theo khu vực
    mapping(string => mapping(address => User)) public usersByRegion;

    // thêm một người dùng vào khu vực
    function addUser(string memory _region, address _addr, string memory _name, uint256 _amount) public {
        User memory newUser = User(_name, _addr, _amount);
        users[_addr] = newUser;
        usersByRegion[_region][_addr] = newUser;
    }

    // truy xuất thông tin người dùng theo địa chỉ
    function getUser(address _addr) public view returns (string memory, address, uint256) {
        User memory user = users[_addr];
        return (user.name, user.addr, user.amount);
    }

    // truy xuất người dùng theo khu vực và địa chỉ  
    function getUser2(string memory _region, address _addr) public view returns (string memory, address, uint256) {
        User memory user = usersByRegion[_region][_addr];
        return (user.name, user.addr, user.amount);
    }
}
