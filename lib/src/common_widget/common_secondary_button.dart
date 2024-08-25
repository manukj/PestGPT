import 'package:flutter/material.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';

class CommonSecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? titleWidget;
  final String? title;
  final bool isLoading;
  final double? width;
  final Color? color;
  final double? height;
  final EdgeInsets padding;
  final Color? textColor;
  const CommonSecondaryButton(
      {super.key,
      required this.onPressed,
      this.titleWidget,
      this.title,
      this.isLoading = false,
      this.width,
      this.color,
      this.height,
      this.padding = const EdgeInsets.all(0),
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return CommonPrimaryButton(
      onPressed: onPressed,
      titleWidget: titleWidget,
      title: title,
      isLoading: isLoading,
      width: width,
      color: Colors.white,
      height: height,
      padding: padding,
      textColor: Colors.teal,
    );
  }
}
