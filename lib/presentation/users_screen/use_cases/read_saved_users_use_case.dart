import 'package:getx_users/domain/models/user.dart';
import 'package:getx_users/domain/repository/user_repository.dart';
import 'package:getx_users/domain/use_case/use_case.dart';

class ReadSavedUsersUseCase extends NoParamsUseCase<List<User>> {
  ReadSavedUsersUseCase(this._userRepository,);

  final UserRepository _userRepository;

  @override
  Future<List<User>> call() {
    return _userRepository.readSavedUsers();
  }
}