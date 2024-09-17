import 'dart:convert';

import 'package:dc_box_app/generated/app_image/app_image.dart';
import 'package:dc_box_app/network/models/verify_slide_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../common/zip_types.dart';
import '../../core/device_manager/index.dart';
import '../../core/env_manager/state.dart';
import '../../core/lang_manager/index.dart';
import '../../network/api/generate_slider.dart';
import '../../network/api/verify_slider.dart';
import '../../network/models/slider_model.dart';

class SliderVerifyController extends GetxController {
  final GenerateSliderHttp _generateSliderHttp = GenerateSliderHttp(
    deviceManager: Get.find<DeviceManager>(),
    langManager: Get.find<LangManager>(),
    envState: Get.find<EnvState>(),
  );

  final VerifySliderHttp _verifySliderHttp = VerifySliderHttp(
    deviceManager: Get.find<DeviceManager>(),
    langManager: Get.find<LangManager>(),
    envState: Get.find<EnvState>(),
  );

  final ZipType zipType;

  late Function showDialog;

  late Function(VerifySlideModel result) closeDialog;

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

  RxDouble sliderX = 0.0.obs;

  RxBool loading = false.obs;

  Future getSliderModel() async {
    loading.value = true;
    try {
      GenerateSliderResponse response = await _generateSliderHttp
          .request(GenerateSliderResData(zipType: zipType));
      slideModel.value = response.model;
      sliderProps.value = SliderProps(
        originImage: Image.memory(
          base64Decode(slideModel.value.originImage),
          fit: BoxFit.cover,
        ),
        shadeImage: Image.memory(
          base64Decode(slideModel.value.shadeImage),
          fit: BoxFit.cover,
        ),
        cutoutImage: Image.memory(
          base64Decode(slideModel.value.cutoutImage),
          fit: BoxFit.cover,
        ),
      );
    } catch (e) {
      rethrow;
    } finally {
      loading.value = false;
      sliderX.value = 0;
    }
  }

  Future verifySlider() async {
    try {
      VerifySliderResponse response = await _verifySliderHttp.request(
        VerifySliderResData(
          captchaId: slideModel.value.captchaId,
          x: sliderX.value,
          y: slideModel.value.y,
        ),
      );
      closeDialog(response.result);
    } catch (e) {
      rethrow;
    } finally {}
  }

  Rx<SliderProps> sliderProps = SliderProps(
    originImage: Image.memory(
      AppImage.common.slideDemoImageData()!,
      fit: BoxFit.cover,
    ),
    shadeImage: Image.memory(
      AppImage.common.slideDemoImageData()!,
      fit: BoxFit.cover,
    ),
    cutoutImage: Image.memory(
      AppImage.common.slideDemoImageData()!,
      fit: BoxFit.cover,
    ),
  ).obs;

  @override
  void onInit() {
    super.onInit();
  }
}

class SliderProps {
  final Image originImage;
  final Image shadeImage;
  final Image cutoutImage;

  SliderProps({
    required this.originImage,
    required this.shadeImage,
    required this.cutoutImage,
  });
}
