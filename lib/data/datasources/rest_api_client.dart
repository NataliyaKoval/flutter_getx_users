import 'package:dio/dio.dart';
import 'package:getx_users/data/entities/users_response_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api_client.g.dart';

@RestApi(baseUrl: 'https://reqres.in/api/')
abstract class RestApiClient {
  factory RestApiClient(Dio dio, {String baseUrl}) = _RestApiClient;

  @GET('/users/')
  Future<UsersResponseEntity> fetchUsers(@Query('page') int page);
}
