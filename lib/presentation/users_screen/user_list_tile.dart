import 'package:flutter/material.dart';
import 'package:getx_users/domain/models/user.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade300,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 26,
        ),
        leading: Image.network(
          user.avatar,
          fit: BoxFit.cover,
          width: 60,
        ),
        title: Text(
          '${user.firstName} ${user.lastName}',
          style: const TextStyle(fontSize: 28),
        ),
        subtitle: Text(
          user.email,
          style: const TextStyle(fontSize: 24, color: Colors.indigo),
        ),
      ),
    );
  }
}
