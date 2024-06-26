import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/pages/pest_detection/controller/camera_controller.dart';
import 'package:pest_gpt/src/pages/pest_detection/widget/capture_or_pick.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  final PestCameraController _cameraController =
      Get.put(PestCameraController());

  @override
  void initState() {
    super.initState();
  }

  Future<void> _initializeCamera() async {
    await _cameraController.init();
    return _cameraController.initializeControllerFuture;
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeCamera(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Obx(
              () => Column(
                children: [
                  _cameraController.captureFile.value != null
                      ? Image.file(
                          File(_cameraController.captureFile.value!.path),
                        )
                      : Expanded(
                          child: CameraPreview(_cameraController.controller),
                        ),
                  CaptureOrPick(
                    onCapturePressed: _cameraController.captureImage,
                    onPickFromImagePressed: () {},
                  ),
                ],
              ),
            );
          }
        }
      },
    );
  }
}
