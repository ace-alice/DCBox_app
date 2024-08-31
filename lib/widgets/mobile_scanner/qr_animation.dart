import 'package:flutter/material.dart';

import '../../widgets/mobile_scanner/view.dart';

class QrAnimation extends StatefulWidget {
  final double height;
  final double width;
  final Widget child;

  const QrAnimation(
      {super.key,
      required this.height,
      required this.width,
      required this.child});

  @override
  _QrAnimationState createState() => _QrAnimationState();
}

class _QrAnimationState extends State<QrAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // 初始化动画控制器
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: ScannerPainter(animation: _animation),
        child: Stack(
          children: [
            widget.child,
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
