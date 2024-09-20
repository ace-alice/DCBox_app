import 'package:get/get.dart';

import 'controller.dart';

class PersonalBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Bind.lazyPut(() => PersonalController())];
  }
}
