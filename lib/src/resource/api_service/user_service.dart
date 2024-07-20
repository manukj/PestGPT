import 'package:pest_gpt/src/models/api/data_error_response.dart';
import 'package:pest_gpt/src/models/user/user_login_request.dart';
import 'package:pest_gpt/src/resource/api_service/base_api_service.dart';

class UserService extends BaseApiService {
  Future<DataorErrorResponse> login(UserLoginRequest request) async {
    final response = await postApi('auth/login', {
      'username': request.username,
      'password': request.password,
    });
    return response;
  }

  Future<void> register(String email, String password) async {
    final response = await post('auth/register', {
      'email': email,
      'password': password,
    });
    return response.body;
  }
}
