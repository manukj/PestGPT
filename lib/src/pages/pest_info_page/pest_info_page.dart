import 'package:flutter/material.dart';
import 'package:pest_gpt/src/common_widget/common_app_bar.dart';
import 'package:pest_gpt/src/common_widget/common_card.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';
import 'package:pest_gpt/src/models/pest/pest_model.dart';
import 'package:pest_gpt/src/pages/pest_info_page/widget/pest_image_n_climate.dart';

class PestInfoPage extends StatelessWidget {
  final PestModel pestModel;
  final LLMPestInfo pestInfo;
  const PestInfoPage(this.pestModel, this.pestInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        titleText: pestModel.pestName,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          shrinkWrap: true,
          children: [
            PestImageNClimate(pestModel: pestModel, pestInfo: pestInfo),
            const SizedBox(height: 16),
            _buildPestInfo(pestInfo),
          ],
        ),
      ),
    );
  }

  Widget _buildPestInfo(LLMPestInfo pestInfo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Precautions",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        pestInfo.precautions != null
            ? Column(
                children: pestInfo.precautions!
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: CommonCard(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              e,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            : const SizedBox(),
        const SizedBox(height: 16),
        CommonCard(
          child: Text(
            'Pesticides: ${pestInfo.pesticides?.map((e) => '${e.name} - ${e.cost}').join(', ')}',
            style: const TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
