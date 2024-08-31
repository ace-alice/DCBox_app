import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final state = Bind.find<OrderController>().state;

    return const Text('order');
  }
}
