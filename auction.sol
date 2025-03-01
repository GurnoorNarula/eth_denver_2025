// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SponsoredSearchAuction {
    struct Bid {
        address bidder;
        uint256 amount;
    }

    mapping(string => Bid) public highestBids;
    mapping(address => uint256) public pendingReturns;

    event NewHighestBid(string keyword, address bidder, uint256 amount);

    function placeBid(string memory keyword) public payable {
        require(msg.value > highestBids[keyword].amount, "Bid not high enough");

        if (highestBids[keyword].amount != 0) {
            pendingReturns[highestBids[keyword].bidder] += highestBids[keyword].amount;
        }

        highestBids[keyword] = Bid(msg.sender, msg.value);
        emit NewHighestBid(keyword, msg.sender, msg.value);
    }

    function withdraw() public {
        uint256 amount = pendingReturns[msg.sender];
        if (amount > 0) {
            pendingReturns[msg.sender] = 0;
            payable(msg.sender).transfer(amount);
        }
    }

    function getHighestBid(string memory keyword) public view returns (address, uint256) {
        return (highestBids[keyword].bidder, highestBids[keyword].amount);
    }
}