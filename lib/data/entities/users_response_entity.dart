import 'package:getx_users/data/entities/user_entity.dart';
import 'package:getx_users/domain/models/users_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_response_entity.g.dart';

@JsonSerializable()
class UsersResponseEntity implements UsersResponse {
  const UsersResponseEntity({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory UsersResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseEntityFromJson(json);

  @override
  @JsonKey(name: 'page')
  final int page;

  @override
  @JsonKey(name: 'per_page')
  final int perPage;

  @override
  @JsonKey(name: 'total')
  final int total;

  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;

  @override
  @JsonKey(name: 'data')
  final List<UserEntity> data;
}
