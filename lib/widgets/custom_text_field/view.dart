import 'package:dc_box_app/generated/app_image/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import '../../common/text_form_field_option.dart';
import 'controller.dart';

class CustomTextFieldComponent extends StatelessWidget {
  final controller = CustomTextFieldController();

  final TextFormFieldOption textFormFieldOption;

  /// 右侧组件
  final Widget? prefixWidget;

  CustomTextFieldComponent(
      {super.key, this.prefixWidget, required this.textFormFieldOption}) {
    if (textFormFieldOption.isPassWord != null) {
      controller.state.obscureText.value = textFormFieldOption.isPassWord!;
    }
    textFormFieldOption.focusNode.addListener(
      () {
        if (!textFormFieldOption.focusNode.hasFocus) {
          // 当用户按下 "下一步" 键时，焦点移动到下一个输入框
          if (textFormFieldOption.validator != null) {
            textFormFieldOption.validValue.value =
                textFormFieldOption.formFieldKey.currentState!.validate();
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (textFormFieldOption.initialValue != null) {
      Future.delayed(const Duration(milliseconds: 500), () {
        textFormFieldOption.validValue.value =
            textFormFieldOption.formFieldKey.currentState!.validate();
      });
    }
    return Obx(() {
      return SizedBox(
        height: textFormFieldOption.validator == null ? 80 : 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textFormFieldOption.labelText == null
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      textFormFieldOption.labelText!,
                      style: const TextStyle(
                          color: AppColor.text999999,
                          fontSize: 13,
                          height: 1.25),
                    ),
                  ),
            SizedBox(
              // height: 44,
              child: TextFormField(
                key: textFormFieldOption.formFieldKey,
                keyboardType:
                    textFormFieldOption.keyboardType ?? TextInputType.text,
                controller: textFormFieldOption.controller,
                // initialValue: textFormFieldOption.initialValue,
                obscureText: controller.state.obscureText.value,
                focusNode: textFormFieldOption.focusNode,
                autovalidateMode: AutovalidateMode.disabled,
                style:
                    const TextStyle(color: AppColor.textFFFFFF, fontSize: 13),
                validator: textFormFieldOption.validator,
                decoration: InputDecoration(
                  isDense: true,
                  // labelText: '请输入文本', // 标签文字
                  hintText: textFormFieldOption.hintText ?? '',
                  // 提示文字
                  focusColor: AppColor.text999999,
                  prefixIcon: prefixWidget ?? prefixWidget,
                  suffixIcon: textFormFieldOption.isPassWord != null &&
                          textFormFieldOption.isPassWord!
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.brand62A2B0),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(233, 67, 67, 1)),
                  ),
                ),
                onFieldSubmitted: (value) {
                  // 当用户按下 "下一步" 键时，焦点移动到下一个输入框
                  bool pass = true;
                  if (textFormFieldOption.nextFocusNode != null) {
                    FocusScope.of(context)
                        .requestFocus(textFormFieldOption.nextFocusNode);
                  }
                  if (textFormFieldOption.onFieldSubmitted != null) {
                    textFormFieldOption.onFieldSubmitted!(value);
                  }
                },
                onChanged: (text) {
                  if (textFormFieldOption.onChanged != null) {
                    textFormFieldOption.onChanged!(text); // 监听输入变化
                  }
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
