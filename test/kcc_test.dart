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
          address: '0xbd451b952de19f2c7ba2c8c516b0740484e953b2');
      print('======={bal.length} : ${bal.result?.length}=========');
      expect(bal, isNot(EtherScanBalanceModel.empty()));
    });
  });
}
