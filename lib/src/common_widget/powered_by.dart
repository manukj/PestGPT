import 'package:flutter/material.dart';

class PoweredBy extends StatelessWidget {
  const PoweredBy({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/mutus_tech_logo.png', // Replace with your image asset
      height: 50,
    );
  }
}
