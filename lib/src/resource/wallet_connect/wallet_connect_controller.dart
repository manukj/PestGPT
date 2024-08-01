import 'package:get/get.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class WalletConnectController extends GetxController {
  W3MService? _w3mService;
  RxBool isWalletConnected = false.obs;

  WalletConnectController() {
    initalize();
  }

  Future<void> initalize() async {
    _w3mService = W3MService(
      projectId: 'd8eb95f605374ff6e204ae7326531e8b',
      metadata: const PairingMetadata(
        name: 'Web3Modal Flutter Example',
        description: 'Web3Modal Flutter Example',
        url: 'https://www.walletconnect.com/',
        icons: ['https://walletconnect.com/walletconnect-logo.png'],
        redirect: Redirect(
          native: 'pestGPT://',
          universal: 'https://www.walletconnect.com',
        ),
      ),
    );
    await _w3mService!.init();
    isWalletConnected.value = _w3mService!.isConnected;
  }

  Future<W3MService> get w3mService async {
    if (_w3mService == null) {
      await initalize();
    }
    return _w3mService!;
  }
}
