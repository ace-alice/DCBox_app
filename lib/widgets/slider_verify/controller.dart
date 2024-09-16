import 'package:get/get.dart';

import '../../common/zip_types.dart';
import '../../core/device_manager/index.dart';
import '../../core/env_manager/state.dart';
import '../../core/lang_manager/index.dart';
import '../../network/api/generate_slider.dart';
import '../../network/models/slider_model.dart';

class SliderVerifyController extends GetxController {
  final GenerateSliderHttp _generateSliderHttp = GenerateSliderHttp(
    deviceManager: Get.find<DeviceManager>(),
    langManager: Get.find<LangManager>(),
    envState: Get.find<EnvState>(),
  );

  final ZipType zipType;

  late Function showDialog;

  SliderVerifyController({required this.zipType});

  RxDouble slideValue = 0.0.obs;

  Rx<SliderModel> slideModel = const SliderModel(
    x: 0,
    y: 0,
    originImage: '',
    shadeImage: '',
    cutoutImage: '',
    captchaId: '',
  ).obs;

  RxBool loading = false.obs;

  Future getSliderModel() async {
    loading.value = true;
    try {
      GenerateSliderResponse response = await _generateSliderHttp
          .request(GenerateSliderResData(zipType: zipType));
      slideModel.value = response.model;
    } catch (e) {
      rethrow;
    } finally {
      loading.value = false;
    }
  }
}
