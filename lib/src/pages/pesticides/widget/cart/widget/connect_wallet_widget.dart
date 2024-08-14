import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/pesticides/widget/cart/widget/wallet_connect_button.dart';
import 'package:pest_gpt/src/resource/image_path.dart';
import 'package:pest_gpt/src/resource/wallet_connect/wallet_connect_controller.dart';

class ConnectWalletWidget extends GetView<WalletConnectController> {
  final String? title;
  const ConnectWalletWidget({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.w3mService,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting ||
              snap.data == null) {
            return const Center(
              child: CommonLoader(),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title ?? StringConstant.connectWalletTitle.tr,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Lottie.asset(
                  IMAGEPATH.walletConnect,
                  height: 200,
                  width: 200,
                ),
                ConnectWalletButton(
                  service: snap.data!,
                ),
              ],
            ),
          );
        });
  }
}
