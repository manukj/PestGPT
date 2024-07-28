import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/pages/home/controller/home_controller.dart';
import 'package:pest_gpt/src/resource/image_path.dart';

class PestTaskList extends GetView<HomeController> {
  const PestTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.pestTasks.value.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(IMAGEPATH.emptyList),
                  const Text(
                    'No pest tasks available',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            : ListView(
                shrinkWrap: true,
                children: controller.pestTasks.value.map((e) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(e.pestName),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            controller.deletePestTask(e.pestName);
                          },
                        ),
                      ],
                    ),
                    subtitle: Text(e.tasks.length.toString()),
                  );
                }).toList(),
              );
      },
    );
  }
}

class PestTaskItem extends StatelessWidget {
  const PestTaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
