import 'package:get/get.dart';
import 'package:getx_users/presentation/detail_screen/detail_controller.dart';
import 'package:getx_users/domain/use_case/get_detail_use_case.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetDetailUseCase(Get.find()));
    Get.lazyPut(() => DetailController(Get.find()));
  }
}
