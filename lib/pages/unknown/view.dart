import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UnknownController>();
    final state = Get.find<UnknownController>().state;

    return Container();
  }
}
