import 'package:get/get.dart';

import 'controller.dart';

class LoginBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Bind.lazyPut(() => LoginController())];
  }
}
