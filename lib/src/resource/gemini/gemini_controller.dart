import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:pest_gpt/src/utils/toast/toast_manager.dart';

class GeminiController {
  GenerativeModel? _model;

  GeminiController() {
    try {
      initalizeModel();
    } catch (e) {
      ToastManager.showError("Failed to initalize Gemini model");
    }
  }

  initalizeModel() async {
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    if (apiKey != null) {
      _model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: apiKey,
      );
    }
  }

  Future<String?> generateResponse(String prompt) async {
    if (_model == null) {
      await initalizeModel();
    }
    final content = [Content.text(prompt)];
    final response = await _model!.generateContent(content);
    return response.text;
  }
}
