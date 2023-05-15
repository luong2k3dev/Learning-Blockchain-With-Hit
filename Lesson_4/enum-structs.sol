// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Transport {
    // enum các giá trị phương tiện giao thông
    enum VehicleType {
        Car,
        Motorbike,
        Bicycle
    }
    // struct định nghĩa các thuộc tính của một phương tiện
    struct Vehicle {
        VehicleType vehicleType;
        string brand;
        uint256 price;
    }

    // khai báo mảng chứa các phương tiện
    Vehicle[] public vehicles;

    // thêm phương tiện vào mảng
    function addVehicle(VehicleType _type, string memory _brand, uint256 _price) public {
        Vehicle memory newVehicle = Vehicle(_type, _brand, _price);
        vehicles.push(newVehicle);
    }

    // lấy phương tiện thông qua chỉ số
    function getVehicle(uint256 _index) public view returns (Vehicle memory) {
        require(_index < vehicles.length, "Index out of range");
        return vehicles[_index];
    }
    
    // xóa phương tiện thông qua chỉ số
    function removeVehicle(uint256 _index) public {
        require(_index < vehicles.length, "Index out of range");
        for (uint256 i = _index; i < vehicles.length - 1; i++) {
            vehicles[i] = vehicles[i + 1];
        }
        vehicles.pop();
    }
}
