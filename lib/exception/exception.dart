import 'package:dc_box_app/core/user_manager/index.dart';
import 'package:get/get.dart';

import '../network/http/base_response.dart';

abstract class GkException implements Exception {}

class UatNetworkException implements GkException {
  @override
  String toString() => 'UAT api 只支援內網';
}

class GkServiceException implements GkException {
  static int get serviceErrorCode => 500;

  static int get serviceResetCode => 502;

  static GkServiceException? initFrom(int? code) {
    if (code == serviceErrorCode) {
      return GkServiceException();
    }
    if (code == serviceResetCode) {
      return GkServiceResetException();
    }
    return null;
  }
}

class GkTickOutException implements GkException {
  static String get tokenExpired => '1005';

  static String get loginAnotherDevice => '1006';

  static String get loginUnauthorized => '1010';

  static GkTickOutException initFrom(String code) {
    UserManager userManager = Get.find<UserManager>();

    userManager.setToken('');

    if (code == tokenExpired) {
      return GkTokenExpiredException();
    }
    if (code == loginAnotherDevice) {
      return GkLoginAnotherDeviceException();
    }
    if (code == loginUnauthorized) {
      return GkLoginUnauthorizedException();
    }
    return GkTickOutException();
  }

  @override
  String toString() => 'GkTickOutException';
}

class GkTokenExpiredException implements GkTickOutException {
  GkTokenExpiredException();

  @override
  String toString() => 'GkTokenExpiredException';
}

class GkLoginAnotherDeviceException implements GkTickOutException {
  GkLoginAnotherDeviceException();

  @override
  String toString() => 'GkLoginAnotherDeviceException';
}

class GkLoginUnauthorizedException implements GkTickOutException {
  GkLoginUnauthorizedException();

  @override
  String toString() => 'GkLoginUnauthorizedException';
}

class GkServiceResetException implements GkServiceException {
  @override
  String toString() => 'TrKey.errorServiceReset.tr';
}

class MockNetworkException implements GkException {
  @override
  String toString() => 'Mock api 錯誤模擬';
}

class DecoderException implements GkException {
  final dynamic data;
  final dynamic object;

  DecoderException(this.data, this.object);

  @override
  String toString() {
    return 'TrKey.errorDecodeDataFormat.tr';
  }
}

class GKpocketException implements GkException {
  final HeaderResponse header;
  final dynamic body;

  GKpocketException(
    this.header,
    this.body,
  );

  @override
  String toString() => header.message;
}

class CompressException implements GkException {
  CompressException();

  @override
  String toString() => 'TrKey.compressionFailed.tr';
}

class CommonException implements GkException {
  final String message;

  CommonException(this.message);

  @override
  String toString() => message;
}
