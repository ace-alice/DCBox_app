import 'package:json_annotation/json_annotation.dart';

part 'bulletin_item.g.dart';

@JsonSerializable()
class BulletinItem {
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String content;
  @JsonKey(defaultValue: 0)
  final int type;
  @JsonKey(defaultValue: 0)
  final int createdDate;

  const BulletinItem({
    required this.title,
    required this.content,
    required this.type,
    required this.createdDate,
  });

  factory BulletinItem.fromJson(Map<String, dynamic> json) =>
      _$BulletinItemFromJson(json);

  Map<String, dynamic> toJson() => _$BulletinItemToJson(this);
}
