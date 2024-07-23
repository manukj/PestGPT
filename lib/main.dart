import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pest_gpt/src/app.dart';
import 'package:pest_gpt/src/resource/gemini/gemini_controller.dart';

Future<void> main() async {
  await GetStorage.init();
  await dotenv.load(fileName: "assets/.env");
  Get.put(GeminiController());

  return runApp(const App());
}
