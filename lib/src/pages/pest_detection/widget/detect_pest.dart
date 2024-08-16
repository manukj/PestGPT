import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_error_widget.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/pest_detect_details/pest_detect_details.dart';
import 'package:pest_gpt/src/pages/pest_detection/controller/camera_controller.dart';
import 'package:pest_gpt/src/pages/pest_detection/controller/detect_pest_controller.dart';
import 'package:pest_gpt/src/pages/pest_detection/widget/detecting_animation.dart';
import 'package:pest_gpt/src/resource/image_path.dart';

class DetectPest extends StatelessWidget {
  final String path;
  final DetectPestController controller = Get.put(DetectPestController());

  DetectPest({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final isPestDetected = controller.processedImage.value != null;
        return controller.isPestDetectedResultEmpty.value
            ? CommonErrorWidget(
                message: StringConstant.noPestDetected.tr,
                lottieAssetPath: IMAGEPATH.emptyTaskList,
                onRetry: () {
                  Get.find<PestCameraController>().captureFile.value = null;
                  controller.clearResponse();
                },
              )
            : Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Center(
                          child: Opacity(
                            opacity: controller.isLoading.value ? 0.5 : 1,
                            child: isPestDetected
                                ? Hero(
                                    tag: controller.processedImage.value!
                                        .toString(),
                                    child: Image.memory(
                                      controller.processedImage.value!,
                                      width: double.infinity,
                                    ),
                                  )
                                : Image.file(
                                    File(path),
                                    width: double.infinity,
                                  ),
                          ),
                        ),
                        controller.isLoading.value
                            ? const Center(
                                child: DetectingAnimation(),
                              )
                            : Container(),
                        const AppBar(),
                      ],
                    ),
                  ),
                  CommonPrimaryButton(
                    color: isPestDetected ? Colors.green : null,
                    onPressed: () => {
                      if (isPestDetected)
                        {Get.to(() => PestDetectDetails())}
                      else
                        {controller.detectPest(path)}
                    },
                    title: isPestDetected
                        ? StringConstant.showPestDetails.tr
                        : StringConstant.detectPest.tr,
                    isLoading: controller.isLoading.value,
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              );
      },
    );
  }
}

class AppBar extends GetView<DetectPestController> {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: Get.width,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0XFF1F6950).withOpacity(0.7),
                  const Color(0XFF14161E).withOpacity(0.7),
                  const Color(0XFF14161E).withOpacity(0.7),
                  const Color(0XFF1F6950).withOpacity(0.7),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    color: Colors.white,
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () {
                    Get.find<PestCameraController>().captureFile.value = null;
                    controller.clearResponse();
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  StringConstant.detectPest.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
