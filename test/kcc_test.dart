import 'package:etherscan_api/etherscan_api.dart';
import 'package:etherscan_api/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('testnet balance', () {
    final eth = EtherscanAPI(
      apiKey: 'PUEGihB4WBA8RVfuSZPI',
      chain: EthChain.kcc,
    );

    test('.balance() returns testnet balance data', () async {
      final bal = await eth.txList(
        address: '0x0a7a51B8887ca23B13d692eC8Cb1CCa4100eda4B',
        page: 1,
        offset: 50,
      );
      print('======={bal.length} : ${bal.result?.length}=========');
      expect(bal, isNot(EtherScanBalanceModel.empty()));
    });
  });
}
