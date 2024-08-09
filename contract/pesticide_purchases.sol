// SPDX-License-Identifier: MIT
// deployed at 0xf36ed5cf08f95a0f801251aba8aa2f5e2a6b19b1 // sepolia
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

    mapping(string => Purchase) private purchases;
    mapping(string => uint) private balances;

    event PurchaseMade(
        address indexed buyer,
        string indexed userId,
        string pesticideName,
        uint amount
    );
    event RefundIssued(
        address indexed buyer,
        string indexed userId,
        string pesticideName,
        uint amount
    );

    function buyPesticide(
        string memory _userId,
        string memory _pesticideName,
        uint _amount
    ) public payable {
        require(msg.value == _amount, "Incorrect amount sent");
        Purchase storage purchase = purchases[_userId];
        purchase.pesticides.push(Pesticide(_pesticideName, _amount));
        balances[_userId] += _amount;
        emit PurchaseMade(msg.sender, _userId, _pesticideName, _amount);
    }

    function refundPesticide(
        string memory _userId,
        uint _pesticideIndex
    ) public {
        Purchase storage purchase = purchases[_userId];
        Pesticide storage pesticide = purchase.pesticides[_pesticideIndex];
        balances[_userId] -= pesticide.cost;
        payable(msg.sender).transfer(pesticide.cost);
        emit RefundIssued(msg.sender, _userId, pesticide.name, pesticide.cost);
    }

    function getAmountBought(string memory _userId) public view returns (uint) {
        return balances[_userId];
    }

    function getPesticidesBought(
        string memory _userId
    ) public view returns (Pesticide[] memory) {
        Purchase storage purchase = purchases[_userId];
        return purchase.pesticides;
    }

    function clearPesticides(string memory _userId) public {
        payable(purchases[_userId].userAddress).transfer(balances[_userId]);
        delete purchases[_userId];
        delete balances[_userId];
    }
}
