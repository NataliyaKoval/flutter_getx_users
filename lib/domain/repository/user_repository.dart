import 'package:getx_users/domain/models/user.dart';
import 'package:getx_users/domain/models/users_response.dart';

abstract class UserRepository {

  Future<UsersResponse> fetchAndSaveUsers(int page);

  Future<List<User>> readSavedUsers();

  Future<User> getUserDetail(int id);
}