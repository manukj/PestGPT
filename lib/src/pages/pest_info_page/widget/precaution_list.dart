import 'package:flutter/material.dart';
import 'package:pest_gpt/src/common_widget/common_icon_button.dart';

class PrecautionList extends StatefulWidget {
  final List<String> precautions;
  const PrecautionList(this.precautions, {super.key});

  @override
  State<PrecautionList> createState() => _PrecautionListState();
}

class _PrecautionListState extends State<PrecautionList> {
  List<String> selectedPrecautions = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.precautions
          .map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    Text(
                      e,
                      style: const TextStyle(fontSize: 18),
                    ),
                    CommonIconButton(
                      onPressed: () {},
                      icon: selectedPrecautions.contains(e)
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
