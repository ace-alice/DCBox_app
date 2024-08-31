import 'package:get/get.dart';

import 'controller.dart';

class TradeBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Bind.lazyPut(() => TradeController())];
  }
}
