import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_users/domain/models/user.dart';
import 'package:getx_users/presentation/detail_screen/detail_binding.dart';
import 'package:getx_users/presentation/detail_screen/detail_page.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => DetailPage(id: user.id), binding: DetailBinding());
      },
      child: Card(
        color: Colors.grey.shade300,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 26,
          ),
          leading: CachedNetworkImage(
            imageUrl: user.avatar,
            fit: BoxFit.cover,
            width: 60,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
          ),
          title: Text(
            '${user.firstName} ${user.lastName}',
            style: const TextStyle(fontSize: 28),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            user.email,
            style: const TextStyle(fontSize: 24, color: Colors.indigo),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
