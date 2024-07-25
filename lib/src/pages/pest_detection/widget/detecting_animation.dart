import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/resource/image_path.dart';

class DetectingAnimation extends StatelessWidget {
  const DetectingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(IMAGEPATH.scanningAnimation);
  }
}
