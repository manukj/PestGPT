import 'package:flutter/material.dart';
import 'package:pest_gpt/src/resource/constants.dart';

class CommonPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? titleWidget;
  final String? title;
  final bool isLoading;

  const CommonPrimaryButton({
    required this.onPressed,
    this.titleWidget,
    this.title,
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          shape: const RoundedRectangleBorder(
            borderRadius: Constants.borderRadius,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? const Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox(),
            titleWidget ?? Text(title ?? ''),
          ],
        ),
      ),
    );
  }
}
