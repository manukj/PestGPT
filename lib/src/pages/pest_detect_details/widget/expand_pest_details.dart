import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:pest_gpt/src/models/pest/pest_info.dart';
import 'package:pest_gpt/src/models/pest/pest_model.dart';
import 'package:pest_gpt/src/pages/pest_detect_details/controller/pest_details_controller.dart';
import 'package:pest_gpt/src/pages/pest_info_page/pest_info_page.dart';

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
          child: Hero(
            tag: widget.pestModel.image,
            child: Image.memory(
              Uint8List.fromList(
                img.encodeJpg(widget.pestModel.image),
              ),
              fit: BoxFit.scaleDown,
            ),
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
              : _buildPestInfo(
                  controller.pestDetails[widget.pestModel.pestName],
                  widget.pestModel,
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

  _buildPestInfo(LLMPestInfo? pestDetail, PestModel pestModel) {
    if (pestDetail == null) {
      return const Center(
        child: Text("Failed to fetch details"),
      );
    } else {
      return Column(
        children: [
          Text(pestDetail.pestInfo ?? "N/A"),
          TextButton(
            onPressed: () {
              Get.to(PestInfoPage(pestModel, pestDetail));
            },
            child: const Text('View More'),
          )
        ],
      );
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Ideal Temperature"),
          Text("Min: ${pestDetail.idealTemperature?.min ?? 'N/A'}"),
          Text("Max: ${pestDetail.idealTemperature?.max ?? 'N/A'}"),
          const SizedBox(height: 10),
          const Text("Precautions"),
          ...(pestDetail.precautions ?? []).map((e) => Text("• $e")),
          const SizedBox(height: 10),
          const Text("Pesticides"),
          ...(pestDetail.pesticides ?? [])
              .map((e) => Text("${e?.name} - ${e?.cost}")),
        ],
      );
    }
  }
}
