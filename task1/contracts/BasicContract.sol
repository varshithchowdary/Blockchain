// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasicContract {
    string public message;

    // Constructor to initialize the message
    constructor(string memory _message) {
        message = _message;
    }

    // Function to get the message
    function getMessage() public view returns (string memory) {
        return message;
    }

    // Function to set a new message
    function setMessage(string memory _newMessage) public {
        message = _newMessage;
    }
}
