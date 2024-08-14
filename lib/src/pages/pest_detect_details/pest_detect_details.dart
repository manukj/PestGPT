import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_app_bar.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/pest_detect_details/controller/pest_details_controller.dart';
import 'package:pest_gpt/src/pages/pest_detect_details/widget/expand_pest_details.dart';
import 'package:pest_gpt/src/pages/pest_detection/controller/detect_pest_controller.dart';

class PestDetectDetails extends StatelessWidget {
  final DetectPestController controller = Get.find<DetectPestController>();
  final detailsController = Get.put(PestDetailsController());
  PestDetectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        titleText: StringConstant.pestDetails.tr,
      ),
      body: Obx(() {
        if (detailsController.isLoading.value) {
          return CommonLoader(
            loadingText: StringConstant.fetchingPestDetail.tr,
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: controller.processedImage.value!.toString(),
                child: Image.memory(
                  controller.processedImage.value!,
                  width: double.infinity,
                  height: 150,
                ),
              ),
              Column(
                children: controller.pestList.map((pest) {
                  return ExpandPestDetails(pestModel: pest);
                }).toList(),
              )
            ],
          ),
        );
      }),
    );
  }
}
