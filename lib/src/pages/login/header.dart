import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pest_gpt/src/resource/image_path.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          IMAGEPATH.loginTractor, // Replace with your image asset
          height: 200,
        ),
        const SizedBox(height: 20),
        // Title
        const Text(
          'Prallel Farm',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
