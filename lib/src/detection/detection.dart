import 'package:flutter/material.dart';
import 'package:pytorch_lite/pytorch_lite.dart';

class Detection {
  static ModelObjectDetection? _model;

  static Future<void> init() async {
    await getModel();
  }

  static Future<ModelObjectDetection> getModel() async {
    try {
      WidgetsFlutterBinding.ensureInitialized(); // Add this line
      _model ??= await PytorchLite.loadObjectDetectionModel(
        "assets/models/yolov8n.torchscript", 80, 640, 640,
        labelPath: "assets/labels/labels_objectDetection.txt",
        objectDetectionModelType: ObjectDetectionModelType.yolov5);
      if (_model == null) {
        throw Exception("Model not loaded");
      }
      return _model!;
    } catch (e) {
      print("Error loading model: $e");
      rethrow;
    }
  }
}
