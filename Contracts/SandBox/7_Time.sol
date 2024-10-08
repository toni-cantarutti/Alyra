// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.28;

contract Exo {
    address public myAddress;

    function setAddress(address address_) external {
        myAddress = address_;
    }

    function getBalance() external view returns (uint256) {
        return myAddress.balance;
    }

    function getBalance(address adress_) external view returns (uint256) {
        return adress_.balance;
    }

    //Transfert
    function sendViaTransfer(address payable receiver) external payable {
        receiver.transfer(msg.value);
    }

    //send
    function sendViaSend(address payable receiver) external payable {
        bool sent = receiver.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    //call
    function sendViaCall(address payable receiver) external payable {
        (bool sent, ) = receiver.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    function sendIfEnoughEthers(uint256 amount) external payable {
        require(
            myAddress.balance > amount*1 ether,
            "Amount of address too low to send Ether"
        );

        (bool sent, ) = myAddress.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

}
