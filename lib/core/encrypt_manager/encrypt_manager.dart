import 'package:get/get.dart';

abstract class EncryptManager<T> extends GetxController {
  late T state;

  Future<bool> init(String baseUrl);
}
