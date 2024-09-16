import 'package:get/get.dart';

import '../../common/zip_types.dart';

class SliderVerifyController extends GetxController {
  final ZipType zipType;

  late Function showDialog;

  SliderVerifyController({required this.zipType});

  RxDouble slideValue = 0.0.obs;
}
