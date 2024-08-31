import 'package:get/get.dart';

import 'controller.dart';

class GuideBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Bind.lazyPut(() => GuideController())];
  }
}
