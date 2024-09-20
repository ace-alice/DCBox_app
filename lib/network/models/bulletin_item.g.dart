// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulletin_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BulletinItem _$BulletinItemFromJson(Map<String, dynamic> json) => BulletinItem(
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      type: (json['type'] as num?)?.toInt() ?? 0,
      createdDate: (json['createdDate'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$BulletinItemToJson(BulletinItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
      'createdDate': instance.createdDate,
    };
