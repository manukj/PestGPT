import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/localization/localizer_manager.dart';
import 'package:pest_gpt/src/pages/pest_detection/pest_detection_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: PestDetectionPage(),
      translations: LocalizationManager(),
      fallbackLocale: const Locale('en', 'US'),
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
    );
  }
}
