import 'package:get/get.dart';
import 'package:pest_gpt/src/utils/cache_manager/cache_manager.dart';

class AuthenticationController extends GetxController with CacheManager {
  final isLogged = false.obs;
  void logOut() {
    isLogged.value = false;
    remove(CacheManagerKey.TOKEN);
  }

  void login(String? token) async {
    isLogged.value = true;
    await saveString(CacheManagerKey.TOKEN, token);
  }

  void checkLoginStatus() {
    final token = getString(CacheManagerKey.TOKEN);
    if (token != null) {
      isLogged.value = true;
    }
  }
}
