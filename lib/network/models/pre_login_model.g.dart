// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pre_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreLoginModel _$PreLoginModelFromJson(Map<String, dynamic> json) =>
    PreLoginModel(
      token: json['token'] as String? ?? '',
      verifyTypes: (json['verifyTypes'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      phone: json['phone'],
      countryCode: json['countryCode'],
      email: json['email'],
      dcboxFirstLogin: json['dcboxFirstLogin'] as bool? ?? false,
      isRegister: json['isRegister'],
      loginName: json['loginName'],
      appId: json['appId'],
      whetherBindSuperior: json['whetherBindSuperior'] as bool? ?? false,
    );

Map<String, dynamic> _$PreLoginModelToJson(PreLoginModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'verifyTypes': instance.verifyTypes,
      'phone': instance.phone,
      'countryCode': instance.countryCode,
      'email': instance.email,
      'dcboxFirstLogin': instance.dcboxFirstLogin,
      'isRegister': instance.isRegister,
      'loginName': instance.loginName,
      'appId': instance.appId,
      'whetherBindSuperior': instance.whetherBindSuperior,
    };
