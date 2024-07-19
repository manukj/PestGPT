import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/common_widget/common_text_field.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/registration/widget/sign_in_button.dart';
import 'package:pest_gpt/src/pages/registration/widget/terms_and_condition.dart';


class SingUpForm extends StatelessWidget {
  const SingUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonTextField(
          hintText: StringConstant.userName.tr,
          prefixIcon: const Icon(Icons.person),
        ),
        const SizedBox(height: 16),
        CommonTextField(
          prefixIcon: const Icon(Icons.email),
          hintText: StringConstant.email.tr,
        ),
        const SizedBox(height: 16),
        CommonTextField(
          prefixIcon: const Icon(Icons.phone),
          hintText: StringConstant.mobileNumber.tr,
        ),
        const SizedBox(height: 16),
        CommonTextField(
          prefixIcon: const Icon(Icons.lock),
          hintText: StringConstant.password.tr,
          obscureText: true,
        ),
        const SizedBox(height: 16),
        CommonTextField(
          prefixIcon: const Icon(Icons.lock),
          hintText: StringConstant.congfirmPassword.tr,
          obscureText: true,
        ),
        const SizedBox(height: 16),
        const TermsAndCondition(),
        const SizedBox(height: 24),
        CommonPrimaryButton(
          onPressed: () {},
          titleWidget: Text(StringConstant.signUp.tr),
        ),
        const SizedBox(height: 16),
        const SignInButton(),
      ],
    );
  }
}
