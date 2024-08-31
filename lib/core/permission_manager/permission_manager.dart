import 'package:permission_handler/permission_handler.dart';

abstract class PermissionManager {
  /// 请求单个权限
  Future<bool> requestPermission(Permission permission);

  /// 请求多个权限
  Future<Map<Permission, bool>> requestPermissions(
      List<Permission> permissions);

  /// 检查权限
  Future<bool> isPermissionGranted(Permission permission);

  /// 检查多个权限
  Future<Map<Permission, bool>> arePermissionsGranted(
      List<Permission> permissions);
}
