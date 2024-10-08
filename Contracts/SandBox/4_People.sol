// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract People {
    struct Person {
        string name;
        uint8 age;
    }

    Person public moi;

    constructor() {
        moi.name = "Toni";
        moi.age = 38;
    }

    function setPerson(string calldata name, uint8 age) external {
        moi.name = name;
        moi.age = age;
    }
}
