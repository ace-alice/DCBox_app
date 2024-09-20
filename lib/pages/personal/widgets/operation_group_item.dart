import 'package:dc_box_app/common/app_color.dart';
import 'package:flutter/material.dart';

class OperationGroupItem extends StatelessWidget {
  final bool hasBorder;

  final RadiusLocation radiusLocation;

  final Widget icon;

  final String text;

  final void Function() onClick;

  OperationGroupItem({
    this.hasBorder = true,
    this.radiusLocation = RadiusLocation.none,
    required this.icon,
    required this.text,
    required this.onClick,
  });

  BorderRadius? get radius {
    switch (radiusLocation) {
      case RadiusLocation.top:
        return const BorderRadius.vertical(top: Radius.circular(10));
      case RadiusLocation.all:
        return const BorderRadius.all(Radius.circular(10));
      case RadiusLocation.bottom:
        return const BorderRadius.vertical(bottom: Radius.circular(10));
      case RadiusLocation.none:
        return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: radius,
      child: Ink(
        width: double.infinity,
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColor.backdrop222222,
          borderRadius: radius,
          border: hasBorder
              ? const Border(
                  bottom: BorderSide(
                    color: AppColor.border4C6D778B,
                    width: 0.5,
                  ),
                )
              : null,
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
            const Expanded(child: SizedBox.shrink()),
            const Icon(Icons.chevron_right, color: AppColor.textFFFFFF)
          ],
        ),
      ),
    );
  }
}

enum RadiusLocation { top, all, bottom, none }
