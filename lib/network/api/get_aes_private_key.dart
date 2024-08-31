import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../http/aes_http_manager.dart';
import '../http/base_res_data.dart';
import '../http/base_response.dart';

class GetAesPrivateKey
    extends AesHttpManager<AesPrivateKeyResponse, AesPrivateKeyResData> {
  GetAesPrivateKey({required super.deviceManager, required super.langManager});

  @override
  bool get isNotAes => false;

  @override
  String get path => 'gw/p2';

  @override
  AesPrivateKeyResponse getResBodyFromDecodeResponse(data) {
    return jsonBodyDecoder(data);
  }

  @override
  AesPrivateKeyResponse jsonBodyDecoder(data) {
    return AesPrivateKeyResponse.decode(data);
  }

  @override
  Future<AesPrivateKeyResponse> request(
      AesPrivateKeyResData data, String baseUrl) async {
    try {
      Dio dio = await init(baseUrl);
      final response = await dio.request(
        path,
        data: Stream.fromIterable(data.data.map((e) => [e])),
        options: Options(method: method.name, headers: {
          HttpHeaders.contentLengthHeader: ((data.data) as Uint8List).length
        }),
      );
      return getResBodyFromDecodeResponse(response.data);
    } on DioException catch (e) {
      rethrow;
    }
  }
}

class AesPrivateKeyResponse extends AppResponse {
  final dynamic key;

  AesPrivateKeyResponse(this.key);

  factory AesPrivateKeyResponse.decode(dynamic data) {
    return AesPrivateKeyResponse(data);
  }
}

class AesPrivateKeyResData extends BaseResData {
  final Uint8List data;

  AesPrivateKeyResData(
    this.data,
  );

  @override
  Map<String, Uint8List> toMap() {
    return {'data': data};
  }
}
