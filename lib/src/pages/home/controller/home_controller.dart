import 'package:get/get.dart';
import 'package:pest_gpt/src/models/pest/pest_tasks.dart';
import 'package:pest_gpt/src/resource/db_service/db_service.dart';

class HomeController extends GetxController {
  final Rx<List<PestTasks>> pestTasks = Rx([]);

  HomeController() {
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
}
