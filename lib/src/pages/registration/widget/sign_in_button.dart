import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${StringConstant.alreadyHaveAnAccount.tr} : ',
          style: const TextStyle(fontSize: 16),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            StringConstant.signIn.tr,
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
