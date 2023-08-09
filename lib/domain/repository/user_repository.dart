import 'package:getx_users/domain/models/users_response.dart';

abstract class UserRepository {
  Future<UsersResponse> fetchUsers(int page);
}