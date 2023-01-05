import 'package:etherscan_api/etherscan_api.dart';
import 'package:test/test.dart';

void main() {
  group('ronin net', () {
    final eth = EtherscanAPI(
      apiKey: '',
      chain: EthChain.ronin,
    );

    test('.gasPrice() returns gasPrice', () async {
      final bal = await eth.gasPrice();
      expect(bal, isNot(EtherScanRpcResponseModel.empty()));
    });

    test('.blockNumber() returns blockNumber', () async {
      final bal = await eth.blockNumber();
      expect(bal, isNot(EtherScanRpcResponseModel.empty()));
    });

    test('.getBlockByNumber() returns blockInfo by number', () async {
      final bal = await eth.getBlockByNumber(tag: '0x1b4', isFull: true);
      expect(bal, isNot(EtherScanRpcResponseModel.empty()));
    });

    test('.estimateGas() returns estimateGas', () async {
      final transaction = await eth.estimateGas(
          from: '0x7ac28757054be115259bd58a8c42d7b6de41026c',
          to: '0x97a9107c1793bc407d6f527b77e7fff4d812bece',
          data:
              '0xa9059cbb000000000000000000000000c67b3b0bcbba57c5229b6fe6bf56239cddeb710400000000000000000000000000000000000000000000000005894ded91b69581');
      expect(transaction, isNot(EtherScanRpcResponseModel.empty()));
    });
    test('.getTransactionByHash() returns Transaction by hash', () async {
      final transaction = await eth.getTransactionByHash(
          txhash:
              '0x5d79075308c51595fd291234cc7c078e6d42161fd319cdaf8bd70f7b4d29b441');

      expect(transaction, isNot(EtherScanTxByHashModel.empty()));
    });
  });
}
