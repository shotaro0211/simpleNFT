pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

//// This is a tribute to the original Loot.
contract HM is ERC721Enumerable, ReentrancyGuard, Ownable {
    
    struct Person {
        string name;
        string age;
        string position;
        string season;
        string hometown; 
        string animation_url; 
    }
    
    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }
    
    function getHungMan(uint256 tokenId) public view returns (string memory) {
        string[12] memory parts;
        string[12] memory output;
        parts[0] = '';
        parts[1] = '<line x1="0" y1="350" x2="270" y2="350" stroke="black" stroke-width="3" />';
        parts[2] = '<line x1="50" y1="50" x2="50" y2="350" stroke="black" stroke-width="3" />';
        parts[3] = '<line x1="100" y1="50" x2="50" y2="100" stroke="black" stroke-width="3" /><line x1="85" y1="350" x2="50" y2="265" stroke="black" stroke-width="3" /><line x1="15" y1="350" x2="50" y2="265" stroke="black" stroke-width="3" />';
        parts[4] = '<line x1="0" y1="50" x2="270" y2="50" stroke="black" stroke-width="3" />';
        parts[5] = '<line x1="150" y1="50" x2="150" y2="100" stroke="black" stroke-width="3" />';
        parts[6] = '<circle cx="150" cy="125" r="25" stroke="black" stroke-width="3" fill="white" />';
        parts[7] = '<path id="path0" visibility="visible" stroke="#000000" stroke-width="3" stroke-opacity="1" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="none" marker-start="none" marker-end="none" fill="none" fill-rule="evenodd" fill-opacity="1" data-name="curve" data-title="curve" deg="0" data-sw="1" data-grad="0" data-group="0" data-edit="1" filter="none" d="M120 190 C120 168 133.5 150 150 150 C166.5 150 180 168 180 190 C180 212 166.5 230 150 230 C133.5 230 120 212 120 190 Z " data-centerx="150" data-centery="190"/>';
        parts[8] = '<path id="path3" visibility="visible" stroke="#000000" stroke-width="3" stroke-opacity="1" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="none" marker-start="none" marker-end="none" fill="none" fill-rule="evenodd" fill-opacity="1" data-name="curve" data-title="curve" deg="0" data-sw="1" data-grad="0" data-group="0" data-edit="1" filter="none" d="M124 170.111 L114.978 184.079 L106.556 189.667 " data-centerx="115.278" data-centery="179.889"/>';
        parts[9] = '<path id="path4" visibility="visible" stroke="#000000" stroke-width="3" stroke-opacity="1" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="none" marker-start="none" marker-end="none" fill="none" fill-rule="evenodd" fill-opacity="1" data-name="curve" data-title="curve" deg="0" data-sw="1" data-grad="0" data-group="0" data-edit="1" filter="none" d="M176.556 171 L187.389 189.586 L196.555 191.445 " data-centerx="186.556" data-centery="181.222"/>';
        parts[10] = '<path id="path5" visibility="visible" stroke="#000000" stroke-width="3" stroke-opacity="1" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="none" marker-start="none" marker-end="none" fill="none" fill-rule="evenodd" fill-opacity="1" data-name="curve" data-title="curve" deg="0" data-sw="1" data-grad="0" data-group="0" data-edit="1" filter="none" d="M129.778 220.445 L132.555 244.837 L138.111 253.222 " data-centerx="133.945" data-centery="236.833"/>';
        parts[11] = '<path id="path6" visibility="visible" stroke="#000000" stroke-width="3" stroke-opacity="1" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="none" marker-start="none" marker-end="none" fill="none" fill-rule="evenodd" fill-opacity="1" data-name="curve" data-title="curve" deg="0" data-sw="1" data-grad="0" data-group="0" data-edit="1" filter="none" d="M166.112 224.556 L162.111 259.544 L159.111 267.444 " data-centerx="162.615" data-centery="246"/>';

        uint256 rand = random(string(abi.encodePacked("HungMan", toString(tokenId))));
        uint256 _index = rand % 12;

        if (_index >= 0) {
          output[0] = parts[0];
        }
        if (_index >= 1) {
          output[1] = parts[1];
        }
        if (_index >= 2) {
          output[2] = parts[2];
        }
        if (_index >= 3) {
          output[3] = parts[3];
        }
        if (_index >= 4) {
          output[4] = parts[4];
        }
        if (_index >= 5) {
          output[5] = parts[5];
        }
        if (_index >= 6) {
          output[6] = parts[6];
        }
        if (_index >= 7) {
          output[7] = parts[7];
        }
        if (_index >= 8) {
          output[8] = parts[8];
        }
        if (_index >= 9) {
          output[9] = parts[9];
        }
        if (_index >= 10) {
          output[10] = parts[10];
        }
        if (_index >= 11) {
          output[11] = parts[11];
        }

        return string(abi.encodePacked(output[0], output[1], output[2], output[3], output[4], output[5], output[6], output[7], output[8], output[9], output[10], output[11]));
    }
    
    function getRarelity(uint256 tokenId) public view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked("RARELITY", toString(tokenId))));
        uint256 greatness = rand % 21;
        string memory output = "";
        if (greatness >= 0) {
           output = string(abi.encodePacked('<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: black; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="white" /><text x="10" y="20" class="base">'));
        }
        if (greatness > 5) {
           output = string(abi.encodePacked('<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: black; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="#c0c0c0" /><text x="10" y="20" class="base">'));
        }
        if (greatness > 14) {
           output = string(abi.encodePacked('<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: black; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="#e2d06e" /><text x="10" y="20" class="base">'));
        }
        if (greatness > 19) {
           output = string(abi.encodePacked('<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: #e2d06e; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="black" /><text x="10" y="20" class="base">'));
        }
        return output;
    }

    function tokenURI(uint256 tokenId) override public view returns (string memory) {
        string memory body = getHungMan(tokenId);
        
        string[2] memory parts;

        parts[0] = '<svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="500px" height="500px" viewBox="-115 -50 500 500">\
                      <line x1="0" y1="0" x2="0" y2="415" stroke="black" stroke-width="2" />\
                      <line x1="0" y1="0" x2="270" y2="0" stroke="black" stroke-width="2" />\
                      <line x1="270" y1="0" x2="270" y2="415" stroke="black" stroke-width="2" />\
                      <line x1="0" y1="415" x2="270" y2="415" stroke="black" stroke-width="2" />';
        parts[1] = '</svg>';


        string memory output = string(abi.encodePacked(parts[0], body, parts[1]));
        
        string memory json = Base64.encode(bytes(string(abi.encodePacked('{"name": "Hung Man #', toString(tokenId), '", "description": "", "image": "data:image/svg+xml;base64,', Base64.encode(bytes(output)), '"}'))));
        output = string(abi.encodePacked('data:application/json;base64,', json));

        return output;
    }

    function claim() public nonReentrant {
        uint256 tokenId = totalSupply() + 1;
        require(tokenId > 0 && tokenId < 801, "Token ID invalid");
        _safeMint(_msgSender(), tokenId);
    }
    
    function ownerClaim(uint256 tokenId) public nonReentrant onlyOwner {
        require(tokenId > 800 && tokenId < 1001, "Token ID invalid");
        _safeMint(owner(), tokenId);
    }
    
    function toString(uint256 value) internal pure returns (string memory) {
    // Inspired by OraclizeAPI's implementation - MIT license
    // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
    
    constructor() ERC721("Hung Man", "HM") Ownable() {}
}

/// [MIT License]
/// @title Base64
/// @notice Provides a function for encoding some bytes in base64
/// @author Brecht Devos <brecht@loopring.org>
library Base64 {
    bytes internal constant TABLE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

    /// @notice Encodes some bytes to the base64 representation
    function encode(bytes memory data) internal pure returns (string memory) {
        uint256 len = data.length;
        if (len == 0) return "";

        // multiply by 4/3 rounded up
        uint256 encodedLen = 4 * ((len + 2) / 3);

        // Add some extra buffer at the end
        bytes memory result = new bytes(encodedLen + 32);

        bytes memory table = TABLE;

        assembly {
            let tablePtr := add(table, 1)
            let resultPtr := add(result, 32)

            for {
                let i := 0
            } lt(i, len) {

            } {
                i := add(i, 3)
                let input := and(mload(add(data, i)), 0xffffff)

                let out := mload(add(tablePtr, and(shr(18, input), 0x3F)))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(shr(12, input), 0x3F))), 0xFF))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(shr(6, input), 0x3F))), 0xFF))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(input, 0x3F))), 0xFF))
                out := shl(224, out)

                mstore(resultPtr, out)

                resultPtr := add(resultPtr, 4)
            }

            switch mod(len, 3)
            case 1 {
                mstore(sub(resultPtr, 2), shl(240, 0x3d3d))
            }
            case 2 {
                mstore(sub(resultPtr, 1), shl(248, 0x3d))
            }

            mstore(result, encodedLen)
        }

        return string(result);
    }
}
