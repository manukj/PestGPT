import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_icon_button.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/models/pest/pest_tasks.dart';
import 'package:pest_gpt/src/resource/db_service/db_service.dart';

class PrecautionList extends StatefulWidget {
  final List<String> precautions;
  final String pestName;
  const PrecautionList(this.precautions, {super.key, required this.pestName});

  @override
  State<PrecautionList> createState() => _PrecautionListState();
}

class _PrecautionListState extends State<PrecautionList> {
  List<String> selectedPrecautions = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Precautions",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ...widget.precautions
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 4,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          e,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      CommonIconButton(
                        onPressed: () {
                          setState(() {
                            if (selectedPrecautions.contains(e)) {
                              selectedPrecautions.remove(e);
                            } else {
                              selectedPrecautions.add(e);
                            }
                          });
                        },
                        icon: selectedPrecautions.contains(e)
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          const SizedBox(
            height: 10,
          ),
          if (selectedPrecautions.isNotEmpty)
            CommonPrimaryButton(
              onPressed: () {
                var pestTask = PestTasks(
                    pestName: widget.pestName,
                    tasks: selectedPrecautions
                        .map((e) => Tasks(taskName: e))
                        .toList());
                DatabaseService().addPestTask(
                  pestTask,
                );
              },
              title: StringConstant.addAsTask.tr,
            ),
        ],
      ),
    );
  }
}
