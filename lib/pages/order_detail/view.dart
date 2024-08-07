import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrderDetailController>();
    final state = Get.find<OrderDetailController>().state;

    return Container();
  }
}
