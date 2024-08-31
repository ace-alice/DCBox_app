import 'package:get/get.dart';

import 'controller.dart';

class QiaQiaServiceBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Bind.lazyPut(() => QiaQiaServiceController())];
  }
}
