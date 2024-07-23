import 'package:get/get.dart';
import 'package:pest_gpt/src/models/pest_detection/pest_model.dart';
import 'package:pest_gpt/src/resource/gemini/gemini_controller.dart';

class PestDetailsController extends GetxController {
  final Map<String, String?> pestDetails = {};
  final isLoading = false.obs;
  final geminiController = Get.find<GeminiController>();

  Future loadPestInformation(List<PestModel> pestList) async {
    isLoading.value = true;
    for (var pest in pestList) {
      var prompt =
          "Give me information about the pest ${pest.pestName} in 200 words and in bullet points, i want only the bullet points ";
      pestDetails[pest.pestName] =
          await geminiController.generateResponse(prompt);
    }
    isLoading.value = false;
  }
}
