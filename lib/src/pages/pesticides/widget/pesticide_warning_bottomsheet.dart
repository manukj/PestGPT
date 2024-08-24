import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/common_widget/common_outlined_primary_button.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/resource/image_path.dart';

class PesticideWarningBottomsheet extends StatelessWidget {
  const PesticideWarningBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StringConstant.pesticidesAreHarmful.tr,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Lottie.asset(
                  IMAGEPATH.harmfulAnimation,
                ),
              ),
              const Divider(),
              Container(
                color: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  StringConstant.doNotUsePesticides.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        Row(
          children: [
            CommonOutlinedPrimaryButton(
              child: Text(
                StringConstant.goBack.tr,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
              onPressed: () {
                Get.back();
                Get.back();
              },
            ),
            const SizedBox(
              width: 5,
            ),
            CommonPrimaryButton(
              onPressed: () {
                Get.back();
              },
              title: StringConstant.purchase.tr,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
