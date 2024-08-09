import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/utils/app_logger.dart';
import '../../common/utils/storage_key.dart';
import './setup_encrypt.dart';

class EncryptManager {
  final AppLogger _appLogger = Get.find<AppLogger>();

  late final String _serviceAesKey;

  final SetupEncrypt _setupEncrypt;

  EncryptManager({
    required GetStorage getStorage,
    required SetupEncrypt setupEncrypt,
  })  : _setupEncrypt = setupEncrypt,
        _serviceAesKey = getStorage.read(StorageKey.serviceAesKey) ?? '';

  onInit() {
    _setupEncrypt.listenAesKey((value) {
      if (value != null && value.isNotEmpty) {
        _serviceAesKey = value;
      }
    });
    _appLogger.info('_serviceAesKey: $_serviceAesKey');
  }

  dynamic decrypt({
    required Uint8List responseBody,
    required bool isShowLog,
  }) {
    final base64Encoder = const Base64Encoder().convert(responseBody);

    final key = Key.fromUtf8(_serviceAesKey);
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
    if (isShowLog) {
      _appLogger.info('jsonDecodeJson = $jsonDecodeJson');
    }
    return jsonDecodeJson;
  }

  Uint8List encrypt({required String apiBody}) {
    final key = Key.fromUtf8(_serviceAesKey);
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
