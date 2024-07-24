import 'package:flutter/material.dart';
import 'package:pest_gpt/src/common_widget/common_app_bar.dart';
import 'package:pest_gpt/src/common_widget/common_card.dart';
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
        titleText: pestModel.pestName,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                const SizedBox(width: 16),
                Expanded(
                  child: CommonCard(
                    child: Text(
                      'Ideal Temperature: \n ${pestDetail.idealTemperature?.min} - ${pestDetail.idealTemperature?.max}',
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(child: _buildPestInfo(pestDetail)),
          ],
        ),
      ),
    );
  }

  Widget _buildPestInfo(LLMPestInfo pestDetail) {
    return ListView(
      shrinkWrap: true,
      children: [
        CommonCard(
          child: Text(
            'Precautions: ${pestDetail.precautions?.join(', ')}',
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(height: 16),
        CommonCard(
          child: Text(
            'Pesticides: ${pestDetail.pesticides?.map((e) => '${e.name} - ${e.cost}').join(', ')}',
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(height: 16),
        CommonCard(
          child: Text(
            'Pest Info: ${pestDetail.pestInfo}',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
