import 'package:flutter/material.dart';
import 'package:pest_gpt/src/common_widget/common_outlined_primary_button.dart';
import 'package:pest_gpt/src/pages/login/widget/sign_up_button.dart';

class AlternativeOptions extends StatelessWidget {
  const AlternativeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // OR divider
        const Row(
          children: [
            Expanded(child: Divider(thickness: 1)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('OR USE'),
            ),
            Expanded(child: Divider(thickness: 1)),
          ],
        ),
        const SizedBox(height: 10),
        CommonOutlinedPrimaryButton(
          onPressed: () {},
          prefixIcon: const Icon(Icons.fingerprint),
          child: const Text('Sign in with passKey'),
        ),

        const SignUpButton()
      ],
    );
  }
}
