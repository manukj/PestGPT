import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:pest_gpt/src/utils/authentication/authentication_controller.dart';

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

  Future postApi(String url, Map<String, dynamic> body) async {
    final response = await post(
      _baseUrl + url,
      body,
      headers: getHeaders(),
      contentType: _getContentTypes(),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('API Failed : ${response.body}');
    }
  }

  Future getApi(String url) async {
    final response = await get(
      _baseUrl + url,
      headers: getHeaders(),
      contentType: _getContentTypes(),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('API Failed : ${response.body}');
    }
  }

  String _getContentTypes() {
    return 'application/json; charset=UTF-8';
  }

  Map<String, String> getHeaders() {
    final token = Get.find<AuthenticationController>().getAccessToken();
    if (token == null) {
      return {};
    }
    return {'Authorization': token};
  }

  Future<dynamic> postApiWithFile(String url, String filePath) async {
    var uri =
        Uri.parse('https://dev-api.fcimcs.com/api/common/attachment/add/');
    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll(getHeaders());
    request.fields['note'] = 'test';
    var file = File(filePath);
    var stream = http.ByteStream(file.openRead());
    var length = await file.length();
    var mimeTypeData =
        lookupMimeType(filePath, headerBytes: [0xFF, 0xD8])?.split('/');
    request.files.add(
      http.MultipartFile(
        'files',
        stream,
        length,
        filename: basename(file.path),
        contentType: MediaType(mimeTypeData![0], mimeTypeData[1]),
      ),
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      print('File uploaded successfully');
      var responseData = await response.stream.toBytes();
      var result = String.fromCharCodes(responseData);
      return result;
    } else {
      throw Exception('${response.reasonPhrase}');
    }
  }
}
