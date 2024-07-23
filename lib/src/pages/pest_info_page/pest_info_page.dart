import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
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
        body: Column(
      children: [
        Row(
          children: [
            Hero(
              tag: pestModel.image,
              child: Image.memory(
                Uint8List.fromList(
                  img.encodeJpg(pestModel.image),
                ),
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
        Text('Ideal Temperature: ${pestDetail.idealTemperature?.min} - ${pestDetail.idealTemperature?.max}'),
        Text('Precautions: ${pestDetail.precautions?.join(', ')}'),
        Text('Pesticides: ${pestDetail.pesticides?.map((e) => '${e.name} - ${e.cost}').join(', ')}'),
        Text('Pest Info: ${pestDetail.pestInfo}'),
      ],
    );
  }
}
