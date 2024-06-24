import 'package:camera/camera.dart';
import 'package:get/get.dart';

class PestCameraController extends GetxController {
  late List<CameraDescription> cameras;
  late CameraController controller;
  late Future<void> initializeControllerFuture;

  final loading = false.obs;
  final path = ''.obs;

  init() async {
    cameras = await availableCameras();
    final firstCamera = cameras.first;
    controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );
    initializeControllerFuture = controller.initialize();
  }

  PestCameraController() {
    availableCameras().then((value) {});
  }

  void setLoading(bool value) {
    loading.value = value;
  }

  void setPath(String value) {
    path.value = value;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void captureImage() {
  }
}
