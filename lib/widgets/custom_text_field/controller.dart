import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'state.dart';

class CustomTextFieldController extends GetxController {
  final CustomTextFieldState state = CustomTextFieldState();

  final FocusNode focusNode = FocusNode();
}
