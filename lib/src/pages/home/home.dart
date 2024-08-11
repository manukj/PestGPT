import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_app_bar.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/home/controller/home_controller.dart';
import 'package:pest_gpt/src/pages/home/widget/pest_task_list.dart';
import 'package:pest_gpt/src/pages/pest_detection/pest_detection_page.dart';
import 'package:pest_gpt/src/pages/transcation_history.dart/transcation_history.dart';
import 'package:pest_gpt/src/resource/image_path.dart';
import 'package:pest_gpt/src/resource/wallet_connect/wallet_connect_controller.dart';

class HomePage extends GetView<WalletConnectController> {
  HomePage({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: homeController.fetchUserInfo(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const CommonLoader();
          }
          return CommonScaffold(
            appBar: CommonAppBar(
              leading: const SizedBox(),
              showBackButton: false,
              titleText:
                  '${StringConstant.welcome.tr}\n${homeController.userInfo.value?.fullName ?? ''}',
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: CommonPrimaryButton(
                    color: Colors.white,
                    height: 50,
                    width: 50,
                    titleWidget: Image.asset(
                      IMAGEPATH.transactionHistory,
                      fit: BoxFit.cover,
                    ),
                    onPressed: () {
                      Get.to(const TranscationHistory());
                    },
                  ),
                )
              ],
            ),
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: Obx(() {
                      if (homeController.isLoading.value) {
                        return const CommonLoader();
                      }
                      return const PestTaskList();
                    }),
                  ),
                  CommonPrimaryButton(
                    height: 50,
                    width: double.infinity,
                    titleWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.pest_control_outlined,
                            color: Theme.of(context).colorScheme.surface),
                        const SizedBox(width: 10),
                        Text(
                          StringConstant.detectPest.tr,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.surface),
                        ),
                      ],
                    ),
                    onPressed: () => Get.to(const PestDetection()),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
