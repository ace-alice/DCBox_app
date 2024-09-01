import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class TradePage extends StatelessWidget {
  const TradePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TradeController());
    final state = Bind.find<TradeController>().state;

    return const Text('trade');
  }
}
