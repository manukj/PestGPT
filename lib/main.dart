import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pest_gpt/src/app.dart';
import 'package:pest_gpt/src/pages/pesticides/controller/pesticide_controller.dart';
import 'package:pest_gpt/src/resource/llm/llm_controller.dart';

Future<void> main() async {
  await GetStorage.init();
  await dotenv.load(fileName: "assets/.env");
  Get.put(LLMController());
  Get.put(PesticideController());

  return runApp(const App());
}
