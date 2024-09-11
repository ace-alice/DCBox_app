import 'package:dc_box_app/generated/app_image/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import 'controller.dart';

class CustomTextFieldComponent extends StatelessWidget {
  final controller = CustomTextFieldController();

  /// label
  final String? labelText;

  /// placeholder
  final String? hintText;

  /// 初始值
  final String? initialValue;

  /// 控制器
  final TextEditingController? fieldController;

  /// 是否是密码输入框
  final bool? isPassWord;

  /// 输入类型
  final TextInputType? keyboardType;

  /// 右侧组件
  final Widget? prefixWidget;

  final ValueChanged<String>? onChanged;

  CustomTextFieldComponent(
      {super.key,
      this.labelText,
      this.hintText,
      this.initialValue,
      this.fieldController,
      this.isPassWord,
      this.keyboardType,
      this.prefixWidget,
      this.onChanged}) {
    if (isPassWord != null) {
      controller.state.obscureText.value = isPassWord!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText == null
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    labelText!,
                    style: const TextStyle(
                        color: AppColor.text999999, fontSize: 13, height: 1.25),
                  ),
                ),
          SizedBox(
            height: 44,
            child: TextFormField(
              keyboardType: keyboardType ?? TextInputType.text,
              controller: fieldController,
              initialValue: initialValue,
              obscureText: controller.state.obscureText.value,
              focusNode: controller.focusNode,
              style: const TextStyle(color: AppColor.textFFFFFF, fontSize: 13),
              decoration: InputDecoration(
                // labelText: '请输入文本', // 标签文字
                hintText: hintText ?? '',
                // 提示文字
                focusColor: AppColor.text999999,
                prefixIcon: prefixWidget ?? prefixWidget,
                suffixIcon: isPassWord != null && isPassWord!
                    ? GestureDetector(
                        onTap: () {
                          controller.state.obscureText.value =
                              !controller.state.obscureText.value;
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: controller.state.obscureText.value
                              ? AppImage.common
                                  .icEyeClose(width: 16, height: 16)
                              : AppImage.common
                                  .icEyeOpen(width: 16, height: 16),
                        ))
                    : const SizedBox.shrink(),
                suffixIconConstraints: const BoxConstraints(maxHeight: 16),
                hintStyle:
                    const TextStyle(color: AppColor.text999999, fontSize: 13),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.brand62A2B0),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(233, 67, 67, 1)),
                ),
              ),
              onChanged: (text) {
                onChanged!(text); // 监听输入变化
              },
            ),
          )
        ],
      );
    });
  }
}
