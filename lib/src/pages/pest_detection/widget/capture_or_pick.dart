import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/resource/constants.dart';

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
                IconButton(
                  icon: Icon(
                    Icons.radio_button_checked,
                    color: Theme.of(context).primaryColor,
                    size: 65,
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
    return IconButton(
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: Constants.borderRadius,
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            width: 3,
          ),
        ),
        child: Icon(
          iconData,
          size: 30,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
