// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import { ERC721 } from "@openzeppelin/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    mapping (uint256 => string) private tokenIdToUri;
    uint256 private s_tokenCounter;

    constructor() ERC721("Dogo", "DOG") {
        s_tokenCounter = 0;
    }

    function mintNFT(string memory tokenUri) public {
        tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter += 1;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return tokenIdToUri[tokenId];
    }
}