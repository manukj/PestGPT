import 'package:get/get.dart';
import 'package:pest_gpt/src/resource/contract_abi/contract_abi.dart';
import 'package:pest_gpt/src/utils/toast/toast_manager.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

const _chainId = "11155111"; // sepolia chain id
final _sepoliaChain = W3MChainInfo(
  chainName: 'Sepolia',
  namespace: 'eip155:$_chainId',
  chainId: _chainId,
  tokenName: 'ETH',
  rpcUrl: 'https://rpc.sepolia.org/',
  blockExplorer: W3MBlockExplorer(
    name: 'Sepolia Explorer',
    url: 'https://sepolia.etherscan.io/',
  ),
);

class WalletConnectController extends GetxController {
  W3MService? _w3mService;
  RxBool isWalletConnected = false.obs;

  WalletConnectController() {
    initalize();
  }

  Future<void> initalize() async {
    W3MChainPresets.chains.putIfAbsent(_chainId, () => _sepoliaChain);
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
    _w3mService!.selectChain(_sepoliaChain);
    isWalletConnected.value = _w3mService!.isConnected;
    _w3mService!.getApprovedMethods();
  }

  Future<W3MService> get w3mService async {
    if (_w3mService == null) {
      await initalize();
    }
    return _w3mService!;
  }

  void updateStatus() {
    isWalletConnected.value = _w3mService!.isConnected;
    if (isWalletConnected.value) {
      ToastManager.showSuccess("Wallet Connected Successfully");
    } else {
      ToastManager.showError("Wallet Disconnected");
    }
  }

  Future<void> buyPesticide(
    int userId,
    String pesticideName,
    int cost,
  ) async {
    // Transfer 0.01 amount of Token using Smart Contract's transfer function
    var service = await w3mService;
    if (service.session == null || service.session!.address == null) {
      ToastManager.showError("Wallet not connected");
      return;
    }
    service.launchConnectedWallet();
    final result = await service.requestWriteContract(
      topic: service.session!.topic,
      chainId: 'eip155:$_chainId',
      deployedContract: deployedContract,
      functionName: 'buyPesticide',
      transaction: Transaction(
        from: EthereumAddress.fromHex(service.session!.address!),
        value: EtherAmount.fromInt(EtherUnit.wei, cost),
      ),
    );
    if (result.error != null) {
      ToastManager.showError(result.error!.message);
    } else {
      ToastManager.showSuccess("Transaction Successful");
    }
  }
}
