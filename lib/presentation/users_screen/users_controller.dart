import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_users/domain/models/user.dart';
import 'package:getx_users/domain/models/users_response.dart';
import 'package:getx_users/presentation/users_screen/use_cases/get_users_use_case.dart';

class UsersController extends GetxController {
  UsersController(
    this._getUsersUseCase,
  );

  final GetUsersUseCase _getUsersUseCase;

  int page = 1;
  List<User> users = [];

  void fetchUsers() async {
    try {
      final UsersResponse response = await _getUsersUseCase.call(page);
      users = response.data;
      print(users[0].firstName);
    } catch (e) {
      print(e);
    }
    update();
  }
}