import '../../utils/encrypt.dart';

class EncryptState {
  String serviceAesKey = '';
  EncryptState() {
    ///Initialize variables
    if (!hasExpired) {
      serviceAesKey = getAesKeyFormStorage ?? '';
    }
  }
}
