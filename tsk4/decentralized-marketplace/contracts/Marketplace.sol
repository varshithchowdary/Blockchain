// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Marketplace {
    struct Item {
        uint id;
        string name;
        uint price; // Price in Wei
        address payable seller;
        address buyer;
        bool sold;
    }

    uint public itemCount;
    mapping(uint => Item) public items;

    event ItemListed(uint id, string name, uint price, address seller);
    event ItemBought(uint id, address buyer);

    function listItem(string memory _name, uint _price) public {
        require(_price > 0, "Price must be greater than zero");
        itemCount++;
        items[itemCount] = Item(itemCount, _name, _price, payable(msg.sender), address(0), false);
        emit ItemListed(itemCount, _name, _price, msg.sender);
    }

    function buyItem(uint _id) public payable {
        Item storage item = items[_id];
        require(_id > 0 && _id <= itemCount, "Invalid item ID");
        require(msg.value == item.price, "Incorrect price sent");
        require(item.seller != msg.sender, "Seller cannot buy their own item");
        require(!item.sold, "Item already sold");
        item.seller.transfer(item.price);
        item.buyer = msg.sender;
        item.sold = true;
        emit ItemBought(_id, msg.sender);
    }

    function getItem(uint _id) public view returns (Item memory) {
        require(_id > 0 && _id <= itemCount, "Invalid item ID");
        return items[_id];
    }
}
