import 'package:pest_gpt/src/models/user/user_login_request.dart';
import 'package:pest_gpt/src/models/user/user_login_response.dart';
import 'package:pest_gpt/src/resource/api_service/base_api_service.dart';

class UserService extends BaseApiService {
  Future<UserLoginResponse> login(UserLoginRequest request) async {
    final response = await post('auth/login', {
      'email': request.email,
      'password': request.password,
    });
    return UserLoginResponse.fromJson(response.body);
  }

  Future<void> register(String email, String password) async {
    final response = await post('auth/register', {
      'email': email,
      'password': password,
    });
    return response.body;
  }
}
