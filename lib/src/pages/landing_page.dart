import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/pages/controller/landing_controller.dart';

class LandingPage extends StatelessWidget {
  final Controller c = Get.put(Controller());

  LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
      body: Center(
        child: Column(
          children: [
            Text("hello".tr),
            ElevatedButton(
              child: const Text("Increment"),
              onPressed: () => c.increment(),
            ),
            ElevatedButton(
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              child: const Text("Change Theme"),
            ),
            ElevatedButton(
              child: const Text("Change language"),
              onPressed: () => {
                if (Get.locale == const Locale('en', 'US'))
                  {Get.updateLocale(const Locale('zh', 'CN'))}
                else
                  {Get.updateLocale(const Locale('en', 'US'))}
              },
            ),
          ],
        ),
      ),
    );
  }
}
