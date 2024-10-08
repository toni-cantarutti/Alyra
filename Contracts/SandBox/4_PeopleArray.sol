// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract PeopleArray {
    struct Person {
        string name;
        uint8 age;
    }

    Person[] public personArr;

    function addPerson(string calldata name, uint8 age) external {
        personArr.push(Person(name, age));
    }

    function removeLastEntry() external {
        personArr.pop();
    }
}