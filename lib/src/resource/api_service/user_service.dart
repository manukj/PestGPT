import 'dart:convert';

import 'package:pest_gpt/src/models/user/user_info_response.dart';
import 'package:pest_gpt/src/models/user/user_login_request.dart';
import 'package:pest_gpt/src/models/user/user_login_response.dart';
import 'package:pest_gpt/src/models/user/user_register_request.dart';
import 'package:pest_gpt/src/resource/api_service/base_api_service.dart';
import 'package:pest_gpt/src/resource/api_service/mock.dart';

class UserService extends BaseApiService {
  Future<UserLoginResponse> login(UserLoginRequest request) async {
    final response = await postApi('auth/login', {
      'username': request.username,
      'password': request.password,
    });
    return UserLoginResponse.fromJson(response);
  }

  Future<void> register(UserRegisterRequest request) async {
    final response = await postApi('auth/registerAdmin', request.toJson());
    return response.body;
  }

  Future<UserInfoResponse> getUserInfo() async {
    var responseo =
        UserInfoResponse.fromJson(jsonDecode(MockWeatherResponse.userInfoJson));
    return MockWeatherResponse.userInfo;
    final response = await getApi('user');
    return UserInfoResponse.fromJson(response);
  }
}
