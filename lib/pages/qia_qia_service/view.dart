import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_web/view.dart';
import 'controller.dart';

class QiaQiaServicePage extends StatefulWidget {
  const QiaQiaServicePage({super.key});

  @override
  State<QiaQiaServicePage> createState() => _QiaQiaServicePageState();
}

class _QiaQiaServicePageState extends State<QiaQiaServicePage> {
  final controller = Get.put(QiaQiaServiceController());
  final state = Bind.find<QiaQiaServiceController>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 243, 245, 1), // 设置背景色为蓝灰色
      appBar: AppBar(
        title: const Text('恰恰客服'),
      ),
      body: Obx(
        () {
          return CustomWebComponent(
            initialUrl: state.serviceUrl.value,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    Bind.delete<QiaQiaServiceController>();
    super.dispose();
  }
}
