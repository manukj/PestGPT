import 'dart:convert';

import 'package:pest_gpt/src/models/pest_detection/pest_detection_request.dart';
import 'package:pest_gpt/src/models/pest_detection/pest_detection_response.dart';
import 'package:pest_gpt/src/resource/api_service/base_api_service.dart';

class PestDetectService extends BaseApiService {
  Future<PestDetectionResponse> detect(PestDetectionRequest request) async {
    var json = """
                [
                  [
                    {
                      "original_shape": [
                        1536,
                        2048
                      ],
                      "class_id": 0.0,
                      "class_name": "INSECTA",
                      "confidence": 0.7603688836097717,
                      "box": [
                        946.5693359375,
                        905.1393432617188,
                        979.3685302734375,
                        946.6809692382812
                      ]
                    }
                  ]
                ]
        """;

    await Future.delayed(Duration(seconds: 1));
    var data = JsonDecoder().convert(json);
    var detectionResponse = PestDetectionResponse.fromJson(data);
    return detectionResponse;
    final response = await postApi(
      '/plug/pest/detector',
      request.toJson(),
    );
    return PestDetectionResponse.fromJson(response);
  }
}
