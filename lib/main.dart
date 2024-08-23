import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pest_gpt/src/app.dart';
import 'package:pest_gpt/src/pages/transcation_history.dart/controller/transcation_history_controller.dart';
import 'package:pest_gpt/src/resource/llm/llm_controller.dart';
import 'package:pest_gpt/src/resource/wallet_connect/wallet_connect_controller.dart';

Future<void> statusBarSetLight() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterStatusbarcolor.setStatusBarColor(Colors.white);
  await FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  await FlutterStatusbarcolor.setNavigationBarColor(Colors.white);
  await FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);

}

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));
  await GetStorage.init();
  await dotenv.load(fileName: "assets/.env");
  Get.put(LLMController());
  Get.put(WalletConnectController());
  Get.put(TranscationHistoryController());

  await statusBarSetLight();

  return runApp(const App());
}
