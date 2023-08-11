import 'package:getx_users/data/datasources/rest_api_client.dart';
import 'package:getx_users/data/entities/user_detail_response_entity.dart';
import 'package:getx_users/domain/models/user.dart';
import 'package:getx_users/domain/models/users_response.dart';
import 'package:getx_users/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required this.restApiClient,
  });

  final RestApiClient restApiClient;

  @override
  Future<UsersResponse> fetchUsers(int page) async {
    return restApiClient.fetchUsers(page);
  }

  @override
  Future<User> fetchUserDetail(int id) async {
    UserDetailResponseEntity response = await restApiClient.fetchDetail(id);
    return response.data;
  }
}
