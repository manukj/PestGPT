import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/common_widget/common_text_field.dart';
import 'package:pest_gpt/src/common_widget/powered_by.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/login/widget/alternative_options.dart';
import 'package:pest_gpt/src/pages/login/widget/forgot_password.dart';
import 'package:pest_gpt/src/pages/login/widget/header.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonScaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [LoginWidget(), PoweredBy()],
        ),
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LoginHeader(),
        const SizedBox(height: 20),
        CommonTextField(
          hintText: StringConstant.email.tr,
          prefixIcon: const Icon(Icons.email),
        ),
        const SizedBox(height: 20),
        CommonTextField(
            hintText: StringConstant.password.tr,
            prefixIcon: const Icon(Icons.vpn_key)),
        const ForgotPassword(),
        const SizedBox(height: 10),
        CommonPrimaryButton(
          onPressed: () {
            print("updating locale"); 
            Get.updateLocale(const Locale('zh', 'CN'));
          },
          child: Text(StringConstant.signIn.tr),
        ),
        const SizedBox(height: 20),
        const AlternativeOptions(),
      ],
    );
  }
}
