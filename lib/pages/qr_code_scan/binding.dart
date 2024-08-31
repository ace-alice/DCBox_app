import 'package:get/get.dart';

import '../../core/permission_manager/controller.dart';
import '../../core/permission_manager/permission_manager.dart';
import 'controller.dart';

class QRCodeScanBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<PermissionManager>(() => PermissionManagerImpl()),
      Bind.lazyPut(() => QRCodeScanController())
    ];
  }
}
