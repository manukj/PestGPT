import 'package:pest_gpt/src/models/pest_detection/pest_detection_request.dart';
import 'package:pest_gpt/src/models/pest_detection/pest_detection_response.dart';
import 'package:pest_gpt/src/resource/api_service/base_api_service.dart';

class ApiService extends BaseApiService {
  Future<PestDetectionResponse> pestDetection(
      PestDetectionRequest request) async {
    final response = await post('/plug/pest/detector', request);
    return response.body;
  }
}
