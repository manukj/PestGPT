import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/localization/localizer_manager.dart';
import 'package:pest_gpt/src/pages/splash/splash.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Splash(),
      translations: LocalizationManager(),
      fallbackLocale: const Locale('en', 'US'),
      locale: Get.deviceLocale,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
    );
  }
}
