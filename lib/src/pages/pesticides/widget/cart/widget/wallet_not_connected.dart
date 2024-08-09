import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/pesticides/widget/cart/widget/wallet_connect_button.dart';
import 'package:pest_gpt/src/resource/image_path.dart';
import 'package:web3modal_flutter/services/w3m_service/w3m_service.dart';

class WalletNotConnected extends StatelessWidget {
  final W3MService service;
  const WalletNotConnected({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringConstant.connectWalletTitle.tr,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Lottie.asset(
            IMAGEPATH.walletConnect,
            height: 200,
            width: 200,
          ),
          ConnectWalletButton(
            service: service,
          ),
        ],
      ),
    );
    ;
  }
}
