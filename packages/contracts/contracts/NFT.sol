//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";
contract NFT is ERC721PresetMinterPauserAutoId {
  constructor() ERC721PresetMinterPauserAutoId("Shibusawa", "SBW", "http://localhost:3000/") {}

  function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
     return string(abi.encodePacked(super.tokenURI(tokenId),".json"));
  }
}
