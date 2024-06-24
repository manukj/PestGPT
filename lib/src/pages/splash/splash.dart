import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/pages/Intro/controller/intro_controler.dart';
import 'package:pest_gpt/src/pages/Intro/intro.dart';
import 'package:pest_gpt/src/pages/landing/landing_page.dart';
import 'package:pest_gpt/src/pages/pest_detection/pest_detection_page.dart';
import 'package:pest_gpt/src/utils/authentication/authentication_controller.dart';

class Splash extends StatelessWidget {
  final AuthenticationController _authenticationManager =
      Get.put(AuthenticationController());
  final IntroController _introController = Get.put(IntroController());

  Splash({
    super.key,
  });

  Future<void> initalize() async {
    _authenticationManager.checkLoginStatus();
    _introController.checkIfIntroIsSeen();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initalize(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            if (_authenticationManager.isLogged.value) {
              return const LandingPage();
            } else {
              if (_introController.isFirstTime.value) {
                return const IntroPage();
              } else {
                return const PestDetection();
              }
            }
          }
        }
      },
    );
  }
}
