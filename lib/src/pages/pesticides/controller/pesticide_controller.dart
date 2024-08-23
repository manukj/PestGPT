import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';
import 'package:pest_gpt/src/pages/pesticides/widget/pesticide_warning_bottomsheet.dart';
import 'package:pest_gpt/src/utils/bottom_sheet_util.dart';

class PesticideController extends GetxController {
  final _selectedPesticideList = <Pesticide>[].obs;
  RxList get selectedPesticideList => _selectedPesticideList;

  PesticideController(){
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          showAppBottomSheet(const PesticideWarningBottomsheet());
    });
  }

  void addPesticide(Pesticide pesticide) {
    _selectedPesticideList.add(pesticide);
  }

  void removePesticide(Pesticide pesticide) {
    _selectedPesticideList.remove(pesticide);
  }

  void clearPesticide() {
    _selectedPesticideList.clear();
  }

  double get totalPesticideCost {
    double totalCost = 0;
    for (var pesticide in _selectedPesticideList) {
      try {
        totalCost += double.parse(pesticide.cost);
      } catch (e) {
        print(e);
      }
    }
    return totalCost;
  }
}
