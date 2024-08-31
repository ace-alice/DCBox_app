import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final state = Bind.find<HomeController>().state;

    return const Text('home');
  }
}
