import 'package:flutter/cupertino.dart';

import '../../../common/app_color.dart';

Widget assetDetails() {
  return Container(
    margin: const EdgeInsets.only(top: 12),
    padding: const EdgeInsets.all(15),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColor.backdrop222222,
    ),
    child: Text('assetDetails'),
  );
}
