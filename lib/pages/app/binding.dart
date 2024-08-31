import 'package:get/get.dart';

import 'controller.dart';

class AppBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Bind.lazyPut(() => AppController())];
  }
}
