import 'package:getx_users/domain/models/user.dart';
import 'package:getx_users/domain/repository/user_repository.dart';
import 'package:getx_users/domain/use_case/use_case.dart';

class GetDetailUseCase extends UseCase<User, int> {
  GetDetailUseCase(this._userRepository,);

  final UserRepository _userRepository;

  @override
  Future<User> call(int params) {
    return _userRepository.fetchUserDetail(params);
  }
}