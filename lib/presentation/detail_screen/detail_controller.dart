import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_users/domain/models/user.dart';
import 'package:getx_users/presentation/detail_screen/use_cases/get_detail_use_case.dart';

class DetailController extends GetxController {
  DetailController(
    this._getDetailUseCase,
  );

  final GetDetailUseCase _getDetailUseCase;

  late User user;
  bool isLoading = false;

  void getDetail(int id) async {
    isLoading = true;
    update();

    try {
      user = await _getDetailUseCase.call(id);
    } catch (e) {
      print(e);
    }
    isLoading = false;
    update();
  }
}
