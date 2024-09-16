import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ImageThumbShape extends SliderComponentShape {
  final double thumbRadius;

  final ui.Image? image;

  ImageThumbShape({required this.thumbRadius, this.image});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbRadius * 2, thumbRadius * 2);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    if (image != null) {
      final double imageSize = thumbRadius * 2;
      final Rect imageRect = Rect.fromCenter(
        center: center,
        width: imageSize,
        height: imageSize,
      );
      paintImage(
        canvas: canvas,
        rect: imageRect,
        image: image!,
        fit: BoxFit.cover,
      );
    } else {
      final Paint paint = Paint()
        ..color = sliderTheme.thumbColor ?? Colors.blue
        ..style = PaintingStyle.fill;

      canvas.drawCircle(center, thumbRadius, paint);
    }
  }
}
