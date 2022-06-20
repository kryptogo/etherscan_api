import 'package:etherscan_api/etherscan_api.dart';
import 'package:etherscan_api/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('kcc net', () {
    final eth = EtherscanAPI(
      apiKey: 'PUEGihB4WBA8RVfuSZPI',
      chain: EthChain.kcc,
    );

    test('.txList() returns txList', () async {
      final bal = await eth.kccTxList(
        address: '0x0a7a51B8887ca23B13d692eC8Cb1CCa4100eda4B',
        page: 1,
        offset: 50,
      );
      expect(bal, isNot(EtherScanBalanceModel.empty()));
    });

    test('.blockNumber() returns blockNumber', () async {
      final bal = await eth.blockNumber();
      expect(bal, isNot(EtherScanRpcResponseModel.empty()));
    });
  });
}
