import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class CommonTabHeader extends StatefulWidget {
  final int numberOfTab;
  final List<String> tabHeaders;
  final Function(int) onChangeTab;
  const CommonTabHeader({
    super.key,
    required this.numberOfTab,
    required this.tabHeaders,
    required this.onChangeTab,
  });

  @override
  State<CommonTabHeader> createState() => _CommonTabHeaderState();
}

class _CommonTabHeaderState extends State<CommonTabHeader> {
  int _currentTabIndex = 0;

  void _onTabTap(int index) {
    setState(() {
      _currentTabIndex = index;
    });
    widget.onChangeTab(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tab Headers
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(widget.numberOfTab, (index) {
            return NeuTextButton(
              onPressed: () => _onTabTap(index),
              text: Text(widget.tabHeaders[index]),
              enableAnimation: true,
              buttonColor:
                  _currentTabIndex != index ? Colors.transparent : neuDefault1,
              borderColor:
                  _currentTabIndex != index ? Colors.transparent : neuBlack,
              shadowColor:
                  _currentTabIndex != index ? Colors.transparent : neuShadow,
            );
          }),
        ),
        // Tab Content
      ],
    );
  }
}
