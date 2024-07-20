import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/utils/authentication/authentication_controller.dart';

class DetectPest extends StatelessWidget {
  final String path;
  const DetectPest({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.file(
            File(path),
            width: double.infinity,
          ),
        ),
        CommonPrimaryButton(
            onPressed: () {
              var access =
                  Get.find<AuthenticationController>().getAccessToken();
              print(access);
            },
            title: "Detect Pest")
      ],
    );
  }
}
