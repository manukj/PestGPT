import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/pesticides/widget/cart/wallet_connect_button.dart';
import 'package:pest_gpt/src/pages/pesticides/widget/cart/wallet_connected.dart';
import 'package:pest_gpt/src/resource/image_path.dart';
import 'package:pest_gpt/src/resource/wallet_connect/wallet_connect_controller.dart';

class CartBottomSheet extends GetView<WalletConnectController> {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FutureBuilder(
          future: controller.w3mService,
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting ||
                snap.data == null) {
              return const Center(
                child: CommonLoader(),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: SizedBox(
                child: Obx(() {
                  if (controller.isWalletConnected.value) {
                    return WalletConnected(service: snap.data!);
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        service: snap.data!,
                      ),
                    ],
                  );
                }),
              ),
            );
          }),
    );
  }
}
