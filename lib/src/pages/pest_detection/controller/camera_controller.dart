import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class PestCameraController extends GetxController {
  late List<CameraDescription> cameras;
  CameraController? controller;
  Future<void>? initializeControllerFuture;
  Rx<XFile?> captureFile = Rx<XFile?>(null);

  final loading = false.obs;
  final path = ''.obs;

  init() async {
    cameras = await availableCameras();
    final firstCamera = cameras.first;
    controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );
    initializeControllerFuture = controller?.initialize();
  }

  void setLoading(bool value) {
    loading.value = value;
  }

  void setPath(String value) {
    path.value = value;
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> captureImage() async {
    try {
      await initializeControllerFuture;

      final path = await getTemporaryDirectory();
      final filePath = '${path.path}/${DateTime.now()}.png';

      XFile? takenFile = await controller?.takePicture();
      captureFile.value = takenFile;
    } catch (e) {
      // Handle the error here
      print('Error capturing image: $e');
    }
  }
}
