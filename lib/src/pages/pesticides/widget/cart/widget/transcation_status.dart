import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/resource/image_path.dart';
import 'package:pest_gpt/src/resource/wallet_connect/wallet_connect_controller.dart';

class TranscationStatusWidget extends StatelessWidget {
  final TransactionStatus status;
  const TranscationStatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    if (status == TransactionStatus.inProgress) {
      return const CommonLoader();
    } else if (status == TransactionStatus.success) {
      return _buildStatus(
        StringConstant.transactionSuccess.tr,
        IMAGEPATH.successAnimation,
        StringConstant.buyMore.tr,
        () {
          Get.back();
        },
      );
    } else {
      return _buildStatus(
        StringConstant.transactionFailed.tr,
        IMAGEPATH.failedAnimation,
        StringConstant.tryAgain.tr,
        () {
          Get.find<WalletConnectController>().resetTransactionStatus();
        },
      );
    }
  }

  Widget _buildStatus(
    String title,
    String lottifilePath,
    String buttonText,
    void Function() onPressed,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Lottie.asset(lottifilePath, height: 200),
        CommonPrimaryButton(
          onPressed: onPressed,
          title: buttonText,
        ),
      ],
    );
  }
}
