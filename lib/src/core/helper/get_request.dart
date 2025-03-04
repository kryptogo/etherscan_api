import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:etherscan_api/etherscan_api.dart';
import 'package:etherscan_api/src/core/utils/logger.dart';

const ETH_API_URLS = {
  'mainnet': 'https://api.etherscan.io',
  'ropsten': 'https://api-ropsten.etherscan.io',
  'kovan': 'https://api-kovan.etherscan.io',
  'rinkeby': 'https://api-rinkeby.etherscan.io',
  'homestead': 'https://api.etherscan.io',
  'polygon': 'https://api.polygonscan.com',
  'kcc': 'https://api.explorer.kcc.io',
  'arbitrum': 'https://api.arbiscan.io',
  'ronin': 'https://api.roninchain.com',
};

extension GetRequest on EtherscanAPI {
  Future<Either<EtherScanFailure, String>> getWithPath<T>(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    try {
      if (enableLogs == true) {
        // Log data response
        print('api_url: ${chain.chainApiUrl}/$path\n');
        print('query: ${stringifyMessage(query)}\n');
      }

      /// Dio client
      final client = Dio(
        BaseOptions(
          baseUrl: chain.chainApiUrl,
          connectTimeout: timeout?.inMilliseconds,
          responseType: ResponseType.json,
        ),
      );

      /// Make Request
      final res = await client.get(path, queryParameters: query);

      /// Return Error if data is null
      if (res.data == null || res.data['code'] != 1) {
        if (enableLogs == true) {
          // Log error response
          print('Error: Null Response\n');
        }
        return Left(EtherScanFailure(message: 'Null Response'));
      }

      var status = res.data['status'];
      if (status != null && status != '1' || '${res.data}'.contains('error')) {
        if (enableLogs == true) {
          // Log error response
          print('Error: ${res.data}');
        }

        return Left(EtherScanFailure(message: '${res.data}'));
      }

      if (enableLogs == true) {
        // Log success response
        print('response: ${stringifyMessage(res.data)}\n');
      }
      return Right(json.encode(res.data));
    } catch (e) {
      var msg = e.toString();

      if (enableLogs == true) {
        /// Log error response
        print('Error: $msg');
      }
      return Left(EtherScanFailure(message: msg));
    }
  }

  /// Runs query
  /// returns [Future<Either<EtherScanFailure, String>>]
  Future<Either<EtherScanFailure, String>> get<T>(
    Map<String, dynamic>? query,
  ) async {
    try {
      if (enableLogs == true) {
        // Log data response
        print('api_url: ${chain.chainApiUrl}\n');
        print('query: ${stringifyMessage(query)}\n');
      }

      /// Dio client
      final client = Dio(
        BaseOptions(
          baseUrl: chain.chainApiUrl,
          connectTimeout: timeout?.inMilliseconds,
          responseType: ResponseType.json,
        ),
      );

      /// Make Request
      final res = await client.get('/api', queryParameters: query);

      /// Return Error if data is null
      if (res.data == null) {
        if (enableLogs == true) {
          // Log error response
          print('Error: Null Response\n');
        }
        return Left(EtherScanFailure(message: 'Null Response'));
      }

      var status = res.data['status'];
      if (status != null && status != '1' || '${res.data}'.contains('error')) {
        if (enableLogs == true) {
          // Log error response
          print('Error: ${res.data}');
        }

        return Left(EtherScanFailure(message: '${res.data}'));
      }

      if (enableLogs == true) {
        // Log success response
        print('response: ${stringifyMessage(res.data)}\n');
      }
      return Right(json.encode(res.data));
    } catch (e) {
      var msg = e.toString();

      if (enableLogs == true) {
        /// Log error response
        print('Error: $msg');
      }
      return Left(EtherScanFailure(message: msg));
    }
  }

  Future<Either<EtherScanFailure, String>> postRpc<T>(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    try {
      if (enableLogs == true) {
        // Log data response
        print('api_url: ${chain.chainApiUrl}$path\n');
        print('query: ${stringifyMessage(data)}\n');
      }

      /// Dio client
      final client = Dio(
        BaseOptions(
          baseUrl: chain.chainApiUrl,
          connectTimeout: timeout?.inMilliseconds,
          responseType: ResponseType.json,
        ),
      );

      /// Make Request
      final res = await client.post(path, data: data);

      /// Return Error if data is null
      if (res.data == null || res.data == '') {
        if (enableLogs == true) {
          // Log error response
          print('Error: Null Response\n');
        }
        return Left(EtherScanFailure(message: 'Null Response'));
      }

      if ('${res.data}'.contains('error')) {
        if (enableLogs == true) {
          // Log error response
          print('Error: ${res.data['error']}');
        }

        return Left(
            EtherScanFailure(message: '${res.data['error']['message']}'));
      }

      if (enableLogs == true) {
        // Log success response
        print('response: ${stringifyMessage(res.data)}\n');
      }
      return Right(json.encode(res.data));
    } catch (e) {
      var msg = e.toString();

      if (enableLogs == true) {
        /// Log error response
        print('Error: $msg');
      }
      return Left(EtherScanFailure(message: msg));
    }
  }
}
