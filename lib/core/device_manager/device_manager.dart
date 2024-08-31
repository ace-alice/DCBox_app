abstract class DeviceManager {
  String get deviceType;

  Future<String> get deviceId;

  Future<String> get releaseType;

  Future<String> get getDeviceNme;
}
