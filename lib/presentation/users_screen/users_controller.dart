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
  bool isLastPage = true;
  bool isFutureRunning = false;

  void fetchUsers() async {
    if (isFutureRunning) {
      return;
    }

    isFutureRunning = true;

    try {
      final UsersResponse response = await _getUsersUseCase.call(page);

      if (response.totalPages != null) {
        page++;
        isLastPage = page > response.totalPages!;
      }

      users.addAll(response.data);
    } catch (e) {
      print(e);
    } finally {
      isFutureRunning = false;
    }

    update();
  }
}
