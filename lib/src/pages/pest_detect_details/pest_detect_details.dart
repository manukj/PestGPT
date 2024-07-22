import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:pest_gpt/src/common_widget/common_app_bar.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/pest_detection/controller/detect_pest_controller.dart';

class PestDetectDetails extends StatelessWidget {
  final DetectPestController controller = Get.find<DetectPestController>();

  PestDetectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getPestNames();
    return CommonScaffold(
      appBar: CommonAppBar(
        titleText: StringConstant.pestDetails.tr,
      ),
      body: Column(
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
              return ExpansionTile(
                title: Text(pest.pestName),
                leading: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onSurface,
                      width: 1.0,
                    ),
                  ),
                  child: Image.memory(
                    Uint8List.fromList(
                      img.encodeJpg(pest.image),
                    ),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                trailing: const SizedBox(
                  width: 20,
                  height: 20,
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
