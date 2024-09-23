import 'package:flutter/cupertino.dart';

abstract class PopUpsWidget {
  Widget build(void Function() cancelFunc);
}
