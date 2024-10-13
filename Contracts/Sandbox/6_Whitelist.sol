// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Whitelist {
    event Authorized(address);
    mapping(address => bool) public whitelist;


    function check() private view returns (bool){
        return whitelist[msg.sender];
    }

    function authorize(address address_) external {
        require(check(), "Address not found");
        whitelist[address_] = true;
        emit Authorized(address_);
    }
}
