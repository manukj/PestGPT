import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_connect/connect.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';
import 'package:pest_gpt/src/resource/api_service/local_data/pest_detection_local_data.dart';

class ChatGptService extends GetConnect {
  final String url = 'https://api.openai.com/v1/chat/completions';
  final Map<String, String> headers = {
    'Authorization': 'Bearer ${dotenv.env['CHAT_GPT_API_KEY']}',
    'Content-Type': 'application/json'
  };

  Future<LLMPestInfo> generateResponse(String pestName) async {
    var localData = getPestInfoFromLocalData(pestName);
    if (localData != null) {
      return localData;
    }
    final Map<String, dynamic> data = {
      "model": "gpt-4o-mini",
      "messages": [
        {"role": "system", "content": "You are an expert in pest management."},
        {
          "role": "user",
          "content":
              "Provide a JSON response for a pest named $pestName. The JSON should include 'pest_info', which is a short description of not more than 150 words telling which plants it affects and its history. Also, include 'ideal_temperature' (in degree), 'ideal_humidity', and 'ideal_wind' in which is subtable for pest, each as objects with 'min' and 'max' values of type double. Include a 'precautions' array with strings, and a 'pesticides' array with objects containing 'name' and 'cost' as strings."
        }
      ],
      "response_format": {"type": "json_object"}
    };

    final response = await post(url, data, headers: headers);
    if (response.status.hasError) {
      throw Exception('Failed to generate response');
    } else {
      final Map<String, dynamic> responseJson = (response.body);
      final String content = responseJson['choices'][0]['message']['content'];
      return LLMPestInfo.fromJson(jsonDecode(content));
    }
  }
}
