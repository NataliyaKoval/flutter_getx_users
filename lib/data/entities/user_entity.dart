import 'package:getx_users/domain/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity implements User {
  UserEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;

  @override
  @JsonKey(name: 'email')
  final String email;

  @override
  @JsonKey(name: 'first_name')
  final String firstName;

  @override
  @JsonKey(name: 'last_name')
  final String lastName;

  @override
  @JsonKey(name: 'avatar')
  final String avatar;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] as int,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      avatar: map['avatar'] as String,
    );
  }
}
