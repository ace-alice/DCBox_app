import 'package:dc_box_app/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SubmitButtonComponent extends StatelessWidget {
  final controller = SubmitButtonController();

  final VoidCallback onPressed;
  final String text;
  final RxBool? loading;
  final RxBool? disabled;

  SubmitButtonComponent({
    super.key,
    required this.onPressed,
    required this.text,
    this.loading,
    this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromRGBO(98, 162, 176, 1)
                  .withOpacity(loading != null && loading!.value ? 0.7 : 1),
              const Color.fromRGBO(145, 201, 214, 1)
                  .withOpacity(loading != null && loading!.value ? 0.7 : 1)
            ], // 渐变颜色
            begin: Alignment.topLeft, // 渐变的起点
            end: Alignment.bottomRight, // 渐变的终点
          ),
          borderRadius: BorderRadius.circular(20), // 圆角
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
            backgroundColor: disabled != null && disabled!.value
                ? const Color.fromRGBO(56, 56, 56, 1)
                : Colors.transparent,
            shadowColor: Colors.transparent, // 去掉阴影
          ),
          onPressed: onPressed,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                left: 0,
                child: Container(
                  margin: const EdgeInsets.only(right: 6),
                  height: 14,
                  width: 14,
                  child: loading != null && loading!.value
                      ? const CircularProgressIndicator(
                          strokeWidth: 2,
                          backgroundColor: AppColor.backdrop4C6D778B,
                          color: AppColor.border80FFFFFF,
                        )
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white, // 按钮文字颜色
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
