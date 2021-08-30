//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";
contract NFT is ERC721PresetMinterPauserAutoId {
  constructor() ERC721PresetMinterPauserAutoId("Clione", "CLN", "https://8mart-staging.s3.ap-northeast-1.amazonaws.com/nft/clione/") {}

  function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
     return string(abi.encodePacked(super.tokenURI(tokenId),".json"));
  }
}
