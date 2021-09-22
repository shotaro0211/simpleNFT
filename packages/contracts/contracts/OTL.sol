pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

//// This is a tribute to the original Loot.
contract OTL is ERC721Enumerable, ReentrancyGuard, Ownable {
    
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
    
    function getPerson(uint256 tokenId, uint totalCount) public view returns (Person memory) {
        uint256 rand = random(string(abi.encodePacked("PERSON", toString(tokenId))));
        uint _index = rand % totalCount;
        Person memory output;
        if (_index == 0) {
            Person memory iniesta = Person("Andres Iniesta", "37", "CMF", "2020-2021", "Kuching", "https://dentou-s3.s3.ap-northeast-1.amazonaws.com/NFT/OTL/iniesta.html");
            output = iniesta;
        }
        // if (_index == 0) {
        //    Person memory suzuki = Person("Suzuki Yuta", "31", "CMF", "2020-2021", "Kuching", "https://dentou-s3.s3.ap-northeast-1.amazonaws.com/NFT/OTL/suzuki.html");
        //    output = suzuki;
        //}
        //if (_index == 1) {
        //    Person memory naruse = Person("Naruse Yuta", "25", "LWG", "2020-2021", "Phnom Penh", "https://dentou-s3.s3.ap-northeast-1.amazonaws.com/NFT/OTL/naruse.html");
        //    output = naruse;
        //}
        
        return output;
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
        Person memory person = getPerson(tokenId, 1);
        
        string[17] memory parts;

        parts[0] = getRarelity(tokenId);

        parts[1] = person.name;

        parts[2] = '</text><text x="10" y="40" class="base">';

        parts[3] = person.age;

        parts[4] = '</text><text x="10" y="60" class="base">';

        parts[5] = person.position;

        parts[6] = '</text><text x="10" y="80" class="base">';
        
        parts[7] = person.season;
        
        parts[8] = '</text><text x="10" y="100" class="base">';
        
        parts[9] = person.hometown;

        parts[10] = '</text></svg>';

        string memory output = string(abi.encodePacked(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5], parts[6], parts[7], parts[8]));
        output = string(abi.encodePacked(output, parts[9], parts[10], parts[11], parts[12], parts[13], parts[14], parts[15], parts[16]));
        
        string memory json = Base64.encode(bytes(string(abi.encodePacked('{"name": "OrenoTeamLoot #', toString(tokenId), '", "description": "OrenoTeamLoot is randomized player  generated and stored on chain. Stats, images, and other functionality are intentionally omitted for others to interpret.", "image": "data:image/svg+xml;base64,', Base64.encode(bytes(output)), '", "animation_url": "', person.animation_url, '"}'))));
        output = string(abi.encodePacked('data:application/json;base64,', json));

        return output;
    }

    function claim(uint256 tokenId) public nonReentrant {
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
    
    constructor() ERC721("OrenoTeamLoot", "OTL") Ownable() {}
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
