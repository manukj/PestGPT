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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: NeuTextButton(
        enableAnimation: true,
        onPressed: isLoading ? null : onPressed,
        // style: ElevatedButton.styleFrom(
        //   padding: const EdgeInsets.symmetric(vertical: 15.0),
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: Constants.borderRadius,
        //   ),
        // ),
        text: Text(
          title ?? '',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     isLoading
        //         ? const Padding(
        //             padding: EdgeInsets.only(right: 5.0),
        //             child: CircularProgressIndicator(),
        //           )
        //         : const SizedBox(),
        //     titleWidget ?? Text(title ?? ''),
        //   ],
        // ),
      ),
    );
  }
}
