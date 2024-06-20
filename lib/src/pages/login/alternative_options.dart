import 'package:flutter/material.dart';

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
        // Sign in with passKey button
        OutlinedButton.icon(
          onPressed: () {
            // Handle sign in with passKey
          },
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          icon: Icon(Icons.fingerprint),
          label: Text('Sign in with passKey'),
        ),
        SizedBox(height: 20),
        // Sign Up
        GestureDetector(
          onTap: () {
            // Handle sign up
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
