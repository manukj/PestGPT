import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/common_widget/common_card.dart';
import 'package:pest_gpt/src/common_widget/common_icon_button.dart';
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
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: CommonCard(
                      child: ListTile(
                        onTap: () => {
                          Get.to(page);
                        },
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(e.pestName),
                            CommonIconButton(
                              color: Colors.red,
                              icon: Icons.delete,
                              onPressed: () {
                                controller.deletePestTask(e.pestName);
                              },
                            ),
                          ],
                        ),
                        subtitle: Text("Total Task ${e.tasks.length}"),
                      ),
                    ),
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
