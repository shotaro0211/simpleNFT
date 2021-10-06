//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";
contract INC is ERC721PresetMinterPauserAutoId {
  constructor() ERC721PresetMinterPauserAutoId("Shotaro", "SS", "https://dentou-s3.s3.ap-northeast-1.amazonaws.com/NFT/test/") {}
  function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
     return string(abi.encodePacked(super.tokenURI(tokenId),".json"));
  }
}
