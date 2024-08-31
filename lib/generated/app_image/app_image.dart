import 'package:flutter/material.dart';import 'package:get/get.dart';import 'dart:convert';import 'dart:typed_data';import 'image_json.dart';class AppImage {static final guide = Guide();static final home = Home();static final scan = Scan();static final welcome = Welcome();static final banners = Banners();static final icons = Icons();}class Guide with FetchImage {
Widget guideCenter3({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('guideCenter3', fit:fit, width:width, height:height,);
}Image? guideCenter3Image({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('guideCenter3', fit:fit, width:width, height:height,);
}Uint8List? guideCenter3ImageData() {
return _getImageData('guideCenter3',);
}Widget guideCenter2({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('guideCenter2', fit:fit, width:width, height:height,);
}Image? guideCenter2Image({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('guideCenter2', fit:fit, width:width, height:height,);
}Uint8List? guideCenter2ImageData() {
return _getImageData('guideCenter2',);
}Widget guideCenter1({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('guideCenter1', fit:fit, width:width, height:height,);
}Image? guideCenter1Image({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('guideCenter1', fit:fit, width:width, height:height,);
}Uint8List? guideCenter1ImageData() {
return _getImageData('guideCenter1',);
}Widget guideBg({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('guideBg', fit:fit, width:width, height:height,);
}Image? guideBgImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('guideBg', fit:fit, width:width, height:height,);
}Uint8List? guideBgImageData() {
return _getImageData('guideBg',);
}}class Home with FetchImage {
Widget icCustomerService({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('icCustomerService', fit:fit, width:width, height:height,);
}Image? icCustomerServiceImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('icCustomerService', fit:fit, width:width, height:height,);
}Uint8List? icCustomerServiceImageData() {
return _getImageData('icCustomerService',);
}Widget icLanguageEn({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('icLanguageEn', fit:fit, width:width, height:height,);
}Image? icLanguageEnImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('icLanguageEn', fit:fit, width:width, height:height,);
}Uint8List? icLanguageEnImageData() {
return _getImageData('icLanguageEn',);
}Widget icLanguage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('icLanguage', fit:fit, width:width, height:height,);
}Image? icLanguageImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('icLanguage', fit:fit, width:width, height:height,);
}Uint8List? icLanguageImageData() {
return _getImageData('icLanguage',);
}Widget icSpeaker({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('icSpeaker', fit:fit, width:width, height:height,);
}Image? icSpeakerImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('icSpeaker', fit:fit, width:width, height:height,);
}Uint8List? icSpeakerImageData() {
return _getImageData('icSpeaker',);
}Widget bgNotice({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('bgNotice', fit:fit, width:width, height:height,);
}Image? bgNoticeImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('bgNotice', fit:fit, width:width, height:height,);
}Uint8List? bgNoticeImageData() {
return _getImageData('bgNotice',);
}Widget icLanguageCn({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('icLanguageCn', fit:fit, width:width, height:height,);
}Image? icLanguageCnImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('icLanguageCn', fit:fit, width:width, height:height,);
}Uint8List? icLanguageCnImageData() {
return _getImageData('icLanguageCn',);
}Widget icMore({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('icMore', fit:fit, width:width, height:height,);
}Image? icMoreImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('icMore', fit:fit, width:width, height:height,);
}Uint8List? icMoreImageData() {
return _getImageData('icMore',);
}Widget icScan({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('icScan', fit:fit, width:width, height:height,);
}Image? icScanImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('icScan', fit:fit, width:width, height:height,);
}Uint8List? icScanImageData() {
return _getImageData('icScan',);
}Widget homeRemindLogin({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('homeRemindLogin', fit:fit, width:width, height:height,);
}Image? homeRemindLoginImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('homeRemindLogin', fit:fit, width:width, height:height,);
}Uint8List? homeRemindLoginImageData() {
return _getImageData('homeRemindLogin',);
}Widget icDeposit({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('icDeposit', fit:fit, width:width, height:height,);
}Image? icDepositImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('icDeposit', fit:fit, width:width, height:height,);
}Uint8List? icDepositImageData() {
return _getImageData('icDeposit',);
}Widget icWithdraw({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('icWithdraw', fit:fit, width:width, height:height,);
}Image? icWithdrawImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('icWithdraw', fit:fit, width:width, height:height,);
}Uint8List? icWithdrawImageData() {
return _getImageData('icWithdraw',);
}Widget icTransfer({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('icTransfer', fit:fit, width:width, height:height,);
}Image? icTransferImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('icTransfer', fit:fit, width:width, height:height,);
}Uint8List? icTransferImageData() {
return _getImageData('icTransfer',);
}Widget iconHomeRefresh({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('iconHomeRefresh', fit:fit, width:width, height:height,);
}Image? iconHomeRefreshImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('iconHomeRefresh', fit:fit, width:width, height:height,);
}Uint8List? iconHomeRefreshImageData() {
return _getImageData('iconHomeRefresh',);
}}class Scan with FetchImage {
Widget icPhoto({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('icPhoto', fit:fit, width:width, height:height,);
}Image? icPhotoImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('icPhoto', fit:fit, width:width, height:height,);
}Uint8List? icPhotoImageData() {
return _getImageData('icPhoto',);
}}class Welcome with FetchImage {
Widget title({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('title', fit:fit, width:width, height:height,);
}Image? titleImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('title', fit:fit, width:width, height:height,);
}Uint8List? titleImageData() {
return _getImageData('title',);
}Widget illustration({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('illustration', fit:fit, width:width, height:height,);
}Image? illustrationImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('illustration', fit:fit, width:width, height:height,);
}Uint8List? illustrationImageData() {
return _getImageData('illustration',);
}Widget splashBot({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('splashBot', fit:fit, width:width, height:height,);
}Image? splashBotImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('splashBot', fit:fit, width:width, height:height,);
}Uint8List? splashBotImageData() {
return _getImageData('splashBot',);
}Widget background({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('background', fit:fit, width:width, height:height,);
}Image? backgroundImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('background', fit:fit, width:width, height:height,);
}Uint8List? backgroundImageData() {
return _getImageData('background',);
}Widget logo({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('logo', fit:fit, width:width, height:height,);
}Image? logoImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('logo', fit:fit, width:width, height:height,);
}Uint8List? logoImageData() {
return _getImageData('logo',);
}Widget splashTop({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('splashTop', fit:fit, width:width, height:height,);
}Image? splashTopImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('splashTop', fit:fit, width:width, height:height,);
}Uint8List? splashTopImageData() {
return _getImageData('splashTop',);
}}class Banners with FetchImage {
Widget bgBanner4({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('bgBanner4', fit:fit, width:width, height:height,);
}Image? bgBanner4Image({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('bgBanner4', fit:fit, width:width, height:height,);
}Uint8List? bgBanner4ImageData() {
return _getImageData('bgBanner4',);
}Widget bgBanner2({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('bgBanner2', fit:fit, width:width, height:height,);
}Image? bgBanner2Image({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('bgBanner2', fit:fit, width:width, height:height,);
}Uint8List? bgBanner2ImageData() {
return _getImageData('bgBanner2',);
}Widget bgBanner3({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('bgBanner3', fit:fit, width:width, height:height,);
}Image? bgBanner3Image({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('bgBanner3', fit:fit, width:width, height:height,);
}Uint8List? bgBanner3ImageData() {
return _getImageData('bgBanner3',);
}Widget bgBanner1({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('bgBanner1', fit:fit, width:width, height:height,);
}Image? bgBanner1Image({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('bgBanner1', fit:fit, width:width, height:height,);
}Uint8List? bgBanner1ImageData() {
return _getImageData('bgBanner1',);
}}class Icons with FetchImage {
Widget service({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getWidget('service', fit:fit, width:width, height:height,);
}Image? serviceImage({BoxFit fit = BoxFit.contain,double? width,double? height,}) {
return _getImage('service', fit:fit, width:width, height:height,);
}Uint8List? serviceImageData() {
return _getImageData('service',);
}}

mixin FetchImage {
  Widget _getWidget(
    String name, {
    BoxFit fit = BoxFit.contain,
    double? width,
    double? height,
  }) {
    final map = imageJson[runtimeType.toString()];
    final placeholder = Placeholder(
      fallbackWidth: width ?? 0,
      fallbackHeight: height ?? 0,
    );
    if (map == null) {
      return placeholder;
    }
    final base64Image = map['${name}Image'];
    if (base64Image == null) {
      return placeholder;
    }
    try {
      final imageData = base64.decode(base64Image);
      return Image.memory(
        imageData,
        fit: fit,
        width: width,
        height: height,
        gaplessPlayback: true,
      );
    } catch (e) {
      return placeholder;
    }
  }

  Uint8List? _getImageData(String name) {
    final map = imageJson[runtimeType.toString()];
    if (map == null) {
      return null;
    }
    final base64Image = map['${name}Image'];
    if (base64Image == null) {
      return null;
    }
    try {
      return base64.decode(base64Image);
    } catch (e) {
      return null;
    }
  }

  Image? _getImage(
    String name, {
    BoxFit fit = BoxFit.contain,
    double? width,
    double? height,
  }) {
    final imageData = _getImageData(name);
    if (imageData == null) {
      return null;
    }
    try {
      return Image.memory(
        imageData,
        fit: fit,
        width: width,
        height: height,
        gaplessPlayback: true,
      );
    } catch (e) {
      return null;
    }
  }

  /// PascalCase
  ///
  /// ex: app_common_icon => AppCommonIcon
  String _snakeCaseConverterToPascalCase(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text
        .split('_')
        .map((e) => e[0].toUpperCase() + e.substring(1))
        .join();
  }

  /// CamelCase
  ///
  /// ex: app_common_icon => appCommonIcon
  String _snackCaseConverterToCamelCase(String text) {
    if (text.isEmpty) {
      return text;
    }
    final pascalCase = _snakeCaseConverterToPascalCase(text);
    return pascalCase[0].toLowerCase() + pascalCase.substring(1);
  }
}

    