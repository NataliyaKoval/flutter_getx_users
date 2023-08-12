import 'package:getx_users/domain/models/user.dart';

class UsersResponse {
  const UsersResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    required this.data,
  });

  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<User> data;
}
