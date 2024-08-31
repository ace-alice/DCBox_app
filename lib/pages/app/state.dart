import 'package:get/get.dart';

class AppState {
  RxInt pageIndex = 0.obs;

  RxString pageRoute = '/home'.obs;

  List<String> routes = ['/home', '/trade', '/order'];

  AppState() {
    ///Initialize variables
  }
}
