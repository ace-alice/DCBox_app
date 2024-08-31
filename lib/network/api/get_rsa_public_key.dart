import 'package:basic_utils/basic_utils.dart';

import '../../../common/app_logger.dart';
import '../http/aes_http_manager.dart';
import '../http/base_res_data.dart';
import '../http/base_response.dart';

class GetRsaPublicKey
    extends AesHttpManager<RsaPublicKeyResponse, AesPublicKeyResData> {
  GetRsaPublicKey({required super.deviceManager, required super.langManager});

  @override
  bool get isNotAes => false;

  @override
  String get path => 'gw/p1';

  @override
  RsaPublicKeyResponse getResBodyFromDecodeResponse(data) {
    return jsonBodyDecoder(data);
  }

  @override
  RsaPublicKeyResponse jsonBodyDecoder(data) {
    return RsaPublicKeyResponse.decode(data);
  }
}

class RsaPublicKeyResponse extends AppResponse {
  final RSAPublicKey key;

  RsaPublicKeyResponse(this.key);

  factory RsaPublicKeyResponse.decode(dynamic data) {
    try {
      final key = CryptoUtils.rsaPublicKeyFromDERBytes(data);
      logger.d('RsaPublicKeyResponse => $key');
      return RsaPublicKeyResponse(key);
    } catch (e) {
      rethrow;
    }
  }
}

class AesPublicKeyResData extends BaseResData {
  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}
