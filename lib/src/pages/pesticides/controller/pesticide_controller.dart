import 'package:get/get.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';

class PesticideController extends GetxController {
  final _selectedPesticideList = <Pesticide>[].obs;
  RxList get selectedPesticideList => _selectedPesticideList;

  void addPesticide(Pesticide pesticide) {
    _selectedPesticideList.add(pesticide);
  }

  void removePesticide(Pesticide pesticide) {
    _selectedPesticideList.remove(pesticide);
  }

  void clearPesticide() {
    _selectedPesticideList.clear();
  }
}
