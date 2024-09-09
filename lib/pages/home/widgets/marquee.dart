import 'package:dc_box_app/common/app_color.dart';
import 'package:dc_box_app/generated/app_image/app_image.dart';
import 'package:flutter/cupertino.dart';

import '../../../widgets/custom_marquee/view.dart';
import '../state.dart';

Widget marquee(HomeState state) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: SizedBox(
      height: 18,
      child: Row(
        children: [
          Expanded(
            flex: 0,
            child: AppImage.home.icSpeaker(width: 16, height: 16),
          ),
          const SizedBox(
            width: 4,
          ),
          const Expanded(
            flex: 1,
            child: CustomMarqueeComponent(
              textStyle: TextStyle(fontSize: 12),
              texts: [
                '1不会提供任何银行卡号或者交易地址给用户进行1',
                '2不会提供任何银行卡号或者交易地址给用户进行2',
                '3不会提供任何银行卡号或者交易地址给用户进行3',
                '4不会提供任何银行卡号或者交易地址给用户进行4',
              ],
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            flex: 0,
            child: GestureDetector(
              onTap: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '更多',
                    style: TextStyle(color: AppColor.brand62A2B0),
                  ),
                  const SizedBox(width: 4),
                  AppImage.home.icMore(height: 14, width: 14)
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
