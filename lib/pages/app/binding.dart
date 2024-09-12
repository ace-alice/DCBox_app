import 'package:dc_box_app/pages/home/binding.dart';
import 'package:dc_box_app/pages/order/binding.dart';
import 'package:dc_box_app/pages/trade/binding.dart';
import 'package:get/get.dart';

import '../../core/user_manager/state.dart';
import 'controller.dart';

class AppBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<UserState>(() => UserState()),
      Bind.lazyPut(() =>
          AppController(countryManager: Bind.find(), userState: Get.find())),
      ...HomeBinding().dependencies(),
      ...TradeBinding().dependencies(),
      ...OrderBinding().dependencies(),
    ];
  }
}
