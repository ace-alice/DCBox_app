import 'package:get/get.dart';

class WelcomeState {
  final Rx<LoadStatus> loadingStatus = LoadStatus.loading.obs;

  WelcomeState() {
    ///Initialize variables
  }
}

enum LoadStatus {
  success,
  fail,
  loading,
}
