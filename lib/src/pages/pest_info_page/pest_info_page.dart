import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_app_bar.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';
import 'package:pest_gpt/src/models/pest/pest_model.dart';

class PestInfoPage extends StatelessWidget {
  final PestModel pestModel;
  final LLMPestInfo pestDetail;
  const PestInfoPage(this.pestModel, this.pestDetail, {super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        appBar: CommonAppBar(
          titleText: pestModel.pestName.capitalizeFirst,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Hero(
                  tag: pestModel.image,
                  child: Image.memory(
                    pestModel.image,
                    fit: BoxFit.scaleDown,
                    height: 100,
                  ),
                ),
                Text(pestModel.pestName),
              ],
            ),
            _buildPestInfo(pestDetail),
          ],
        ));
  }

  _buildPestInfo(LLMPestInfo pestDetail) {
    return Column(
      children: [
        Text(
            'Ideal Temperature: ${pestDetail.idealTemperature?.min} - ${pestDetail.idealTemperature?.max}'),
        Text('Precautions: ${pestDetail.precautions?.join(', ')}'),
        Text(
            'Pesticides: ${pestDetail.pesticides?.map((e) => '${e.name} - ${e.cost}').join(', ')}'),
          Text('Pest Info: ${pestDetail.pestInfo}'),
      ],
    );
  }
}
