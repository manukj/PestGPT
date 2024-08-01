import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:web3modal_flutter/services/w3m_service/w3m_service.dart';
import 'package:web3modal_flutter/widgets/w3m_network_select_button.dart';

class WalletConnected extends StatelessWidget {
  final W3MService service;
  const WalletConnected({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${StringConstant.walletConnected.tr} ✅",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              StringConstant.selectedNetwork.tr,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            W3MNetworkSelectButton(service: service),
          ],
        ),
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
}
