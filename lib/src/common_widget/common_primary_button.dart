import 'package:flutter/material.dart';

class CommonPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CommonPrimaryButton({
    required this.onPressed,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
