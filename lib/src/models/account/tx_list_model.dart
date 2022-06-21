import 'dart:convert';
import 'dart:math';

import 'package:equatable/equatable.dart';

class EtherScanTxListModel with EquatableMixin {
  final String status;
  final String message;
  final List<EtherScanTxResult>? result;
  EtherScanTxListModel({
    required this.status,
    required this.message,
    required this.result,
  });

  EtherScanTxListModel copyWith({
    String? status,
    String? message,
    List<EtherScanTxResult>? result,
  }) {
    return EtherScanTxListModel(
      status: status ?? this.status,
      message: message ?? this.message,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'result': result?.map((x) => x.toMap()).toList(),
    };
  }

  factory EtherScanTxListModel.empty() {
    return EtherScanTxListModel(
      status: 'empty',
      message: '',
      result: [],
    );
  }

  factory EtherScanTxListModel.fromMap(Map<String, dynamic> map) {
    return EtherScanTxListModel(
      status: map['status'],
      message: map['message'],
      result: List<EtherScanTxResult>.from(
          map['result']?.map((x) => EtherScanTxResult.fromMap(x))),
    );
  }

  factory EtherScanTxListModel.kccFromMap(Map<String, dynamic> map) {
    return EtherScanTxListModel(
      status: map['code'].toString(),
      message: map['msg'],
      result: List<EtherScanTxResult>.from(
          map['data']?.map((x) => EtherScanTxResult.fromKccMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory EtherScanTxListModel.fromJson(String source) =>
      EtherScanTxListModel.fromMap(json.decode(source));

  factory EtherScanTxListModel.kccFromJson(String source) =>
      EtherScanTxListModel.kccFromMap(json.decode(source));

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [status, message, result ?? []];
}

class EtherScanTxResult with EquatableMixin {
  final String blockNumber;
  final String timeStamp;
  final String hash;
  final String nonce;
  final String blockHash;
  final String transactionIndex;
  final String from;
  final String to;
  final String value;
  final String gas;
  final String gasPrice;
  final String isError;
  final String txreceipt_status;
  final String input;
  final String contractAddress;
  final String cumulativeGasUsed;
  final String gasUsed;
  final String confirmations;
  EtherScanTxResult({
    required this.blockNumber,
    required this.timeStamp,
    required this.hash,
    required this.nonce,
    required this.blockHash,
    required this.transactionIndex,
    required this.from,
    required this.to,
    required this.value,
    required this.gas,
    required this.gasPrice,
    required this.isError,
    required this.txreceipt_status,
    required this.input,
    required this.contractAddress,
    required this.cumulativeGasUsed,
    required this.gasUsed,
    required this.confirmations,
  });

  EtherScanTxResult copyWith({
    String? blockNumber,
    String? timeStamp,
    String? hash,
    String? nonce,
    String? blockHash,
    String? transactionIndex,
    String? from,
    String? to,
    String? value,
    String? gas,
    String? gasPrice,
    String? isError,
    String? txreceipt_status,
    String? input,
    String? contractAddress,
    String? cumulativeGasUsed,
    String? gasUsed,
    String? confirmations,
  }) {
    return EtherScanTxResult(
      blockNumber: blockNumber ?? this.blockNumber,
      timeStamp: timeStamp ?? this.timeStamp,
      hash: hash ?? this.hash,
      nonce: nonce ?? this.nonce,
      blockHash: blockHash ?? this.blockHash,
      transactionIndex: transactionIndex ?? this.transactionIndex,
      from: from ?? this.from,
      to: to ?? this.to,
      value: value ?? this.value,
      gas: gas ?? this.gas,
      gasPrice: gasPrice ?? this.gasPrice,
      isError: isError ?? this.isError,
      txreceipt_status: txreceipt_status ?? this.txreceipt_status,
      input: input ?? this.input,
      contractAddress: contractAddress ?? this.contractAddress,
      cumulativeGasUsed: cumulativeGasUsed ?? this.cumulativeGasUsed,
      gasUsed: gasUsed ?? this.gasUsed,
      confirmations: confirmations ?? this.confirmations,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'blockNumber': blockNumber,
      'timeStamp': timeStamp,
      'hash': hash,
      'nonce': nonce,
      'blockHash': blockHash,
      'transactionIndex': transactionIndex,
      'from': from,
      'to': to,
      'value': value,
      'gas': gas,
      'gasPrice': gasPrice,
      'isError': isError,
      'txreceipt_status': txreceipt_status,
      'input': input,
      'contractAddress': contractAddress,
      'cumulativeGasUsed': cumulativeGasUsed,
      'gasUsed': gasUsed,
      'confirmations': confirmations,
    };
  }

  factory EtherScanTxResult.fromMap(Map<String, dynamic> map) {
    return EtherScanTxResult(
      blockNumber: map['blockNumber'],
      timeStamp: map['timeStamp'],
      hash: map['hash'],
      nonce: map['nonce'],
      blockHash: map['blockHash'],
      transactionIndex: map['transactionIndex'],
      from: map['from'],
      to: map['to'],
      value: map['value'],
      gas: map['gas'],
      gasPrice: map['gasPrice'],
      isError: map['isError'],
      txreceipt_status: map['txreceipt_status'],
      input: map['input'],
      contractAddress: map['contractAddress'],
      cumulativeGasUsed: map['cumulativeGasUsed'],
      gasUsed: map['gasUsed'],
      confirmations: map['confirmations'],
    );
  }

  factory EtherScanTxResult.fromKccMap(Map<String, dynamic> map) {
    return EtherScanTxResult(
      blockNumber: map['block_no'].toString(),
      timeStamp: map['time'].toString(),
      hash: map['txid'],
      nonce: map['nonce'].toString(),
      blockHash: map['blockHash'].toString(), // kcc has no block hash
      transactionIndex: map['index'].toString(),
      from: map['from'],
      to: map['to'],
      value: (double.parse((map['value'] ?? '0')) * pow(10, 18))
          .toStringAsFixed(0),
      gas: map['gasUsed'].toString(),
      gasPrice: map['gasPrice'].toString(),
      isError: map['receiptErr'] ?? '0',
      txreceipt_status: map['receiptErr'] ?? '0', // kcc has no txreceipt_status
      input: map['input'].toString(), // kcc has no input
      contractAddress: map['toIsContract'] == 1 ? map['to'] : '',
      cumulativeGasUsed:
          map['cumulativeGasUsed'].toString(), // kcc has no txreceipt_status
      gasUsed: map['gasUsed'].toString(),
      confirmations:
          map['confirmations'].toString(), // kcc has no txreceipt_status
    );
  }

  String toJson() => json.encode(toMap());

  factory EtherScanTxResult.fromJson(String source) =>
      EtherScanTxResult.fromMap(json.decode(source));

  factory EtherScanTxResult.fromKccJson(String source) =>
      EtherScanTxResult.fromKccMap(json.decode(source));

  @override
  bool? get stringify => true;

  @override
  List<Object> get props {
    return [
      blockNumber,
      timeStamp,
      hash,
      nonce,
      blockHash,
      transactionIndex,
      from,
      to,
      value,
      gas,
      gasPrice,
      isError,
      txreceipt_status,
      input,
      contractAddress,
      cumulativeGasUsed,
      gasUsed,
      confirmations,
    ];
  }
}

class EtherScanKccTxListModel with EquatableMixin {
  final String status;
  final String message;
  final List<EtherScanKccTxResult>? result;
  EtherScanKccTxListModel({
    required this.status,
    required this.message,
    required this.result,
  });

  EtherScanKccTxListModel copyWith({
    String? status,
    String? message,
    List<EtherScanKccTxResult>? result,
  }) {
    return EtherScanKccTxListModel(
      status: status ?? this.status,
      message: message ?? this.message,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'result': result?.map((x) => x.toMap()).toList(),
    };
  }

  factory EtherScanKccTxListModel.empty() {
    return EtherScanKccTxListModel(
      status: 'empty',
      message: '',
      result: [],
    );
  }

  factory EtherScanKccTxListModel.kccFromMap(Map<String, dynamic> map) {
    return EtherScanKccTxListModel(
      status: map['code'].toString(),
      message: map['msg'],
      result: List<EtherScanKccTxResult>.from(
          map['data']?.map((x) => EtherScanKccTxResult.fromKccMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory EtherScanKccTxListModel.kccFromJson(String source) =>
      EtherScanKccTxListModel.kccFromMap(json.decode(source));

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [status, message, result ?? []];
}

class EtherScanKccTxResult with EquatableMixin {
  final String blockNumber;
  final String timeStamp;
  final String hash;
  final String nonce;
  final String blockHash;
  final String transactionIndex;
  final String from;
  final String to;
  final String value;
  final String gas;
  final String gasPrice;
  final String isError;
  final String txreceipt_status;
  final String input;
  final String contractAddress;
  final String cumulativeGasUsed;
  final String gasUsed;
  final String confirmations;
  final String callTransfer;
  final String tokenTransfer;
  EtherScanKccTxResult({
    required this.blockNumber,
    required this.timeStamp,
    required this.hash,
    required this.nonce,
    required this.blockHash,
    required this.transactionIndex,
    required this.from,
    required this.to,
    required this.value,
    required this.gas,
    required this.gasPrice,
    required this.isError,
    required this.txreceipt_status,
    required this.input,
    required this.contractAddress,
    required this.cumulativeGasUsed,
    required this.gasUsed,
    required this.confirmations,
    required this.callTransfer,
    required this.tokenTransfer,
  });

  EtherScanTxResult copyWith({
    String? blockNumber,
    String? timeStamp,
    String? hash,
    String? nonce,
    String? blockHash,
    String? transactionIndex,
    String? from,
    String? to,
    String? value,
    String? gas,
    String? gasPrice,
    String? isError,
    String? txreceipt_status,
    String? input,
    String? contractAddress,
    String? cumulativeGasUsed,
    String? gasUsed,
    String? confirmations,
  }) {
    return EtherScanTxResult(
      blockNumber: blockNumber ?? this.blockNumber,
      timeStamp: timeStamp ?? this.timeStamp,
      hash: hash ?? this.hash,
      nonce: nonce ?? this.nonce,
      blockHash: blockHash ?? this.blockHash,
      transactionIndex: transactionIndex ?? this.transactionIndex,
      from: from ?? this.from,
      to: to ?? this.to,
      value: value ?? this.value,
      gas: gas ?? this.gas,
      gasPrice: gasPrice ?? this.gasPrice,
      isError: isError ?? this.isError,
      txreceipt_status: txreceipt_status ?? this.txreceipt_status,
      input: input ?? this.input,
      contractAddress: contractAddress ?? this.contractAddress,
      cumulativeGasUsed: cumulativeGasUsed ?? this.cumulativeGasUsed,
      gasUsed: gasUsed ?? this.gasUsed,
      confirmations: confirmations ?? this.confirmations,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'blockNumber': blockNumber,
      'timeStamp': timeStamp,
      'hash': hash,
      'nonce': nonce,
      'blockHash': blockHash,
      'transactionIndex': transactionIndex,
      'from': from,
      'to': to,
      'value': value,
      'gas': gas,
      'gasPrice': gasPrice,
      'isError': isError,
      'txreceipt_status': txreceipt_status,
      'input': input,
      'contractAddress': contractAddress,
      'cumulativeGasUsed': cumulativeGasUsed,
      'gasUsed': gasUsed,
      'confirmations': confirmations,
    };
  }

  factory EtherScanKccTxResult.fromKccMap(Map<String, dynamic> map) {
    return EtherScanKccTxResult(
      tokenTransfer: jsonEncode(map['tokenTransfer'] ?? []),
      callTransfer: jsonEncode(map['callTransfer'] ?? []),
      blockNumber: map['block_no'].toString(),
      timeStamp: map['time'].toString(),
      hash: map['txid'],
      nonce: map['nonce'].toString(),
      blockHash: map['blockHash'].toString(), // kcc has no block hash
      transactionIndex: map['index'].toString(),
      from: map['from'],
      to: map['to'],
      value: (double.parse((map['value'] ?? '0')) * pow(10, 18))
          .toStringAsFixed(0),
      gas: map['gasUsed'].toString(),
      gasPrice: map['gasPrice'].toString(),
      isError: map['receiptErr'] ?? '0',
      txreceipt_status: map['receiptErr'] ?? '0', // kcc has no txreceipt_status
      input: map['input'].toString(), // kcc has no input
      contractAddress: map['toIsContract'] == 1 ? map['to'] : '',
      cumulativeGasUsed:
          map['cumulativeGasUsed'].toString(), // kcc has no txreceipt_status
      gasUsed: map['gasUsed'].toString(),
      confirmations:
          map['confirmations'].toString(), // kcc has no txreceipt_status
    );
  }

  String toJson() => json.encode(toMap());

  factory EtherScanKccTxResult.fromKccJson(String source) =>
      EtherScanKccTxResult.fromKccMap(json.decode(source));

  @override
  bool? get stringify => true;

  @override
  List<Object> get props {
    return [
      blockNumber,
      timeStamp,
      hash,
      nonce,
      blockHash,
      transactionIndex,
      from,
      to,
      value,
      gas,
      gasPrice,
      isError,
      txreceipt_status,
      input,
      contractAddress,
      cumulativeGasUsed,
      gasUsed,
      confirmations,
    ];
  }
}
