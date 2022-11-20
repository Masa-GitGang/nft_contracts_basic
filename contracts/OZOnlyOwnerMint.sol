// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";

contract OZOnlyOwnerMint is ERC721 {

    /**
     * @dev
     * = このコントラクトをデプロイしたアドレス用変数owner
     */
    address public owner;

    constructor() ERC721("OZOnlyOwnerMint", "OZNER") {
        owner = _msgSender();
    }

    /**
     * @dev
     * - このコントラクトをデプロイしたアドレスだけに制御するmodifier
     */
    modifier onlyowner {
        require(owner == _msgSender(), "Caller is not the owner.");
        _;
    }

    /**
     * @dev
     * - このコントラクトをデプロイしたアドレスだけがmint可能 onlyowner
     * - nftMint関数の実行アドレスにtokenIdを紐づけ
     */
    function nftMint(uint256 tokenId) public onlyowner{
        _mint(_msgSender(), tokenId);
    }
}