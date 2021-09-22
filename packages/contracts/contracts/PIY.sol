pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

//// This is a tribute to the original Loot.
contract PIY is ERC721Enumerable, ReentrancyGuard, Ownable {
    function tokenURI(uint256 tokenId) override public view returns (string memory) {
        string memory output = '\
        <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="1202.000000pt" height="1474.000000pt" viewBox="0 0 1202.000000 1474.000000" preserveAspectRatio="xMidYMid meet">\
          <g transform="translate(0.000000,1474.000000) scale(0.100000,-0.100000)" fill="#000000" stroke="none">\
            <path d="M3960 11745 c0 -24 -5 -56 -12 -70 -11 -25 -15 -26 -87 -24 -54 2 -76 -1 -79 -11 -3 -7 3 -17 12 -22 23 -13 20 -49 -4 -55 -11 -3 -20 -11 -20\
                    -18 0 -15 -27 -28 -41 -19 -5 3 -9 11 -9 19 0 7 -9 16 -19 20 -10 3 -21 15\
                    -24 26 -5 17 -12 20 -44 17 l-38 -3 -5 -60 c-4 -45 -9 -61 -22 -63 -9 -2 -19\
                    5 -23 17 -5 16 -15 21 -45 21 -42 0 -50 -13 -50 -80 0 -40 7 -54 33 -63 37\
                    -14 19 -29 -48 -39 -17 -3 -21 -13 -25 -60 -6 -65 -4 -78 14 -78 7 0 21 -9 31\
                    -20 11 -13 31 -20 52 -20 26 0 36 -5 40 -20 4 -15 14 -20 38 -20 34 0 61 -22\
                    50 -40 -3 -5 -23 -10 -44 -10 -21 0 -59 -3 -85 -6 -45 -7 -46 -7 -46 -44 0\
                    -29 4 -39 20 -43 15 -4 20 -14 20 -41 0 -30 5 -38 25 -46 14 -5 25 -16 25 -24\
                    0 -7 9 -16 20 -19 11 -3 20 -12 20 -20 0 -8 11 -22 24 -31 16 -10 26 -27 28\
                    -48 3 -36 23 -48 31 -18 4 16 13 20 52 20 42 0 46 -2 43 -22 -2 -19 -10 -24\
                    -41 -26 -29 -3 -40 -9 -47 -26 -5 -13 -16 -26 -24 -29 -29 -11 -16 -27 22 -27\
                    29 0 39 5 47 23 7 15 22 24 50 28 22 3 36 7 31 8 -5 0 -3 8 4 16 9 11 34 15\
                    96 15 69 0 84 3 84 15 0 9 11 21 25 27 14 6 25 18 25 26 0 7 9 16 20 19 16 4\
                    20 14 20 44 0 45 -19 52 -42 17 -14 -20 -18 -21 -42 -10 -15 6 -34 12 -42 12\
                    -8 0 -31 12 -50 28 -30 24 -34 32 -34 74 0 55 -7 78 -25 78 -7 0 -15 9 -18 20\
                    -3 13 -14 20 -30 20 -43 0 -57 10 -57 41 0 19 -8 34 -25 45 -17 11 -25 25 -25\
                    44 0 39 -9 60 -26 60 -22 0 -17 48 5 55 27 8 33 32 14 55 -22 26 -53 26 -60 0\
                    -4 -14 -14 -20 -34 -20 -16 0 -29 5 -29 11 0 6 -11 20 -25 31 -26 20 -32 42\
                    -15 53 5 3 15 -5 22 -19 9 -20 19 -26 44 -26 57 0 64 7 64 64 0 28 5 58 10 66\
                    8 12 10 11 10 -7 0 -13 6 -23 14 -23 20 0 26 -23 26 -96 0 -51 4 -68 20 -84\
                    17 -17 21 -34 21 -92 1 -67 3 -74 32 -102 29 -28 39 -31 115 -34 62 -3 82 -7\
                    82 -18 0 -8 11 -20 25 -26 14 -6 25 -15 25 -20 0 -4 9 -8 21 -8 11 0 29 -5 41\
                    -11 26 -14 31 -7 38 49 l5 47 62 3 c51 2 63 6 68 22 4 11 13 20 21 20 8 0 19\
                    11 24 25 5 14 16 25 25 25 8 0 15 9 15 20 0 29 -36 25 -71 -7 -16 -16 -29 -34\
                    -29 -40 0 -10 -35 -13 -141 -13 -97 0 -138 3 -134 11 9 14 -24 38 -55 39 -30\
                    0 -44 9 -53 33 -4 9 -12 16 -19 15 -8 -2 -13 8 -13 25 0 18 -9 36 -22 47 -20\
                    16 -23 27 -23 95 l0 76 51 -2 c60 -3 87 18 68 53 -6 11 -8 26 -5 34 6 16 42\
                    19 51 4 3 -6 16 -8 28 -5 17 4 33 -6 71 -45 54 -55 66 -58 153 -38 56 13 73\
                    40 33 51 -12 3 -20 14 -20 26 0 14 -6 21 -19 21 -11 0 -23 9 -26 20 -3 11 -13\
                    20 -21 20 -8 0 -14 -9 -14 -20 0 -11 6 -20 14 -20 19 0 27 -25 13 -39 -16 -16\
                    -74 49 -82 93 -4 20 -13 36 -20 36 -16 0 -25 22 -25 61 0 27 -2 29 -40 29\
                    l-40 0 0 -45z"/>\
            <path d="M3010 1663 c-25 -19 -62 -42 -82 -50 -21 -8 -38 -19 -38 -25 0 -10\
                    31 -3 73 19 l27 14 0 -56 c0 -30 5 -55 10 -55 6 0 10 28 10 63 0 59 2 65 30\
                    85 28 21 40 43 23 41 -5 0 -28 -16 -53 -36z"/>\
            <path d="M3900 1663 c-25 -19 -62 -42 -82 -50 -21 -8 -38 -19 -38 -25 0 -10\
                    31 -3 73 19 l27 14 0 -56 c0 -30 5 -55 10 -55 6 0 10 28 10 63 0 59 2 65 30\
                    85 28 21 40 43 23 41 -5 0 -28 -16 -53 -36z"/>\
            <path d="M2095 1644 c-7 -46 -26 -73 -74 -105 -14 -8 -20 -18 -15 -22 14 -8\
                    69 27 88 56 19 29 33 117 18 117 -5 0 -13 -21 -17 -46z"/>\
            <path d="M464 1595 c0 -49 1 -71 3 -48 2 23 2 64 0 90 -2 26 -3 8 -3 -42z"/>\
            <path d="M4650 1672 c0 -5 27 -6 60 -4 l61 4 -3 -73 c-3 -70 -4 -74 -25 -71\
                    -13 2 -23 -2 -23 -7 0 -6 16 -11 35 -11 l34 0 3 78 3 77 58 0 c31 0 57 3 57 7\
                    0 5 -58 8 -130 8 -71 0 -130 -4 -130 -8z"/>\
            <path d="M2580 1660 c0 -5 25 -10 55 -10 59 0 64 -5 45 -55 -5 -14 -23 -34\
                    -40 -43 -16 -9 -30 -23 -30 -29 0 -21 17 -15 55 18 25 22 37 43 41 70 l7 39\
                    53 0 c30 0 54 5 54 10 0 6 -47 10 -120 10 -73 0 -120 -4 -120 -10z"/>\
            <path d="M3470 1660 c0 -5 25 -10 55 -10 53 0 55 -1 55 -27 0 -17 -13 -38 -39\
                    -64 -43 -41 -44 -58 -1 -32 34 19 60 62 60 97 0 25 2 26 55 26 30 0 55 5 55\
                    10 0 6 -47 10 -120 10 -73 0 -120 -4 -120 -10z"/>\
            <path d="M1410 1640 c0 -6 47 -10 120 -10 73 0 120 4 120 10 0 6 -47 10 -120\
                    10 -73 0 -120 -4 -120 -10z"/>\
            <path d="M4703 1623 c-3 -10 -17 -32 -30 -50 -24 -33 -17 -55 9 -25 27 30 49\
                    80 38 87 -6 3 -13 -2 -17 -12z"/>\
            <path d="M4840 1631 c0 -30 56 -105 71 -95 5 2 -8 26 -27 52 -45 59 -44 58\
                    -44 43z"/>\
            <path d="M952 643 c-32 -65 -36 -95 -7 -57 13 17 14 11 15 -63 0 -124 18 -100\
                    23 30 2 61 7 122 11 135 17 47 -11 18 -42 -45z"/>\
            <path d="M1088 678 c-2 -23 -9 -34 -22 -36 -15 -3 -18 0 -12 21 3 14 2 29 -4\
                    32 -5 3 -10 1 -10 -5 0 -5 -10 -31 -21 -55 -24 -51 -20 -71 6 -31 11 16 27 26\
                    41 26 21 0 24 -5 24 -35 0 -35 0 -35 -45 -35 -25 0 -45 -4 -45 -10 0 -5 20\
                    -10 45 -10 l45 0 0 -50 c0 -27 5 -50 10 -50 6 0 10 23 10 50 l0 50 40 0 c22 0\
                    40 5 40 10 0 6 -18 10 -40 10 -39 0 -40 1 -40 34 0 33 2 35 38 39 l37 4 -37 1\
                    c-36 2 -38 4 -38 37 0 44 -18 46 -22 3z"/>\
            <path d="M3819 660 c-12 -27 -27 -55 -35 -61 -8 -6 -11 -15 -8 -21 3 -5 12 -4\
                    20 3 12 10 14 0 14 -65 0 -44 4 -76 10 -76 6 0 10 38 10 95 0 62 5 108 15 132\
                    18 42 18 43 5 43 -5 0 -19 -22 -31 -50z"/>\
            <path d="M3940 674 c0 -28 -3 -35 -17 -32 -12 2 -17 11 -15 26 2 12 -2 22 -7\
                    22 -6 0 -11 -6 -11 -13 0 -7 -9 -29 -20 -49 -12 -22 -16 -40 -10 -43 6 -3 15\
                    5 22 19 7 17 19 26 35 26 20 0 23 -5 23 -35 0 -35 0 -35 -45 -35 -25 0 -45 -4\
                    -45 -10 0 -5 20 -10 45 -10 l45 0 0 -50 c0 -27 5 -50 10 -50 6 0 10 23 10 50\
                    l0 50 45 0 c25 0 45 5 45 10 0 6 -21 10 -46 10 -45 0 -45 0 -42 33 3 29 7 33\
                    43 38 l40 5 -40 5 c-37 4 -40 7 -43 37 -4 44 -22 41 -22 -4z"/>\
            <path d="M7076 666 c-9 -25 -24 -50 -32 -56 -7 -7 -14 -19 -14 -28 0 -12 4\
                    -12 21 4 l21 19 -4 -83 c-2 -50 1 -82 7 -82 6 0 9 35 7 91 -3 66 1 102 12 130\
                    18 46 19 49 7 49 -4 0 -16 -20 -25 -44z"/>\
            <path d="M7198 678 c-2 -23 -9 -34 -22 -36 -15 -3 -18 1 -14 22 9 46 -6 36\
                    -33 -20 -27 -57 -23 -82 6 -38 24 37 59 30 63 -13 3 -33 3 -33 -42 -33 -25 0\
                    -46 -4 -46 -10 0 -5 21 -10 46 -10 l46 0 -4 -50 c-2 -32 1 -50 8 -50 7 0 9 17\
                    6 50 l-5 50 47 0 c58 0 61 18 4 22 -40 3 -43 5 -43 33 0 27 3 30 40 36 l40 5\
                    -40 5 c-38 4 -40 6 -39 37 2 42 -14 42 -18 0z"/>\
            <path d="M2324 679 c-29 -33 -102 -80 -153 -100 -32 -12 -41 -19 -30 -24 8 -3\
                    37 3 63 15 26 11 50 20 52 20 2 0 4 -31 4 -70 0 -40 4 -70 10 -70 6 0 10 33\
                    10 80 l0 79 42 39 c23 22 37 42 31 45 -6 4 -19 -3 -29 -14z"/>\
            <path d="M7961 613 c0 -68 17 -122 42 -137 15 -9 22 -7 38 13 20 24 26 61 10\
                    61 -5 0 -12 -11 -15 -25 -17 -66 -56 -2 -56 91 0 30 -4 54 -10 54 -6 0 -10\
                    -25 -9 -57z"/>\
            <path d="M7817 654 c-3 -4 4 -25 17 -48 13 -22 27 -56 31 -74 5 -23 10 -31 17\
                    -24 7 7 5 26 -6 59 -18 53 -48 98 -59 87z"/>\
            <path d="M8117 654 c-3 -4 4 -25 17 -48 13 -22 27 -56 31 -74 5 -23 10 -31 17\
                    -24 7 7 5 26 -6 59 -18 53 -48 98 -59 87z"/>\
            <path d="M2410 580 c0 -6 48 -10 125 -10 77 0 125 4 125 10 0 6 -48 10 -125\
                    10 -77 0 -125 -4 -125 -10z"/>\
            <path d="M5570 580 c0 -6 47 -10 120 -10 73 0 120 4 120 10 0 6 -47 10 -120\
                    10 -73 0 -120 -4 -120 -10z"/>\
          </g>\
        </svg>';

        string memory json = Base64.encode(bytes(string(abi.encodePacked('{"name": "OrenoTeamLoot #', toString(tokenId), '", "description": "OrenoTeamLoot is randomized player  generated and stored on chain. Stats, images, and other functionality are intentionally omitted for others to interpret.", "image": "data:image/svg+xml;base64,', Base64.encode(bytes(output)), '"}'))));
        output = string(abi.encodePacked('data:application/json;base64,', json));

        return output;
    }

    function claim(uint256 tokenId) public nonReentrant {
        tokenId = totalSupply();
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
    
    constructor() ERC721("Onchain PIYO", "PIY") Ownable() {}
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
