// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract DataLoctions {
    struct Person {
        string name;
        uint age;
    }

    Person[] public people;

    function addPersonToMemory(string memory _name, uint _age) public {
        Person memory newPerson = Person({name: _name, age: _age});
        people.push(newPerson);
    }

    function addPersonToStorage(string calldata _name, uint _age) public {
        Person storage newPerson = people.push();
        newPerson.name = _name;
        newPerson.age = _age;
    }

    function getPerson(uint _index) public view returns (string memory, uint) {
        require(_index < people.length, "Index out of range");
        Person storage person = people[_index];
        return (person.name, person.age);
    }
}
