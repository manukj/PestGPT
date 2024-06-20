import 'package:flutter/material.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/common_widget/common_text_field.dart';
import 'package:pest_gpt/src/pages/login/forgot_password.dart';
import 'package:pest_gpt/src/pages/login/header.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginHeader(),
              const SizedBox(height: 20),
              const CommonTextField(
                  hintText: "Email", prefixIcon: Icon(Icons.email)),
              const SizedBox(height: 20),
              const CommonTextField(
                  hintText: "Password", prefixIcon: Icon(Icons.vpn_key)),
              const SizedBox(height: 10),
              const ForgotPassword(),
              const SizedBox(height: 10),
              // // Log In Button
              CommonPrimaryButton(
                onPressed: () {},
                child: const Text('Log In'),
              ),
              const SizedBox(height: 20),
              // const AlternativeOptions(),
              // const PoweredBy(),
              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
