import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class PestCameraController extends GetxController {
  late List<CameraDescription> cameras;
  late CameraController controller;
  late Future<void> initializeControllerFuture;
  XFile? captureFile;

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

  Future<void> captureImage() async {
    await initializeControllerFuture;

    final path = await getTemporaryDirectory();
    final filePath = '${path.path}/${DateTime.now()}.png';

    var captureFile = await controller.takePicture();
  }
}
