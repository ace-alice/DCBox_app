import 'dart:ui' as ui;

import 'package:dc_box_app/common/app_color.dart';
import 'package:dc_box_app/generated/app_image/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../network/models/verify_slide_model.dart';
import '../rotation_animation/view.dart';
import 'controller.dart';
import 'image_thumb_shape.dart';

class SliderVerifyWidget extends StatefulWidget {
  const SliderVerifyWidget({
    super.key,
    required this.child,
    required this.controller,
    required this.returnResult,
  });

  final Widget child;

  final SliderVerifyController controller;

  final Function(VerifySlideModel result) returnResult;

  @override
  State<SliderVerifyWidget> createState() => _SliderVerifyWidgetState();
}

class _SliderVerifyWidgetState extends State<SliderVerifyWidget> {
  late final SliderVerifyController controller;

  ui.Image? _thumbImage;

  _loadImage() async {
    final codec =
        await ui.instantiateImageCodec(AppImage.common.slideBtnImageData()!);
    final frame = await codec.getNextFrame();
    setState(() {
      _thumbImage = frame.image;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    _loadImage();
  }

  @override
  Widget build(BuildContext context) {
    controller.closeDialog = (VerifySlideModel result) {
      Navigator.of(context).pop(); // 关闭对话框
      widget.returnResult(result);
    };
    controller.showDialog = () async {
      await controller.getSliderModel();
      if (controller.slideModel.value.captchaId.isEmpty) {
        return;
      }
      await showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: const Color.fromRGBO(0, 0, 0, 0),
        builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0.6),
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 236,
                    width: 321,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: const BoxDecoration(
                      color: AppColor.textFFFFFF,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '安全验证',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.text182140,
                                  height: 1.25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop(); // 关闭对话框
                                },
                                child: AppImage.common.close(height: 15),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 112,
                          width: 310,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            // color: AppColor.textFFFFFF,
                          ),
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                // 设置圆角半径
                                child: Obx(
                                  () =>
                                      controller.sliderProps.value.originImage,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                // 设置圆角半径
                                child: Obx(
                                  () => controller.sliderProps.value.shadeImage,
                                ),
                              ),
                              Obx(
                                () => Positioned(
                                  key: ValueKey(
                                      controller.slideModel.value.captchaId),
                                  top: controller.slideModel.value.y + 6,
                                  left: controller.sliderX.value,
                                  child:
                                      controller.sliderProps.value.cutoutImage,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Stack(
                          children: [
                            Positioned(
                              child: Container(
                                width: 310,
                                height: 25,
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    AppImage.common
                                        .slideBg(width: 298, height: 25),
                                    const Text(
                                      '向右拖动滑块完成拼图验证',
                                      style: TextStyle(
                                        color: AppColor.text182140,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5,
                              child: SizedBox(
                                width: 310,
                                height: 34,
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    trackHeight: 25,
                                    activeTrackColor: Colors.transparent,
                                    inactiveTrackColor: Colors.transparent,
                                    thumbShape: ImageThumbShape(
                                      thumbRadius: 22,
                                      image: _thumbImage,
                                    ),
                                  ),
                                  child: Obx(
                                    () => Slider(
                                      value: controller.sliderX.value,
                                      min: 0,
                                      max: 250,
                                      onChanged: (value) {
                                        controller.sliderX.value = value;
                                      },
                                      onChangeEnd: (value) {
                                        controller.verifySlider();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RotationAnimationComponent(
                              loading: controller.loading,
                              child: GestureDetector(
                                onTap: () {
                                  controller.getSliderModel();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: AppImage.common.icRefresh(height: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    };
    return Stack(
      children: [
        widget.child,
      ],
    );
  }

  @override
  void dispose() {
    Get.delete<SliderVerifyController>();
    super.dispose();
  }
}
