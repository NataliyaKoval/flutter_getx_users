import 'package:getx_users/data/datasources/local_database.dart';
import 'package:getx_users/data/datasources/rest_api_client.dart';
import 'package:getx_users/data/entities/user_detail_response_entity.dart';
import 'package:getx_users/data/entities/user_entity.dart';
import 'package:getx_users/data/entities/users_response_entity.dart';
import 'package:getx_users/domain/models/user.dart';
import 'package:getx_users/domain/models/users_response.dart';
import 'package:getx_users/domain/repository/user_repository.dart';
import 'package:getx_users/utils/connection_utils.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required this.restApiClient,
    required this.localDatabase,
  });

  final RestApiClient restApiClient;
  final LocalDatabase localDatabase;

  @override
  Future<UsersResponse> fetchAndSaveUsers(int page) async {
    UsersResponseEntity response;
    bool isConnected = await ConnectionUtils.isConnected();
    if (isConnected) {
      response = await restApiClient.fetchUsers(page);
      localDatabase.saveUsers(response.data);
    } else {
      List<UserEntity> users = await localDatabase.readUsers();
      response = UsersResponseEntity(data: users);
    }

    return response;
  }

  @override
  Future<User> getUserDetail(int id) async {
    UserEntity user;
    bool isConnected = await ConnectionUtils.isConnected();
    if (isConnected) {
      UserDetailResponseEntity response = await restApiClient.fetchDetail(id);
      user = response.data;
    } else {
      List<UserEntity> list = await localDatabase.readUsers();
      user = list.firstWhere((user) => user.id == id);
    }

    return user;
  }
}
