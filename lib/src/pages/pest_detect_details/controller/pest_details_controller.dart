import 'dart:convert';

import 'package:get/get.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';
import 'package:pest_gpt/src/models/pest/pest_model.dart';
import 'package:pest_gpt/src/resource/gemini/gemini_controller.dart';

class PestDetailsController extends GetxController {
  final Map<String, PestInfo?> pestDetails = {};
  final isLoading = false.obs;
  final geminiController = Get.find<GeminiController>();

  Future loadPestInformation(List<PestModel> pestList) async {
    isLoading.value = true;
    for (var pest in pestList) {
      try {
        var prompt =
            "Give me information about the pest ${pest.pestName} in 200 words and in bullet points, i want only the bullet points ";
        var response = await geminiController.generateResponse(
          prompt,
        );
        pestDetails[pest.pestName] = PestInfo.fromJson(jsonDecode(response!));
      } catch (e) {
        pestDetails[pest.pestName] = null;
      }
    }
    isLoading.value = false;
  }
}
