import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';

class CommonErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final String lottieAssetPath;
  final bool hideRetryButton;
  final String? retyButtonTitle;
  
  const CommonErrorWidget({
    super.key,
    required this.message,
    this.onRetry,
    required this.lottieAssetPath,
    this.hideRetryButton = false,
    this.retyButtonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                lottieAssetPath,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                message,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        if (!hideRetryButton)
          CommonPrimaryButton(
            onPressed: onRetry ?? () {},
            title: retyButtonTitle ?? StringConstant.tryAgain.tr,
          ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
