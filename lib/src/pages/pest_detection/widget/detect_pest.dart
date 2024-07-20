import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/pest_detection/controller/detect_pest_controller.dart';
import 'package:pest_gpt/src/pages/pest_detection/widget/detecting_animation.dart';

class DetectPest extends StatelessWidget {
  final String path;
  final DetectPestController controller = Get.put(DetectPestController());

  DetectPest({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Opacity(
                  opacity: controller.isLoading.value ? 0.5 : 1,
                  child: Image.file(
                    File(path),
                    width: double.infinity,
                  ),
                ),
                controller.isLoading.value
                    ? const Expanded(
                        child: Center(
                          child: DetectingAnimation(),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          CommonPrimaryButton(
            onPressed: controller.detectPest,
            title: StringConstant.detectPest.tr,
          )
        ],
      );
    });
  }
}
