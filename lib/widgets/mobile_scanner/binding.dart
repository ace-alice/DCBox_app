import 'package:get/get.dart';

import 'controller.dart';

class MobileScannerBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Bind.lazyPut(() => MobileScanController())];
  }
}
