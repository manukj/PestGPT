import 'package:flutter/material.dart';
import 'package:pest_gpt/src/app.dart';
import 'package:pest_gpt/src/detection/detection.dart';

void main() {
  Detection.init();
  return runApp(const App());
}
