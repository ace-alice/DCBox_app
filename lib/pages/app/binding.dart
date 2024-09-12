import 'package:get/get.dart';

import '../../core/user_manager/state.dart';
import '../../pages/home/binding.dart';
import '../../pages/order/binding.dart';
import '../../pages/trade/binding.dart';
import 'controller.dart';

class AppBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<UserState>(() => UserState()),
      Bind.lazyPut(() => AppController(
            countryManager: Bind.find(),
            userState: Bind.find(),
          )),
      ...HomeBinding().dependencies(),
      ...TradeBinding().dependencies(),
      ...OrderBinding().dependencies(),
    ];
  }
}
