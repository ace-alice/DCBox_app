import 'package:flutter/cupertino.dart';

import '../../../generated/app_image/app_image.dart';

Widget selectImageWidget() {
  return GestureDetector(
    onTap: () => {},
    child: Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 15,
      ),
      child: SizedBox(
        width: 31.5,
        child: AppImage.scan.icPhoto(),
      ),
    ),
  );
}
