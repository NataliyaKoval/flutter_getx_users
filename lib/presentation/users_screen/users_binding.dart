import 'package:get/get.dart';
import 'package:getx_users/domain/use_case/get_users_use_case.dart';
import 'package:getx_users/presentation/users_screen/users_controller.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetUsersUseCase(Get.find()));
    Get.lazyPut(() => UsersController(Get.find()));
  }
}
