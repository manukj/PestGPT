import 'dart:convert';

import 'package:web3modal_flutter/web3modal_flutter.dart';

final contractAddress =
    EthereumAddress.fromHex("0xf36ed5cf08f95a0f801251aba8aa2f5e2a6b19b1");

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
            "internalType": "string",
            "name": "userId",
            "type": "string"
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
            "internalType": "string",
            "name": "userId",
            "type": "string"
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
          {"internalType": "string", "name": "_userId", "type": "string"},
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
          {"internalType": "string", "name": "_userId", "type": "string"}
        ],
        "name": "clearPesticides",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {"internalType": "string", "name": "_userId", "type": "string"}
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
          {"internalType": "string", "name": "_userId", "type": "string"}
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
          {"internalType": "string", "name": "_userId", "type": "string"},
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
