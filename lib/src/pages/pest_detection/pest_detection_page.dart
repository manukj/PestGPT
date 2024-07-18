import 'package:flutter/widgets.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/pages/pest_detection/widget/camera_widget.dart';

class PestDetection extends StatelessWidget {
  const PestDetection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonScaffold(
      body: CameraWidget(),
    );
  }
}
