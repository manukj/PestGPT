import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_connect/connect.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';

const mockResponse = """
{
  "pest_info": "Aphids are small sap-sucking insects that affect a wide variety of plants, including roses, vegetables, fruit trees, and ornamental plants. They have a long history of being a major agricultural pest, causing damage by feeding on plant sap and transmitting plant viruses. Aphids reproduce rapidly, making them difficult to control once an infestation occurs.",
  "ideal_temperature": {
    "min": 15.0,
    "max": 30.0
  },
  "ideal_humidity": {
    "min": 60.0,
    "max": 80.0
  },
  "ideal_wind": {
    "min": 20.0,
    "max": 50.0
  },
  "precautions": [
    "1. Regularly inspect plants for signs of aphids.",
    "2. Use insecticidal soaps or neem oil as preventive measures.",
    "3. Encourage natural predators like ladybugs and lacewings.",
    "4. Avoid over-fertilizing plants as it can attract aphids."
  ],
  "pesticides": [
    {
      "name": "Insecticidal Soap",
      "cost": "15"
    },
    {
      "name": "Neem Oil",
      "cost": "20"
    },
    {
      "name": "Pyrethrin",
      "cost": "25"
    }
  ]
}
""";

class ChatGptService extends GetConnect {
  final String url = 'https://api.openai.com/v1/chat/completions';
  final Map<String, String> headers = {
    'Authorization': 'Bearer ${dotenv.env['CHAT_GPT_API_KEY']}',
    'Content-Type': 'application/json'
  };

  Future<LLMPestInfo> generateResponse(String pestName) async {
    // await Future.delayed(Duration(seconds: 2));
    // return LLMPestInfo.fromJson(jsonDecode(mockResponse));
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
