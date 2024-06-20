import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  const CommonScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.resizeToAvoidBottomInset,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: body,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      ),
    );
  }
}
