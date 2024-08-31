import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../common/app_logger.dart';
import 'controller.dart';
import 'qr_animation.dart';

class MobileScannerComponent extends StatelessWidget {
  final double height;
  final double width;

  MobileScannerComponent(
      {super.key, required this.height, required this.width});

  final MobileScannerController cameraController = MobileScannerController();
  final controller = Get.put(MobileScanController());
  final state = Bind.find<MobileScanController>().state;

  @override
  Widget build(BuildContext context) {
    return QrAnimation(
      height: height,
      width: width,
      child: SizedBox(
        height: height,
        width: width,
        child: MobileScanner(
          controller: cameraController,
          onDetect: (BarcodeCapture barcode) {
            final List<Barcode> codes = barcode.barcodes;
            logger.d('Scanned code: $codes');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Scanned: $codes')),
            );
          },
        ),
      ),
    );
  }
}

class ScannerPainter extends CustomPainter {
  final Animation<double> animation;

  ScannerPainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4.0;

    final linePosition = size.height * animation.value;

    canvas.drawLine(
      Offset(0, linePosition),
      Offset(size.width, linePosition),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
