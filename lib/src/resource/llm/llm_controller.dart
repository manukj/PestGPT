import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:pest_gpt/src/utils/toast/toast_manager.dart';

final mockResponse = """
{
  "pest_info": "Flies (Diptera) are a diverse group of insects that affect a variety of plants including fruits, vegetables, and ornamental plants. Historically, flies have been known to spread diseases and damage crops. They are particularly troublesome in agriculture where they can lead to significant economic losses by contaminating food sources and spreading pathogens.",
  "ideal_temperature": {
    "min": "20°C",
    "max": "30°C"
  },
  "precautions": [
    "Maintain good sanitation practices, including regularly cleaning up spills and garbage, and emptying trash receptacles often.",
    "Store food properly in airtight containers to prevent access by flies.",
    "Use screens on windows and doors to prevent flies from entering.",
    "Repair any cracks or holes in walls or screens that could provide entry points for flies.",
    "Eliminate breeding sites by removing stagnant water sources, such as standing water in buckets, tires, or clogged gutters.",
    "Consider using fly traps or other non-chemical methods to control fly populations."
  ],
  "pesticides": [
    {
      "name": "Pyrethrin",
      "cost": "10-20 USDC"
    },
    {
      "name": "Malathion",
      "cost": "15-30 USDC"
    },
    {
      "name": "Permethrin",
      "cost": "20-40 USDC"
    },
    {
      "name": "Bifenthrin",
      "cost": "25-50 USDC"
    }
  ]
}
""";

class LLMController {
  GenerativeModel? _model;
  int totalRequests = 0;
  final int maxRequests = 3;

  LLMController() {
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
    return mockResponse;
    if (_model == null) {
      await initalizeModel();
    }
    if (totalRequests >= maxRequests) {
      ToastManager.showError(
          "You have reached the maximum number of requests for this session");
      return null;
    }
    totalRequests++;
    final content = [Content.text(prompt)];
    final response = await _model!.generateContent(
      content,
      generationConfig: GenerationConfig(
        maxOutputTokens: 100,
        temperature: 0.5,
        responseMimeType: "application/json",
      ),
    );
    return response.text;
  }
}
