import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pest_gpt/src/app.dart';


Future<void> main() async {
  await GetStorage.init();
  return runApp(const App());
}
