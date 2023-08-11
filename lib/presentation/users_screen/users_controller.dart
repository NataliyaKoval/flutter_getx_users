import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_users/domain/models/user.dart';
import 'package:getx_users/domain/models/users_response.dart';
import 'package:getx_users/presentation/users_screen/use_cases/get_users_use_case.dart';
import 'package:getx_users/presentation/users_screen/use_cases/read_saved_users_use_case.dart';
import 'package:getx_users/utils/connection_utils.dart';

class UsersController extends GetxController {
  UsersController(
    this._getUsersUseCase,
    this._readSavedUsersUseCase,
  );

  final GetUsersUseCase _getUsersUseCase;
  final ReadSavedUsersUseCase _readSavedUsersUseCase;

  int page = 1;
  List<User> users = [];
  bool isLastPage = false;
  bool isFutureRunning = false;

  void getUsers() async {
    bool isConnected = await ConnectionUtils.isConnected();
    if (isConnected) {
      fetchUsers();
    } else {
      readSavedUsers();
    }
  }

  void fetchUsers() async {
    if (isFutureRunning) {
      return;
    }

    isFutureRunning = true;

    try {
      final UsersResponse response = await _getUsersUseCase.call(page);
      page++;
      isLastPage = page > response.totalPages;
      users.addAll(response.data);
    } catch (e) {
      print(e);
    } finally {
      isFutureRunning = false;
    }

    update();
  }

  void readSavedUsers() async {
    try {
      List<User> savedUsers = await _readSavedUsersUseCase.call();
      users = savedUsers;
    } catch (e) {
      print(e);
    }
    update();
  }
}
