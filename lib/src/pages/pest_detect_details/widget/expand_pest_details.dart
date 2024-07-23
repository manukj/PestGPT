import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:pest_gpt/src/models/pest_detection/pest_model.dart';
import 'package:pest_gpt/src/pages/pest_detect_details/controller/pest_details_controller.dart';

class ExpandPestDetails extends StatefulWidget {
  final PestModel pestModel;
  const ExpandPestDetails({super.key, required this.pestModel});

  @override
  State<ExpandPestDetails> createState() => _ExpandPestDetailsState();
}

class _ExpandPestDetailsState extends State<ExpandPestDetails> {
  bool _customTileExpanded = false;
  PestDetailsController controller = Get.find<PestDetailsController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ExpansionTile(
        title: Text(widget.pestModel.pestName),
        tilePadding: const EdgeInsets.all(10),
        leading: Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.onSurface,
              width: 1.0,
            ),
          ),
          child: Image.memory(
            Uint8List.fromList(
              img.encodeJpg(widget.pestModel.image),
            ),
            fit: BoxFit.scaleDown,
          ),
        ),
        trailing: Icon(
          _customTileExpanded
              ? Icons.arrow_drop_up_sharp
              : Icons.arrow_drop_down,
        ),
        children: [
          controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                      controller.pestDetails[widget.pestModel.pestName] ??
                          "No information found"),
                ),
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            _customTileExpanded = expanded;
          });
        },
      );
    });
  }
}
