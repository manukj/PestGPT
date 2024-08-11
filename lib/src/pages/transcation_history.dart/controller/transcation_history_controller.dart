import 'package:get/get.dart';
import 'package:pest_gpt/src/models/pest/pesticide_purchase_model.dart';
import 'package:pest_gpt/src/resource/contract_abi/contract_abi.dart';
import 'package:pest_gpt/src/resource/wallet_connect/wallet_connect_controller.dart';
import 'package:pest_gpt/src/utils/toast/toast_manager.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class TranscationHistoryController extends GetxController {
  final WalletConnectController walletConnectController = Get.find();
  String? userID;
  Rx<List<PesticidePurchaseModel>> transcationHistory = Rx([]);

  @override
  void onInit() {
    fetchTranscationHistory();
    super.onInit();
  }

  void setUserID(String? id) {
    userID = id;
  }

  void clearTranscationHistory() {
    transcationHistory.value = [];
  }

  Future<List<PesticidePurchaseModel>> fetchTranscationHistory() async {
    if (transcationHistory.value.isNotEmpty) {
      return transcationHistory.value;
    }
    if (userID == null) {
      throw Exception("User ID is not set");
    }
    var service = await walletConnectController.w3mService;
    if (service.session == null || service.session!.address == null) {
      ToastManager.showError("Wallet not connected");
      throw Exception("Wallet not connected");
    }
    final result = await service.requestWriteContract(
      topic: service.session!.topic,
      chainId: 'eip155:1',
      deployedContract: deployedContract,
      functionName: 'getPesticidesBought',
      transaction: Transaction(
        from: EthereumAddress.fromHex(service.session!.address!),
        value: EtherAmount.fromInt(EtherUnit.finney, 10), // == 0.010
      ),
      parameters: [userID],
    );
    print(result);
    return [];
  }
}
