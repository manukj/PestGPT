import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';
import 'package:pest_gpt/src/pages/pest_detection/controller/camera_controller.dart';
import 'package:pest_gpt/src/pages/pest_detection/widget/capture_or_pick.dart';

class CameraWidget extends StatelessWidget {
  CameraWidget({super.key});
  final PestCameraController _cameraController =
      Get.find<PestCameraController>();

  Future<void> _initializeCamera() async {
    await _cameraController.init();
    return _cameraController.initializeControllerFuture;
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
            return _cameraController.controller == null
                ? const CommonLoader()
                : Column(
                    children: [
                      Expanded(
                        child: CameraPreview(_cameraController.controller!),
                      ),
                      CaptureOrPick(
                        onCapturePressed: _cameraController.captureImage,
                        onPickFromImagePressed: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (image != null) {
                            _cameraController.captureFile.value = image;
                          }
                        },
                      ),
                    ],
                  );
          }
        }
      },
    );
  }
}
