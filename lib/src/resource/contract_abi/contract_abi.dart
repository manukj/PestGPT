import 'dart:convert';

import 'package:web3modal_flutter/web3modal_flutter.dart';

final contractAddress =
    EthereumAddress.fromHex("0x2a775CF35546Ac2ecad20E395E20Ab76b47d6e5E");

final deployedContract = DeployedContract(
  ContractAbi.fromJson(
    jsonEncode([
      {
        "anonymous": false,
        "inputs": [
          {
            "indexed": true,
            "internalType": "address",
            "name": "buyer",
            "type": "address"
          },
          {
            "indexed": true,
            "internalType": "uint256",
            "name": "userId",
            "type": "uint256"
          },
          {
            "indexed": false,
            "internalType": "string",
            "name": "pesticideName",
            "type": "string"
          },
          {
            "indexed": false,
            "internalType": "uint256",
            "name": "amount",
            "type": "uint256"
          }
        ],
        "name": "PurchaseMade",
        "type": "event"
      },
      {
        "anonymous": false,
        "inputs": [
          {
            "indexed": true,
            "internalType": "address",
            "name": "buyer",
            "type": "address"
          },
          {
            "indexed": true,
            "internalType": "uint256",
            "name": "userId",
            "type": "uint256"
          },
          {
            "indexed": false,
            "internalType": "string",
            "name": "pesticideName",
            "type": "string"
          },
          {
            "indexed": false,
            "internalType": "uint256",
            "name": "amount",
            "type": "uint256"
          }
        ],
        "name": "RefundIssued",
        "type": "event"
      },
      {
        "inputs": [
          {"internalType": "uint256", "name": "_userId", "type": "uint256"},
          {
            "internalType": "string",
            "name": "_pesticideName",
            "type": "string"
          },
          {"internalType": "uint256", "name": "_amount", "type": "uint256"}
        ],
        "name": "buyPesticide",
        "outputs": [],
        "stateMutability": "payable",
        "type": "function"
      },
      {
        "inputs": [
          {"internalType": "uint256", "name": "_userId", "type": "uint256"}
        ],
        "name": "clearPesticides",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {"internalType": "uint256", "name": "_userId", "type": "uint256"}
        ],
        "name": "getAmountBought",
        "outputs": [
          {"internalType": "uint256", "name": "", "type": "uint256"}
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [
          {"internalType": "uint256", "name": "_userId", "type": "uint256"}
        ],
        "name": "getPesticidesBought",
        "outputs": [
          {
            "components": [
              {"internalType": "string", "name": "name", "type": "string"},
              {"internalType": "uint256", "name": "cost", "type": "uint256"}
            ],
            "internalType": "struct PesticidePurchases.Pesticide[]",
            "name": "",
            "type": "tuple[]"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [
          {"internalType": "uint256", "name": "_userId", "type": "uint256"},
          {
            "internalType": "uint256",
            "name": "_pesticideIndex",
            "type": "uint256"
          }
        ],
        "name": "refundPesticide",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      }
    ]),
    "PesticidePurchases",
  ),
  contractAddress,
);
