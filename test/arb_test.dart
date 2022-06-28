import 'package:etherscan_api/etherscan_api.dart';
import 'package:etherscan_api/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('arb net', () {
    final eth = EtherscanAPI(
      apiKey: 'FI7BH92XJUV9MM7YJ45NGCRZQ6WB7RJB5F',
      chain: EthChain.arbitrum,
      enableLogs: true,
    );

    test('.txList() returns txList', () async {
      final bal = await eth.txList(
        address: '0x0a7a51B8887ca23B13d692eC8Cb1CCa4100eda4B',
        page: 1,
      );
      print('=======bal : ${bal.result!.length}=========');
      expect(bal, isNot(EtherScanBalanceModel.empty()));
    });
    test('.txList() returns txList', () async {
      final blockNumber = await eth.blockNumber();
      print('=======blockNumber : $blockNumber=========');
      expect(blockNumber, isNot(EtherScanRpcResponseModel.empty()));
    });
    test('.gasPrice() returns txList', () async {
      final gasPrice = await eth.gasPrice();
      print('=======gasPrice : $gasPrice=========');
      expect(gasPrice, isNot(EtherScanRpcResponseModel.empty()));
    });

    test('.getTransactionByHash() returns txList', () async {
      final transaction = await eth.getTransactionByHash(
          txhash:
              '0xc633e1a472d63872fdb2068632b6823fea0903dc3707ccd2b624aadc96077846');
      print('=======transaction : $transaction=========');
      expect(transaction, isNot(EtherScanRpcResponseModel.empty()));
    });
  });
}
