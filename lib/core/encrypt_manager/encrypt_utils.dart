import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/storage_key.dart';

class EncryptUtils {
  static dynamic decrypt({
    required Uint8List responseBody,
    required bool isShowLog,
  }) {
    final base64Encoder = const Base64Encoder().convert(responseBody);
    String? serviceAesKey = GetStorage().read(StorageKey.serviceAesKey);
    final key = Key.fromUtf8(serviceAesKey ?? '');
    final iv = IV.fromUtf8('');
    final encrypt = Encrypter(AES(
      key,
      mode: AESMode.ecb,
    ));
    final decryptString = encrypt.decrypt(
      Encrypted.fromBase64(base64Encoder),
      iv: iv,
    );
    final jsonDecodeJson = jsonDecode(decryptString);
    return jsonDecodeJson;
  }

  static Uint8List encrypt({required String apiBody}) {
    String? serviceAesKey = GetStorage().read(StorageKey.serviceAesKey);
    final key = Key.fromUtf8(serviceAesKey ?? '123');
    final iv = IV.fromUtf8('');
    final encrypt = Encrypter(AES(
      key,
      mode: AESMode.ecb,
    ));
    final aesEncryptedByteBody = encrypt
        .encrypt(
          apiBody,
          iv: iv,
        )
        .bytes;
    return aesEncryptedByteBody;
  }
}
