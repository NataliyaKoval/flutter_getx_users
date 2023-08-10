import 'package:getx_users/data/datasources/rest_api_client.dart';
import 'package:getx_users/domain/models/users_response.dart';
import 'package:getx_users/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required this.restApiClient,
  });

  final RestApiClient restApiClient;

  @override
  Future<UsersResponse> fetchUsers(int page) {
    return restApiClient.fetchUsers(page);
  }
}
