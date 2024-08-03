import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/resource/image_path.dart';

class CommonLoader extends StatelessWidget {
  const CommonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            IMAGEPATH.pestLoadingAnimation,
            width: 200,
          ),
          const SizedBox(height: 10),
          const Text('Loading...', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
