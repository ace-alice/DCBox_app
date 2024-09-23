import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TextFormFieldOption {
  final GlobalKey<FormFieldState> formFieldKey = GlobalKey<FormFieldState>();

  final TextEditingController controller = TextEditingController();

  /// label
  final String? labelText;

  /// placeholder
  final String? hintText;

  final String? initialValue;

  final FocusNode? nextFocusNode;

  final focusNode = FocusNode();

  /// 是否是密码输入框
  final bool? isPassWord;

  /// 输入类型
  final TextInputType? keyboardType;

  String? Function(String?)? validator;

  final ValueChanged<String>? onChanged;

  RxBool validValue = true.obs;

  Function(String)? onFieldSubmitted;

  TextFormFieldOption({
    this.validator,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.isPassWord,
    this.keyboardType,
    this.onChanged,
    this.nextFocusNode,
    this.onFieldSubmitted,
  }) {
    if (validator != null) {
      validValue.value = false;
    }
    if (initialValue != null) {
      Future.delayed(const Duration(milliseconds: 100), () {
        controller.text = initialValue!;
      });
    }
  }
}
