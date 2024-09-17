import 'dart:convert';

import 'package:crypto/crypto.dart';

extension StringToMd5 on String {
  String get toMd5 {
    var content = const Utf8Encoder().convert(this);
    var digest = md5.convert(content);
    return digest.toString();
  }
}
