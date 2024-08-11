import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';
import 'package:pest_gpt/src/pages/transcation_history.dart/controller/transcation_history_controller.dart';

class TranscationHistory extends GetView<TranscationHistoryController> {
  const TranscationHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.fetchTranscationHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CommonLoader(),
            );
          }

          if (snapshot.hasError && snapshot.data == null) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index].name),
                subtitle: Text(snapshot.data![index].cost.toString()),
              );
            },
          );
        });
  }
}
