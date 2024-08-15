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
    return PestDetectionResponse.fromJson(jsonDecode(response));
  }

  Future<ImageUploadResponse> uploadImage(String filePath) async {
    var response = await postApiWithFile('common/attachment/add/', filePath);
    return ImageUploadResponse.fromJson(jsonDecode(response));
  }
}
