import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final VoidCallback? onBackPressed;
  final Color? backgroundColor;

  const CommonAppBar({
    super.key,
    this.titleText,
    this.onBackPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 30,
        ),
        onPressed: () {
          if (onBackPressed != null) {
            onBackPressed!();
            return;
          }
          Navigator.pop(context);
        },
      ),
      title: titleText != null
          ? Expanded(
              child: Text(
                titleText!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
