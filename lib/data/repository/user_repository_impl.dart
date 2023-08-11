import 'dart:convert';
import 'package:getx_users/data/datasources/local_database.dart';
import 'package:getx_users/data/datasources/rest_api_client.dart';
import 'package:getx_users/data/entities/user_detail_response_entity.dart';
import 'package:getx_users/data/entities/users_response_entity.dart';
import 'package:getx_users/domain/models/user.dart';
import 'package:getx_users/domain/models/users_response.dart';
import 'package:getx_users/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required this.restApiClient,
    required this.localDatabase,
  });

  final RestApiClient restApiClient;
  final LocalDatabase localDatabase;

  @override
  Future<UsersResponse> fetchAndSaveUsers(int page) async {
    UsersResponseEntity response = await restApiClient.fetchUsers(page);
    localDatabase.saveUsers(response.data);
    return response;
  }

  @override
  Future<User> fetchUserDetail(int id) async {
    UserDetailResponseEntity response = await restApiClient.fetchDetail(id);
    return response.data;
  }

  @override
  Future<List<User>> readSavedUsers() async {
    return await localDatabase.readUsers();
  }

}
