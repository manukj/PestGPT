// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// contarct deployed in
// Sepolio : 0xc4B6Db3C4Dbd23493fdBA30F3eb864dA968dfFe0
contract PesticidePurchases {
    struct Purchase {
        uint userId;
        mapping(string => uint) pesticides; // pesticide name to amount of ETH
    }

    mapping(address => Purchase) public purchases;
    mapping(address => uint) public balances;

    event PurchaseMade(
        address indexed buyer,
        uint id,
        string pesticideName,
        uint amount
    );
    event RefundIssued(
        address indexed buyer,
        uint id,
        string pesticideName,
        uint amount
    );

    function pay(uint _id, string memory _pesticideName) public payable {
        require(msg.value > 0, "Payment must be greater than 0");

        Purchase storage purchase = purchases[msg.sender];
        purchase.userId = _id;
        purchase.pesticides[_pesticideName] += msg.value;

        balances[msg.sender] += msg.value;

        emit PurchaseMade(msg.sender, _id, _pesticideName, msg.value);
    }

    function refund(
        uint _id,
        string memory _pesticideName,
        uint _amount
    ) public {
        Purchase storage purchase = purchases[msg.sender];
        require(purchase.userId == _id, "Invalid purchase ID");
        require(
            purchase.pesticides[_pesticideName] >= _amount,
            "Insufficient purchase amount for refund"
        );

        purchase.pesticides[_pesticideName] -= _amount;
        balances[msg.sender] -= _amount;

        payable(msg.sender).transfer(_amount);

        emit RefundIssued(msg.sender, _id, _pesticideName, _amount);
    }
}
