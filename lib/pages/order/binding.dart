import 'package:get/get.dart';

import 'controller.dart';

class OrderBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Bind.lazyPut(() => OrderController())];
  }
}
