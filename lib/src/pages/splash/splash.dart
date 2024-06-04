import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/pages/landing/landing_page.dart';
import 'package:pest_gpt/src/utils/authentication/authentication_manager.dart';

class Splash extends StatelessWidget {
  Splash({Key? key});

  final AuthenticationManager _authenticationManager =
      Get.put(AuthenticationManager());

  Future<void> initializeSettings() async {
    _authenticationManager.checkLoginStatus();

    //Simulate other services for 3 seconds
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initializeSettings(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else {
            if (snapshot.hasError) {}
            return LandingPage();
          }
        });
  }
}
