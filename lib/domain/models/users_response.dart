import 'package:getx_users/domain/models/user.dart';

class UsersResponse {
  const UsersResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> data;
}
