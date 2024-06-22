import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Create account : ',
          style: TextStyle(fontSize: 16),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Register',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
