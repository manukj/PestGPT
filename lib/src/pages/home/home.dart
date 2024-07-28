import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/home/controller/home_controller.dart';
import 'package:pest_gpt/src/pages/home/widget/pest_task_list.dart';
import 'package:pest_gpt/src/pages/pest_detection/pest_detection_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: const PestTaskList(),
      floatingActionButton: CommonPrimaryButton(
        height: 50,
        width: 150,
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pest_control_outlined,
                color: Theme.of(context).colorScheme.surface),
            const SizedBox(width: 10),
            Text(
              StringConstant.detectPest.tr,
              style: TextStyle(color: Theme.of(context).colorScheme.surface),
            ),
          ],
        ),
        onPressed: () => Get.to(const PestDetection()),
      ),
    );
  }
}
