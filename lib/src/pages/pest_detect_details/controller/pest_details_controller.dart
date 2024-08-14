import 'package:get/get.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';
import 'package:pest_gpt/src/models/pest/pest_model.dart';
import 'package:pest_gpt/src/pages/pest_detection/controller/detect_pest_controller.dart';
import 'package:pest_gpt/src/resource/api_service/chat_gpt_service.dart';
import 'package:pest_gpt/src/resource/llm/llm_controller.dart';

class PestDetailsController extends GetxController {
  final DetectPestController detectPestController =
      Get.find<DetectPestController>();
  final Map<String, LLMPestInfo?> pestDetails = {};
  final isLoading = false.obs;
  final geminiController = Get.find<LLMController>();

  PestDetailsController() {
    loadPestInformation(detectPestController.pestList);
  }

  Future loadPestInformation(List<PestModel> pestList) async {
    if (pestList.isEmpty) return;
    if (pestDetails[pestList.first.pestName] != null) return;
    isLoading.value = true;
    for (var pest in pestList) {
      try {
        var response = await ChatGptService().generateResponse(
          pest.pestName,
        );
        pestDetails[pest.pestName] = response;
      } catch (e) {
        pestDetails[pest.pestName] = null;
      }
    }
    isLoading.value = false;
  }
}
