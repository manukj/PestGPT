import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class CommonPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? titleWidget;
  final String? title;
  final bool isLoading;
  final double? width;
  final double? height;

  const CommonPrimaryButton({
    required this.onPressed,
    this.titleWidget,
    this.title,
    this.isLoading = false,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return titleWidget != null
        ? GestureDetector(
            onTap: onPressed,
            child: NeuCard(
              cardColor: neuDefault1,
              cardWidth: width ?? double.infinity,
              cardHeight: height,
              child: titleWidget!,
            ),
          )
        : Container(
            width: width ?? double.infinity,
            height: height,
            padding: const EdgeInsets.all(10),
            child: NeuTextButton(
              enableAnimation: true,
              onPressed: isLoading ? null : onPressed,
              text: Text(
                title ?? '',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
          );
  }
}
