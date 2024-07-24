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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PestImageNClimate(pestModel: pestModel, pestInfo: pestInfo),
            const SizedBox(height: 16),
            Expanded(child: _buildPestInfo(pestInfo)),
          ],
        ),
      ),
    );
  }

  Widget _buildPestInfo(LLMPestInfo pestInfo) {
    return ListView(
      shrinkWrap: true,
      children: [
        
        CommonCard(
          child: Text(
            'Precautions: ${pestInfo.precautions?.join(', ')}',
            style: const TextStyle(fontSize: 18),
          ),
        ),
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
