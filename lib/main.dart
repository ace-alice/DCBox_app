import 'package:dc_box_app/common/core/lang_manager/lang_manager_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import './global.dart';
import 'common/core/lang_manager/data/index.dart';
import 'common/core/lang_manager/lang_manager.dart';
import 'common/router/app_pages.dart';
import 'common/utils/app_color.dart';

void main() {
  Global().init().then((e) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppPages _appPages = Get.put(AppPages());
  final LangManager _langManager = Get.find<LangManagerImpl>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: _appPages.firstPage.title ?? '',
          getPages: _appPages.routes,
          initialBinding: _appPages.firstPage.binding,
          initialRoute: _appPages.firstPage.name,
          unknownRoute: _appPages.unknownPage,
          color: Colors.white,
          theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: AppColor.textFFFFFF,
                  displayColor: AppColor.textFFFFFF,
                ),
            //主题颜色样本
            primarySwatch: primarySwatchColor,
            //主色，决定导航栏颜色
            primaryColor: AppColor.backdrop121212,
            //預設背景色
            scaffoldBackgroundColor: AppColor.backdrop121212,
          ),
          translations: Messages(),
          // 你的翻译资源
          locale: _langManager.locale,
          // 默认语言
          fallbackLocale: const Locale('en'),
          // 备用语言
          supportedLocales: const [
            Locale('en'),
            Locale('zh'),
            // 添加更多支持的语言
          ],
        );
      },
    );
  }
}
