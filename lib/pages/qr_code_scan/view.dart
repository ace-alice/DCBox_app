import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import '../../widgets/mobile_scanner/view.dart';
import 'controller.dart';
import 'widgets/select_image_widget.dart';

class QRCodeScanPage extends StatelessWidget {
  const QRCodeScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QRCodeScanController());
    final state = Bind.find<QRCodeScanController>().state;

    return Scaffold(
      backgroundColor: AppColor.backdrop222222, // 设置背景色为蓝灰色
      appBar: AppBar(
        backgroundColor: AppColor.backdrop222222,
        foregroundColor: AppColor.textFFFFFF,
        title: const Text('二维码扫描'),
        actions: [selectImageWidget()],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: MobileScannerComponent(
              height: 240.0,
              width: 240.0,
            ),
          )
        ],
      ),
    );
  }
}
