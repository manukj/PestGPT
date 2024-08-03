// SPDX-License-Identifier: MIT
// deployed at 0x2a775CF35546Ac2ecad20E395E20Ab76b47d6e5E // sepolia
pragma solidity ^0.8.0;

contract PesticidePurchases {
    struct Pesticide {
        string name;
        uint cost;
    }

    struct Purchase {
        address userAddress;
        Pesticide[] pesticides; // List of pesticides
    }

    mapping(uint => Purchase) private purchases;
    mapping(uint => uint) private balances;

    event PurchaseMade(
        address indexed buyer,
        uint indexed userId,
        string pesticideName,
        uint amount
    );
    event RefundIssued(
        address indexed buyer,
        uint indexed userId,
        string pesticideName,
        uint amount
    );

    function buyPesticide(
        uint _userId,
        string memory _pesticideName,
        uint _amount
    ) public payable {
        require(msg.value == _amount, "Incorrect amount sent");
        Purchase storage purchase = purchases[_userId];
        purchase.pesticides.push(Pesticide(_pesticideName, _amount));
        balances[_userId] += _amount;
        emit PurchaseMade(msg.sender, _userId, _pesticideName, _amount);
    }

    function refundPesticide(uint _userId, uint _pesticideIndex) public {
        Purchase storage purchase = purchases[_userId];
        Pesticide storage pesticide = purchase.pesticides[_pesticideIndex];
        balances[_userId] -= pesticide.cost;
        payable(msg.sender).transfer(pesticide.cost);
        emit RefundIssued(msg.sender, _userId, pesticide.name, pesticide.cost);
    }

    function getAmountBought(uint _userId) public view returns (uint) {
        return balances[_userId];
    }

    function getPesticidesBought(
        uint _userId
    ) public view returns (Pesticide[] memory) {
        Purchase storage purchase = purchases[_userId];
        return purchase.pesticides;
    }

    function clearPesticides(uint _userId) public {
        payable(purchases[_userId].userAddress).transfer(balances[_userId]);
        delete purchases[_userId];
        delete balances[_userId];
    }
}
