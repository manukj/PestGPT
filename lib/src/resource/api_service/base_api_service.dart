import 'package:get/get.dart';
import 'package:pest_gpt/src/models/api/data_error_response.dart';

class BaseApiService extends GetConnect {
  final String _baseUrl = 'https://dev-api.fcimcs.com/api/';
  @override
  void onInit() {
    httpClient.baseUrl = _baseUrl;
    httpClient.defaultContentType = "application/json; charset=UTF-8";
    httpClient.timeout = const Duration(seconds: 8);

    httpClient.addResponseModifier((request, response) async {
      print(response.body);
    });

    // var headers = {'Authorization': "Bearer $token"};
    // httpClient.addAuthenticator<void>((request) async {
    //   request.headers.addAll(headers);
    //   return request;
    // });

    super.onInit();
  }

  Future<DataorErrorResponse> postApi(
      String url, Map<String, dynamic> body) async {
    final response = await post(_baseUrl + url, body);
    if (response.statusCode == 200) {
      return DataorErrorResponse(data: response.body);
    } else {
      return DataorErrorResponse(error: response.body);
    }
  }
}
