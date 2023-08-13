import 'package:getx_users/domain/models/users_response.dart';
import 'package:getx_users/domain/repository/user_repository.dart';
import 'package:getx_users/domain/use_case/use_case.dart';

class GetUsersUseCase extends UseCase<UsersResponse, int> {
  GetUsersUseCase(this._userRepository,);

  final UserRepository _userRepository;

  @override
  Future<UsersResponse> call(int params) {
    return _userRepository.fetchAndSaveUsers(params);
  }
}
