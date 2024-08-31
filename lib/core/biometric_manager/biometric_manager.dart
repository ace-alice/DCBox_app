import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricManager {
  static Future<bool> isSupportedBiometric() async {
    try {
      LocalAuthentication localAuthentication = LocalAuthentication();
      final bool canAuthenticateWithBiometrics =
          await localAuthentication.canCheckBiometrics;
      final bool canAuthenticate = canAuthenticateWithBiometrics ||
          await localAuthentication.isDeviceSupported();
      return canAuthenticate;
    } catch (_) {
      return false;
    }
  }

  static Future<List<BiometricType>> supportBiometricType() async {
    try {
      LocalAuthentication localAuthentication = LocalAuthentication();
      final List<BiometricType> availableBiometrics =
          await localAuthentication.getAvailableBiometrics();
      return availableBiometrics;
    } on PlatformException catch (_) {
      return [];
    }
  }

  static Future<bool> invokeBiometricAuth([bool biometricOnly = false]) async {
    try {
      LocalAuthentication localAuthentication = LocalAuthentication();
      final bool didAuthenticate = await localAuthentication.authenticate(
          localizedReason: '解锁应用',
          options: AuthenticationOptions(
            useErrorDialogs: false,
            biometricOnly: biometricOnly,
          ));
      return didAuthenticate;
    } on PlatformException catch (e) {
      // if (e.code == auth_error.notAvailable) {
      //   // Add handling of no hardware here.
      // } else if (e.code == auth_error.notEnrolled) {
      //   // ...
      // } else {
      //   // ...
      // }
      return false;
    }
  }
}
