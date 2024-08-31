import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/app_image/app_image.dart';
import 'controller.dart';
import 'widgets/page_content/view.dart';
import 'widgets/page_indicator/view.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GuideController());

    return Stack(
      children: [
        Positioned.fill(
          child: AppImage.guide.guideBg(fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: PageView(
            onPageChanged: controller.onPageChanged,
            children: [
              PageContentComponent(
                title: '[银行级安全保障]',
                icon: AppImage.guide.guideCenter1(fit: BoxFit.fitWidth),
                description: '采用最先进的加密技术和多重验证机制，确保您的资金和个人信息安全，让您存储无忧。',
              ),
              PageContentComponent(
                title: '[稳定代币]',
                icon: AppImage.guide.guideCenter2(fit: BoxFit.fitWidth),
                description: '锚定人民币1:1汇率兑换EZ币，随时随地100%兑换，让您的资金坚实可靠，无惧市场风云。',
              ),
              PageContentComponent(
                title: '[银行级安全保障]',
                icon: AppImage.guide.guideCenter3(fit: BoxFit.fitWidth),
                description: '采用最先进的加密技术和多重验证机制，确保您的资金和个人信息安全，让您存储无忧。',
              )
            ],
          ),
        ),
        Positioned(
            bottom: 52,
            left: 0,
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => PageIndicatorComponent(
                currentPage: controller.currentPage.value,
                pageCount: 3,
              ),
            )),
      ],
    );
  }
}
