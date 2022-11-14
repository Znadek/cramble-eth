// SPDX-License-Identifier: MIT
// https://www.youtube.com/watch?v=8WPzUbJyoNg
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract Cramble is ERC721, Ownable {
    uint256 public mintPrice = 0.01 ether;
    uint256 public totalSupply;
    uint256 public maxSupply;
    mapping(string => uint256) public mintedWords;

    constructor() payable ERC721('Cramble Generate Words!', 'CRAMBLE'){
        maxSupply = 1000;
        totalSupply = 1;
    }

    function mint(string memory word_) external payable {
        require(maxSupply > totalSupply, 'sold out');
        require(msg.value == mintPrice, 'wrong value');
        require(mintedWords[word_] == 0, 'word alreay minted');
        
        mintedWords[word_] = totalSupply;
        _safeMint(msg.sender, totalSupply);
        totalSupply++;
    }
}