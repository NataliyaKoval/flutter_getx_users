import 'package:json_annotation/json_annotation.dart';

part 'support_entity.g.dart';

@JsonSerializable()
class SupportEntity {
  const SupportEntity({
    required this.url,
    required this.text,
  });
  factory SupportEntity.fromJson(Map<String, dynamic> json) =>
      _$SupportEntityFromJson(json);

  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'text')
  final String text;
}
