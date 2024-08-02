import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/resource/wallet_connect/wallet_connect_controller.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class WalletConnected extends GetView<WalletConnectController> {
  final W3MService service;
  const WalletConnected({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${StringConstant.walletConnected.tr} ✅",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                if (service.isConnected) {
                  service.disconnect();
                  controller.updateStatus();
                }
              },
              child: Text(
                StringConstant.disconnectWallet.tr,
                style: const TextStyle(
                    color: Colors.red, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        _buildTextAndWidget(
          StringConstant.selectedNetwork.tr,
          W3MNetworkSelectButton(service: service),
        ),
        _buildTextAndWidget(
          StringConstant.balance.tr,
          W3MAccountButton(service: service),
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.red,
          ),
          padding: const EdgeInsets.all(8.0),
          child: Text(
            StringConstant.walletWarning.tr,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
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

  Widget _buildTextAndWidget(String text, Widget widget) {
    return Column(
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            widget,
          ],
        ),
      ],
    );
  }
}
