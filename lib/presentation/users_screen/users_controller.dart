import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_users/domain/models/user.dart';
import 'package:getx_users/domain/models/users_response.dart';
import 'package:getx_users/domain/use_case/get_users_use_case.dart';

class UsersController extends GetxController {
  UsersController(
    this._getUsersUseCase,
  );

  final GetUsersUseCase _getUsersUseCase;

  int _page = 1;
  List<User> users = [];
  bool isLastPage = true;
  bool isLoading = false;
  bool isError = false;

  void fetchUsers() async {
    if (isLoading) {
      return;
    }

    isLoading = true;
    update();

    try {
      final UsersResponse response = await _getUsersUseCase(_page);
      _page++;
      isLastPage = _page > response.totalPages;
      users.addAll(response.data);
    } catch (e) {
      isError = true;
    } finally {
      isLoading = false;
    }

    update();
  }
}
