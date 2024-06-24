import 'package:flutter/material.dart';
import 'package:pest_gpt/src/resource/constants.dart';

class CaptureOrPick extends StatelessWidget {
  const CaptureOrPick({super.key});

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
                    print('clicked');
                  },
                  Icons.home,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.radio_button_checked,
                    size: 65,
                  ),
                  onPressed: () {},
                ),
                _buildIconButton(
                  context,
                  () {
                    print('clicked');
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
