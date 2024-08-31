import 'package:permission_handler/permission_handler.dart';

import '../../core/permission_manager/permission_manager.dart';

class PermissionManagerImpl implements PermissionManager {
  /// 请求单个权限
  @override
  Future<bool> requestPermission(Permission permission) async {
    final status = await permission.request();
    // if (status.isPermanentlyDenied) {
    //   openAppSettings();
    // }
    return status.isGranted;
  }

  /// 请求多个权限
  @override
  Future<Map<Permission, bool>> requestPermissions(
      List<Permission> permissions) async {
    final statuses =
        await Future.wait(permissions.map((perm) => perm.request()));
    // if (statuses.contains(PermissionStatus.permanentlyDenied)) {
    //   openAppSettings();
    // }
    return Map.fromIterables(
        permissions, statuses.map((status) => status.isGranted));
  }

  /// 检查权限
  @override
  Future<bool> isPermissionGranted(Permission permission) async {
    final status = await permission.status;
    // if (status == PermissionStatus.permanentlyDenied) {
    //   openAppSettings();
    // }
    return status.isGranted;
  }

  /// 检查多个权限
  @override
  Future<Map<Permission, bool>> arePermissionsGranted(
      List<Permission> permissions) async {
    final statuses = await Future.wait(permissions.map((perm) => perm.status));
    // if (statuses.contains(PermissionStatus.permanentlyDenied)) {
    //   openAppSettings();
    // }
    return Map.fromIterables(
        permissions, statuses.map((status) => status.isGranted));
  }
}
