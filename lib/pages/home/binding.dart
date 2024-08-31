import 'package:get/get.dart';

import 'controller.dart';

class HomeBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Bind.lazyPut(() => HomeController())];
  }
}
