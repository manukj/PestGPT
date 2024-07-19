import 'package:flutter/material.dart';
import 'package:pest_gpt/src/resource/constants.dart';

class CommonPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? titleWidget;
  final String? title;

  const CommonPrimaryButton({
    required this.onPressed,
    this.titleWidget,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          shape: const RoundedRectangleBorder(
            borderRadius: Constants.borderRadius,
          ),
        ),
        child: titleWidget ?? Text(title ?? ''),
      ),
    );
  }
}
