// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Marketplace is ReentrancyGuard, Ownable {
    struct Listing {
        uint256 id;
        address payable seller;
        uint256 price;
        string metadata;
        bool isSold;
    }

    uint256 public listingCount;
    mapping(uint256 => Listing) public listings;

    event ItemListed(uint256 indexed id, address indexed seller, uint256 price, string metadata);
    event ItemSold(uint256 indexed id, address indexed buyer, uint256 price);

    constructor() Ownable(msg.sender) {}

    function listItem(uint256 _price, string calldata _metadata) external {
        require(_price > 0, "Price must be greater than zero");

        listingCount++;
        listings[listingCount] = Listing({
            id: listingCount,
            seller: payable(msg.sender),
            price: _price,
            metadata: _metadata,
            isSold: false
        });

        emit ItemListed(listingCount, msg.sender, _price, _metadata);
    }

    function buyItem(uint256 _id) external payable nonReentrant {
        Listing storage item = listings[_id];
        require(_id > 0 && _id <= listingCount, "Item does not exist");
        require(msg.value >= item.price, "Insufficient payment");
        require(!item.isSold, "Item already sold");

        item.isSold = true;
        item.seller.transfer(msg.value);

        emit ItemSold(_id, msg.sender, item.price);
    }

    function getListing(uint256 _id) external view returns (Listing memory) {
        return listings[_id];
    }
}
