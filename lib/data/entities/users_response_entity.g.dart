// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersResponseEntity _$UsersResponseEntityFromJson(Map<String, dynamic> json) =>
    UsersResponseEntity(
      page: json['page'] as int?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
      totalPages: json['total_pages'] as int?,
      data: (json['data'] as List<dynamic>)
          .map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsersResponseEntityToJson(
        UsersResponseEntity instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data,
    };
