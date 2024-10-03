import 'package:dc_box_app/common/app_color.dart';
import 'package:dc_box_app/common/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_styles.dart';
import '../../common/pop_ups_widget.dart';
import '../../common/tr_key.dart';
import '../../utils/merge_decorations.dart';

abstract class CommonPopUpsComponent implements PopUpsWidget {
  double get width => 255;

  EdgeInsetsGeometry get padding =>
      const EdgeInsets.symmetric(horizontal: 20, vertical: 22);
  BoxDecoration? decoration;

  /// 是否显示关闭icon
  bool get showCloseIcon => false;

  /// 是否显示关闭按钮
  bool get showCloseBtn => true;

  /// 是否显示确认按钮
  bool get showConfirmBtn => true;

  /// 头部名称
  String get title => '';

  /// 提示名称
  String get tip => TrKey.prompt.tr;

  /// 点击确认按钮的回调函数
  Future<String?> onConfirm() async {
    return null;
  }

  /// 点击关闭按钮的回调函数
  Future<String?> onClose() async {
    return null;
  }

  String get closeText => TrKey.cancel.tr;

  String get confirmText => TrKey.ok.tr;

  RxBool loading = false.obs;

  /// 内容显示区域
  Widget child();

  @override
  Widget build(void Function() cancelFunc) {
    return Stack(
      children: [
        Container(
          width: width,
          padding: padding,
          decoration: mergeDecorations(
            const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: AppColor.backdrop222222,
            ),
            decoration,
          ),
          child: Column(
            children: [
              title.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              tip.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        tip,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.25,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 55,
                ),
                child: child(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    showCloseBtn != showConfirmBtn
                        ? const SizedBox(width: 30)
                        : const SizedBox.shrink(),
                    showCloseBtn
                        ? Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                backgroundColor:
                                    const Color.fromRGBO(56, 56, 56, 1),
                                shadowColor: Colors.transparent, // 去掉阴影
                                minimumSize: const Size(100, 40),
                              ),
                              onPressed: () async {
                                String? result = await onClose();
                                if (result != null && result.isNotEmpty) {
                                  AppToast.simple(result, ToastType.fail);
                                  return;
                                }
                                cancelFunc();
                              },
                              child: Text(
                                closeText,
                                style: AppStyles.btnTextStyle(),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    showCloseBtn && showConfirmBtn
                        ? const SizedBox(width: 16)
                        : const SizedBox.shrink(),
                    showConfirmBtn
                        ? Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: AppStyles.btnGradient(opacity: 1),
                                borderRadius: BorderRadius.circular(20), // 圆角
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 1),
                                  backgroundColor: Colors.transparent,
                                  // 去掉阴影
                                  shadowColor: Colors.transparent,
                                  minimumSize: const Size(100, 40),
                                  maximumSize: const Size(150, 40),
                                ),
                                onPressed: () async {
                                  String? result = await onConfirm();
                                  if (result != null && result.isNotEmpty) {
                                    AppToast.simple(result, ToastType.fail);
                                    return;
                                  }
                                  cancelFunc();
                                },
                                child: Obx(
                                  () {
                                    if (loading.value) {
                                      return const SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      );
                                    } else {
                                      return Text(
                                        confirmText,
                                        style: AppStyles.btnTextStyle(),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    showCloseBtn != showConfirmBtn
                        ? const SizedBox(width: 30)
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
        showCloseIcon
            ? Positioned(
                right: 0,
                top: 4,
                child: IconButton(
                  onPressed: cancelFunc,
                  icon: const Icon(
                    Icons.close,
                    color: AppColor.textFFFFFF,
                    size: 18,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
