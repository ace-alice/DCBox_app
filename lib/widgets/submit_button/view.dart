import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import '../../common/app_styles.dart';
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
          gradient: loading != null && loading!.value
              ? AppStyles.btnGradient(opacity: 0.7)
              : AppStyles.btnGradient(opacity: 1),

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
