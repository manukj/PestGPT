import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class CaptureOrPick extends StatelessWidget {
  final VoidCallback onCapturePressed;
  final VoidCallback onPickFromImagePressed;
  const CaptureOrPick({
    super.key,
    required this.onCapturePressed,
    required this.onPickFromImagePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconButton(
                  context,
                  () {
                    Get.back();
                  },
                  Icons.home,
                ),
                NeuIconButton(
                  buttonColor: Theme.of(context).cardColor,
                  buttonHeight: 50,
                  borderRadius: BorderRadius.circular(25),
                  buttonWidth: 50,
                  enableAnimation: true,
                  icon: Icon(
                    Icons.radio_button_checked,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  onPressed: onCapturePressed,
                ),
                _buildIconButton(
                  context,
                  () {
                    onPickFromImagePressed();
                  },
                  Icons.image,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(
    context,
    Null Function() onPressed,
    IconData iconData,
  ) {
    return NeuIconButton(
      enableAnimation: true,
      icon: Icon(
        iconData,
        size: 30,
      ),
      onPressed: onPressed,
      buttonHeight: 50,
      buttonWidth: 50,
    );
  }
}
