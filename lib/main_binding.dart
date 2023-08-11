import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_users/data/datasources/local_database.dart';
import 'package:getx_users/data/datasources/rest_api_client.dart';
import 'package:getx_users/data/repository/user_repository_impl.dart';
import 'package:getx_users/domain/repository/user_repository.dart';

class MainBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut<Dio>(() => Dio());
    Get.lazyPut<RestApiClient>(() => RestApiClient(Get.find()));
    Get.lazyPut<LocalDatabase>(() => LocalDatabase());
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(
        restApiClient: Get.find(), localDatabase: Get.find()));
  }
}
