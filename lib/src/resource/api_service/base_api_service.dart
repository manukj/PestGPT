import 'package:get/get.dart';

class BaseApiService extends GetConnect {
  @override
  void onInit() {
    baseUrl = 'https://dev-api.fcimcs.com/api/';
    super.onInit();
  }
}
