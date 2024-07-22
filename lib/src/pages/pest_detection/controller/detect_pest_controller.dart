import 'package:get/get.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/models/pest_detection/pest_detection_request.dart';
import 'package:pest_gpt/src/models/pest_detection/pest_detection_response.dart';
import 'package:pest_gpt/src/resource/api_service/pest_detect_service.dart';
import 'package:pest_gpt/src/utils/toast/toast_manager.dart';

class DetectPestController extends GetxController {
  final isLoading = false.obs;
  final Rx<PestDetectionResponse?> response = Rx<PestDetectionResponse?>(null);

  void setLoading(bool value) {
    isLoading.value = value;
  }

  void setResponse(PestDetectionResponse value) {
    response.value = value;
  }

  void clearResponse() {
    response.value = null;
  }

  Future<void> detectPest() async {
    setLoading(true);
    PestDetectionRequest request = PestDetectionRequest(
        detectionList: ["user_images/Ninzore/20231212203813.jpg"]);

    try {
      var response = await PestDetectService().detect(request);
      ToastManager.showSuccess(StringConstant.pestDetected.tr);
      setResponse(response);
    } catch (e) {
      ToastManager.showError(
          StringConstant.failedToDetectPest.tr + e.toString());
    }
    setLoading(false);
  }
}
