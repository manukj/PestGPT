import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/resource/image_path.dart';
import 'package:pest_gpt/src/resource/wallet_connect/wallet_connect_controller.dart';
import 'package:pest_gpt/src/utils/toast/toast_manager.dart';

class CartBottomSheet extends GetView<WalletConnectController> {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: FutureBuilder(
          future: controller.w3mService,
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting ||
                snap.data == null) {
              return const Center(
                child: CommonLoader(),
              );
            }
            return SizedBox(
              height: 200,
              child: Obx(() {
                if (controller.isWalletConnected.value) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.red,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            StringConstant.walletWarning.tr,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      CommonPrimaryButton(
                        onPressed: () {
                          // write logiv to buyt the product
                        },
                        title: StringConstant.buy.tr,
                      ),
                    ],
                  );
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
                    CommonPrimaryButton(
                      onPressed: () async {
                        try {
                          final w3mService = await controller.w3mService;
                          WidgetsBinding.instance!
                              .addPostFrameCallback((timeStamp) {
                            if (w3mService.modalContext != null) {
                              w3mService.openModalView();
                            }
                          });
                        } catch (e) {
                          ToastManager.showError(e.toString());
                        }
                      },
                      title: StringConstant.connectWallet.tr,
                    ),
                  ],
                );
              }),
            );
          }),
    );
  }
}
