// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailResponseEntity _$UserDetailResponseEntityFromJson(
        Map<String, dynamic> json) =>
    UserDetailResponseEntity(
      data: UserEntity.fromJson(json['data'] as Map<String, dynamic>),
      support: SupportEntity.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDetailResponseEntityToJson(
        UserDetailResponseEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
      'support': instance.support,
    };
