// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.28;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Game is Ownable {
    string public hint;
    string private _word;
    mapping(address => bool)[] private _playerMaps;
    uint256 _currentMapIndex;
    address public winner;

    /**
     * @dev The word is wrong
     */
    error PlayerHasAlreadyPlayed(address account);

    constructor() Ownable(msg.sender) {
        _playerMaps.push();
    }

    function setHintAndWord(string calldata hint_, string calldata word)
        external
        onlyOwner
    {
        hint = hint_;
        _word = word;
    }

    function gessWord(string calldata word) external {
        if (_playerMaps[_currentMapIndex][_msgSender()])
            revert PlayerHasAlreadyPlayed(_msgSender());
        else {
            _playerMaps[_currentMapIndex][_msgSender()] = true;
            if (keccak256(bytes(word)) == keccak256(bytes(_word)))
                winner = _msgSender();
        }
    }

    function reset() external onlyOwner {
        winner = address(0);
        _playerMaps.push();
        ++_currentMapIndex;
    }
}
