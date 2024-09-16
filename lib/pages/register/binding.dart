import 'package:get/get.dart';

import 'controller.dart';

class RegisterBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Bind.lazyPut(() => RegisterController())];
  }
}
