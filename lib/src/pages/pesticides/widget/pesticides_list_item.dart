import 'package:flutter/material.dart';
import 'package:pest_gpt/src/common_widget/common_card.dart';
import 'package:pest_gpt/src/common_widget/common_icon_button.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';
import 'package:pest_gpt/src/resource/constants.dart';

class PesticidesListItem extends StatefulWidget {
  final Pesticide pesticide;
  final VoidCallback onPesticideSelected;
  final VoidCallback onPesticideUnselected;
  const PesticidesListItem({
    super.key,
    required this.pesticide,
    required this.onPesticideSelected,
    required this.onPesticideUnselected,
  });

  @override
  State<PesticidesListItem> createState() => _PesticidesListItemState();
}

class _PesticidesListItemState extends State<PesticidesListItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: CommonCard(
        child: ListTile(
          title: Text(
            widget.pesticide.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "${widget.pesticide.cost} ${Constants.currencySymbol} per/litre",
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          trailing: isSelected
              ? CommonIconButton(
                  iconSize: 20,
                  width: 35,
                  height: 35,
                  icon: (Icons.check_circle),
                  color: Colors.teal,
                  onPressed: () {
                    setState(() {
                      isSelected = false;
                      widget.onPesticideUnselected();
                    });
                  },
                )
              : CommonIconButton(
                  iconSize: 20,
                  width: 35,
                  height: 35,
                  icon: (Icons.check_circle_outline),
                  color: Colors.grey,
                  onPressed: () {
                    setState(() {
                      isSelected = true;
                      widget.onPesticideSelected();
                    });
                  },
                ),
        ),
      ),
    );
  }
}
