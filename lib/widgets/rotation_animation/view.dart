import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RotationAnimationComponent extends StatefulWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Decoration? decoration;
  final Duration? duration;
  final RxBool loading;

  const RotationAnimationComponent(
      {super.key,
      required this.child,
      this.height,
      this.width,
      this.duration,
      this.decoration,
      required this.loading});

  @override
  _RotationAnimationState createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimationComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // 初始化 AnimationController
    _controller = AnimationController(
      duration: widget.duration ?? const Duration(seconds: 1),
      vsync: this,
    ); // 默认开始时重复播放动画

    widget.loading.value ? _start() : _done();

    ever(widget.loading, (bool val) {
      val ? _start() : _done();
    });
  }

  _start() {
    _controller.repeat();
  }

  _done() {
    _controller.stop();
    _controller.reset();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: widget.decoration,
        child: widget.child,
      ),
    );
  }
}
