import 'package:getx_users/data/entities/support_entity.dart';
import 'package:getx_users/data/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_detail_response_entity.g.dart';

@JsonSerializable()
class UserDetailResponseEntity {
  const UserDetailResponseEntity({
    required this.data,
    required this.support,
  });

  factory UserDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$UserDetailResponseEntityFromJson(json);

  @JsonKey(name: 'data')
  final UserEntity data;

  @JsonKey(name: 'support')
  final SupportEntity support;
}