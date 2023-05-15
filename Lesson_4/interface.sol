// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

interface IAnimal {
    function talk() external pure returns (string memory);
}

contract Dog is IAnimal {
    function talk() external pure override returns (string memory) {
        return "Woof woof!";
    }
}

contract Cat is IAnimal {
    function talk() external pure override returns (string memory) {
        return "Meow meow!";
    }
}

contract AnimalLover {
    function makeAnimalTalk(IAnimal _animal) external pure returns (string memory) {
        return _animal.talk();
    }
}
