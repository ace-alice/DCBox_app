import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import './global.dart';
import './router/app_pages.dart';
import 'common/app_color.dart';
import 'common/app_font.dart';
import 'core/lang_manager/data/index.dart';
import 'core/lang_manager/index.dart';
import 'router/app_router_observer.dart';

void main() {
  Global().init().then((e) => runApp(MyApp()));
}

class NoGesturePageRoute extends PageRouteBuilder {
  NoGesturePageRoute({required Widget page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final LangManager _langManager = Get.put(LangManagerImpl());

  final botToastBuilder = BotToastInit();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: AppPages.firstPage.title ?? '',
          getPages: AppPages.routes,
          binds: AppPages.firstPage.binding?.dependencies(),
          initialRoute: AppPages.firstPage.name,
          unknownRoute: AppPages.unknownPage,
          color: Colors.white,
          theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: AppColor.textFFFFFF,
                  displayColor: AppColor.textFFFFFF,
                  decoration: TextDecoration.none,
                ),
            splashColor: AppColor.brand62A2B0,
            // 设置水波纹颜色
            highlightColor: AppColor.backdrop91C9D6,
            // 设置点击后高亮颜色
            //主题颜色样本
            primarySwatch: primarySwatchColor,
            //主色，决定导航栏颜色
            primaryColor: AppColor.backdrop121212,
            //預設背景色
            scaffoldBackgroundColor: AppColor.backdrop121212,
            fontFamily: AppFont.pingFangHk,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColor.backdrop222222,
              iconTheme: IconThemeData(size: 25, color: AppColor.textFFFFFF),
              titleTextStyle: TextStyle(
                color: AppColor.textFFFFFF,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          translations: Messages(),
          // 你的翻译资源
          locale: _langManager.locale,
          // 默认语言
          fallbackLocale: _langManager.locale,
          // 备用语言
          supportedLocales: const [
            Locale.fromSubtags(languageCode: 'en'),
            Locale.fromSubtags(languageCode: 'zh'),
            // 添加更多支持的语言
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            // 其他本地化委托
          ],
          builder: (context, child) {
            child = botToastBuilder(context, child);
            return child;
          },
          navigatorObservers: [AppRouterObserver()],
        );
      },
    );
  }
}
