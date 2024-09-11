import 'package:dc_box_app/generated/app_image/app_image.dart';
import 'package:flutter/cupertino.dart';

Widget getCountryByCode({
  required String code,
  BoxFit fit = BoxFit.contain,
  double? width = 20,
  double? height = 20,
}) {
  return AppImage.country.getImageWith(
    name: 'ic$code',
    fit: fit,
    width: width,
    height: height,
  );
}
