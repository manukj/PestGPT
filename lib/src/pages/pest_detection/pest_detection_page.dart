import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pest_gpt/src/detection/detection.dart';
import 'package:pytorch_lite/pytorch_lite.dart';

class PestDetectionPage extends StatefulWidget {
  const PestDetectionPage({super.key});

  @override
  State<PestDetectionPage> createState() => _PestDetectionPageState();
}

class _PestDetectionPageState extends State<PestDetectionPage> {
  List? _prediction;
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool objectDetection = false;
  List<ResultObjectDetection?> objDetect = [];
  late ModelObjectDetection _objectModel;
  String? textToShow;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Detection.getModel().then((value) {
      _objectModel = value;
    });
  }

  String inferenceTimeAsString(Stopwatch stopwatch) =>
      "Inference Took ${stopwatch.elapsed.inMilliseconds} ms";

  Future runObjectDetection() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    Stopwatch stopwatch = Stopwatch()..start();
    objDetect = await _objectModel.getImagePrediction(
        await File(image!.path).readAsBytes(),
        minimumScore: 0.1,
        iOUThreshold: 0.3);
    textToShow = inferenceTimeAsString(stopwatch);
    print('object executed in ${stopwatch.elapsed.inMilliseconds} ms');

    for (var element in objDetect) {
      print({
        "score": element?.score,
        "className": element?.className,
        "class": element?.classIndex,
        "rect": {
          "left": element?.rect.left,
          "top": element?.rect.top,
          "width": element?.rect.width,
          "height": element?.rect.height,
          "right": element?.rect.right,
          "bottom": element?.rect.bottom,
        },
      });
    }
    setState(() {
      //this.objDetect = objDetect;
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: runObjectDetection,
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      child: const Text(
        "Run object detection with labels",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
