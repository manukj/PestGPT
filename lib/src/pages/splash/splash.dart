import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/pages/Intro/intro.dart';
import 'package:pest_gpt/src/pages/landing/landing_page.dart';
import 'package:pest_gpt/src/utils/authentication/authentication_manager.dart';

class Splash extends StatelessWidget {
  final AuthenticationManager _authenticationManager =
      Get.put(AuthenticationManager());

  Splash({
    super.key,
  });

  Future<void> initalize() async {
    _authenticationManager.checkLoginStatus();
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
              return IntroPage();
            }
          }
        }
      },
    );
  }
}
