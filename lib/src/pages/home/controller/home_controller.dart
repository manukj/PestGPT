import 'package:get/get.dart';
import 'package:pest_gpt/src/models/pest/pest_tasks.dart';
import 'package:pest_gpt/src/models/user/user_info_response.dart';
import 'package:pest_gpt/src/pages/splash/splash.dart';
import 'package:pest_gpt/src/resource/api_service/user_service.dart';
import 'package:pest_gpt/src/resource/db_service/db_service.dart';
import 'package:pest_gpt/src/utils/authentication/authentication_controller.dart';

class HomeController extends GetxController {
  final RxBool isLoading = false.obs;
  final Rx<UserInfoResponse?> userInfo = null.obs;
  final Rx<List<PestTasks>> pestTasks = Rx([]);

  HomeController() {
    fetchUserInfo();
    fetchPestTasks();
  }

  void fetchPestTasks() {
    var list = <PestTasks>[];
    DatabaseService().getAllPestTasks().then((value) {
      list.addAll(value);
      pestTasks.value.clear();
      pestTasks.value = list;
    });
  }

  Future<void> updatePestTask(String pestName, pestTask) async {
    await DatabaseService().updateTask(pestName, pestTask);
    fetchPestTasks();
  }

  Future<void> deletePestTask(String pestName) async {
    await DatabaseService().deletePestTask(pestName);
    fetchPestTasks();
  }

  Future<void> fetchUserInfo() async {
    if (userInfo.value != null) return;
    isLoading.value = true;
    try {
      var value = await UserService().getUserInfo();
      userInfo.value = value;
      isLoading.value = false;
    } catch (e) {
      await Get.find<AuthenticationController>().logOut();
      Get.offAll(() => Splash());
    }
    isLoading.value = false;
  }
}
