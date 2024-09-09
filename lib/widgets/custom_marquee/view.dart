import 'package:flutter/material.dart';

class CustomMarqueeComponent extends StatefulWidget {
  final List<String> texts;

  final TextStyle? textStyle;

  final MarqueeSpeed? marqueeSpeed;

  final double? spacing;

  const CustomMarqueeComponent({
    super.key,
    required this.texts,
    this.textStyle,
    this.marqueeSpeed,
    this.spacing,
  });

  @override
  State<CustomMarqueeComponent> createState() => _CustomMarqueeComponentState();
}

class _CustomMarqueeComponentState extends State<CustomMarqueeComponent>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late double _scrollPosition;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10), // 控制滚动速度
    );

    _scrollPosition = 0.0;

    _startScrolling();
  }

  void _startScrolling() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        _scrollController.jumpTo(0.0);
      }
    });

    _animationController.repeat(); // 重复滚动
    _animationController.addListener(() {
      if (_scrollController.position.maxScrollExtent > 0) {
        if (_scrollController.position.maxScrollExtent <
            _scrollController.position.pixels) {
          _scrollPosition = 0;
        }
        setState(() {
          _scrollPosition +=
              marqueeSpeedMap[widget.marqueeSpeed ?? MarqueeSpeed.normal]!;
          _scrollController.jumpTo(_scrollPosition); // 控制滚动位置
        });
      }
    });
  }

  List<Widget> textList(List<String> texts) {
    return texts.map((text) {
      return Padding(
        padding: EdgeInsets.only(right: widget.spacing ?? 30.0),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white)
              .merge(widget.textStyle ?? const TextStyle()),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        children: textList(widget.texts),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }
}

enum MarqueeSpeed {
  low,
  normal,
  quick,
}

Map<MarqueeSpeed, double> marqueeSpeedMap = {
  MarqueeSpeed.low: 0.5,
  MarqueeSpeed.normal: 1,
  MarqueeSpeed.quick: 1.5
};
