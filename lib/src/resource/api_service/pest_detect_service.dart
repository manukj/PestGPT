import 'dart:convert';

import 'package:pest_gpt/src/models/pest/image_upload_response.dart';
import 'package:pest_gpt/src/models/pest/pest_detection_request.dart';
import 'package:pest_gpt/src/models/pest/pest_detection_response.dart';
import 'package:pest_gpt/src/resource/api_service/base_api_service.dart';

class PestDetectService extends BaseApiService {
  Future<PestDetectionResponse> detect(PestDetectionRequest request) async {
    final response = await postApi(
      'plug/pest/detector',
      request.toJson(),
    );
    // final response = mockDetectResponse;
    return PestDetectionResponse.fromJson(jsonDecode(response));
  }

  Future<ImageUploadResponse> uploadImage(String filePath) async {
    var response = await postApiWithFile('common/attachment/add/', filePath);
    return ImageUploadResponse.fromJson(jsonDecode(response));
  }
}

String _mockDetectResponse = """
[
  [
    {
      "original_shape": [
        521,
        800
      ],
      "class_id": 8.0,
      "class_name": "LADYBUG (COCCINELLIDAE)",
      "confidence": 0.8696745038032532,
      "box": [
        311.10394287109375,
        288.80194091796875,
        443.31219482421875,
        398.41162109375
      ]
    },
    {
      "original_shape": [
        521,
        800
      ],
      "class_id": 2.0,
      "class_name": "POLLEN BEETLE (MELIGETHES SPP.)",
      "confidence": 0.738635778427124,
      "box": [
        461.9914855957031,
        357.9443054199219,
        488.14794921875,
        381.14178466796875
      ]
    }
  ]
]""";
