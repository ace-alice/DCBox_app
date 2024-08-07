import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrderListController>();
    final state = Get.find<OrderListController>().state;

    return Container();
  }
}
