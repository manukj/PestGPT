import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_app_bar.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';
import 'package:pest_gpt/src/pages/pesticides/controller/pesticide_controller.dart';
import 'package:pest_gpt/src/pages/pesticides/widget/pesticides_list_item.dart';

class PesticidesPage extends GetView<PesticideController> {
  final LLMPestInfo pestInfo;
  const PesticidesPage({
    super.key,
    required this.pestInfo,
  });

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: const CommonAppBar(
        titleText: 'Pesticides',
      ),
      body: pestInfo.pesticides?.isEmpty ?? true
          ? const Center(
              child: Text('No pesticides found'),
            )
          : ListView.builder(
              itemCount: pestInfo.pesticides!.length,
              itemBuilder: (context, index) {
                return PesticidesListItem(
                  pesticide: pestInfo.pesticides![index],
                  onPesticideSelected: () {
                    controller.addPesticide(pestInfo.pesticides![index]);
                  },
                  onPesticideUnselected: () {
                    controller.removePesticide(pestInfo.pesticides![index]);
                  },
                );
              },
            ),
      floatingActionButton: Obx(() {
        return controller.selectedPesticideList.isNotEmpty
            ? CommonPrimaryButton(
                onPressed: () {
                  controller.clearPesticide();
                },
                titleWidget: const Row(
                  children: [
                    Icon(Icons.shopping_cart_rounded),
                    SizedBox(width: 10),
                    Text('Clear'),
                  ],
                ),
              )
            : Container();
      }),
    );
  }
}
