import 'package:dc_box_app/generated/app_image/app_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/app_color.dart';

// AssetImage('assets/images/home/home_remind_login.png')
Widget enterCard() {
  return SizedBox(
    height: 100.w,
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), //10像素圆角
        image: DecorationImage(
          image: MemoryImage(AppImage.home.homeRemindLoginImageData()!),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
              left: 20.w,
              top: 25.w,
              child: Text(
                '轻松几步，开启首笔交易',
                style: TextStyle(
                  fontSize: 16.w,
                ),
              )),
          Positioned(
              left: 20.w,
              bottom: 25.w,
              child: Text(
                '注册 / 登录 >',
                style: TextStyle(
                  fontSize: 14.w,
                  color: AppColor.textFEDF43,
                ),
              )),
        ],
      ),
    ),
  );
}
