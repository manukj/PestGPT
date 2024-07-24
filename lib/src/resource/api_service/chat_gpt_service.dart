import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_connect/connect.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';

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

class ChatGptService extends GetConnect {
  final String url = 'https://api.openai.com/v1/chat/completions';
  final Map<String, String> headers = {
    'Authorization': 'Bearer ${dotenv.env['CHAT_GPT_API_KEY']}',
    'Content-Type': 'application/json'
  };

  Future<LLMPestInfo> generateResponse(String pestName) async {
    return LLMPestInfo.fromJson(jsonDecode(mockResponse));
    final Map<String, dynamic> data = {
      'model': 'gpt-4',
      'messages': [
        {'role': 'system', 'content': 'You are an expert in pest management.'},
        {
          'role': 'user',
          'content':
              "Provide a JSON response with information about pest '$pestName'. Include pest_info: a short description of 150 words telling which plants it affects and its history. Then include ideal temperature min and max in which this pest grows, precautions to take to prevent this pest, and a list of pesticides with their costs."
        }
      ],
      'temperature': 0.7,
      'max_tokens': 100,
      'n': 1,
      'stop': null,
      'response_format': 'json'
    };

    final response = await post(url, data, headers: headers);
    if (response.status.hasError) {
      throw Exception('Failed to generate response');
    } else {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      final String content = responseJson['choices'][0]['message']['content'];
      return LLMPestInfo.fromJson(jsonDecode(content));
    }
  }
}
