import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/app_logger.dart';
import '../../common/storage_key.dart';
import '../../exception/exception.dart';
import '../../network/api/get_aes_private_key.dart';
import '../../network/api/get_rsa_public_key.dart';
import 'encrypt_manager.dart';
import 'state.dart';

class EncryptManagerImpl extends GetxController
    implements EncryptManager<EncryptState> {
  final GetRsaPublicKey _getRsaPublicKey;

  final GetAesPrivateKey _getAesPrivateKey;

  EncryptManagerImpl(
      {required GetRsaPublicKey getRsaPublicKey,
      required GetAesPrivateKey getAesPrivateKey})
      : _getRsaPublicKey = getRsaPublicKey,
        _getAesPrivateKey = getAesPrivateKey;

  @override
  Future<bool> init(String baseUrl) async {
    if (state.serviceAesKey.isNotEmpty) {
      return true;
    }
    try {
      final result =
          await _getRsaPublicKey.request(AesPublicKeyResData(), baseUrl);
      final servicePublicKey = result.key;
      final appKey = CryptoUtils.generateRSAKeyPair(keySize: 1024);
      final publicKey = appKey.publicKey as RSAPublicKey;
      final privateKey = appKey.privateKey as RSAPrivateKey;
      final publicPem = CryptoUtils.encodeRSAPublicKeyToPem(publicKey);
      final serviceEncrypt = Encrypter(RSA(publicKey: servicePublicKey));
      final encryptPublicPem = await encodeString(publicPem, serviceEncrypt);
      final byte = const Base64Decoder().convert(encryptPublicPem);

      final aesResponse =
          await _getAesPrivateKey.request(AesPrivateKeyResData(byte), baseUrl);
      final aesEncryptKey = const Base64Encoder().convert(aesResponse.key);
      // print('aesEncryptKey = $aesEncryptKey');
      final encrypt = Encrypter(RSA(privateKey: privateKey));
      final aesKey = encrypt.decrypt64(aesEncryptKey);
      // print('aesKey = $aesKey');
      state.serviceAesKey = aesKey;
      await GetStorage().write(StorageKey.serviceAesKey, aesKey);
    } on GkException catch (e) {
      logger.d(e.toString());
      return false;
    } catch (e) {
      return false;
    }
    return true;
  }

  @override
  EncryptState state = EncryptState();
}

Future<String> encodeString(
  String content,
  Encrypter encrypt,
) async {
  List<int> sourceBytes = utf8.encode(content);
  int inputLen = sourceBytes.length;
  int maxLen = 117;
  List<int> totalBytes = <int>[];
  for (var i = 0; i < inputLen; i += maxLen) {
    int endLen = inputLen - i;
    List<int> item;
    if (endLen > maxLen) {
      item = sourceBytes.sublist(i, i + maxLen);
    } else {
      item = sourceBytes.sublist(i, i + endLen);
    }
    totalBytes.addAll(encrypt.encryptBytes(item).bytes);
  }
  return base64.encode(totalBytes);
}
