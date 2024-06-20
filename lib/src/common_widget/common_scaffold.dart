import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  final Widget child;
  const CommonScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pest GPT'),
      ),
      body: child,
    );
  }
}
