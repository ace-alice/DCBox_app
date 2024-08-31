import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/storage_key.dart';
import '../../../../router/app_routes.dart';
import 'controller.dart';

class PageContentComponent extends StatefulWidget {
  const PageContentComponent({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
  });

  final String title;
  final Widget icon;
  final String description;

  @override
  State<PageContentComponent> createState() => _PageContentComponentState();
}

class _PageContentComponentState extends State<PageContentComponent> {
  final controller = Get.put(PageContentController());

  @override
  void initState() {
    super.initState();
  }

  void nextPressed() {
    GetStorage().write(StorageKey.hasGuide, 'true');
    Get.toNamed(AppRoutes.welcome);
  }

  bool get isSmallScreen => MediaQuery.of(context).size.height < 800;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: isSmallScreen
              ? const EdgeInsets.fromLTRB(24, 50, 24, 12)
              : const EdgeInsets.fromLTRB(24, 127, 24, 50),
          child: SizedBox(
            child: widget.icon,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0),
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF20BCFF),
                    Color(0xFF118FFF),
                  ]).createShader(bounds);
            },
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 23),
          child: Text(
            widget.description,
            style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xFF6A6A6A),
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: SizedBox(
            width: 175,
            height: 44,
            child: OutlinedButton(
              onPressed: nextPressed,
              style: OutlinedButton.styleFrom(
                // 设置边框颜色和宽度
                side: const BorderSide(color: Color(0xFF0052E2), width: 1),
                padding: EdgeInsets.zero,
              ),
              child: const Text(
                '立即体验',
                style: TextStyle(
                    color: Color.fromRGBO(0, 82, 226, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    Bind.delete<PageContentController>();
    super.dispose();
  }
}
