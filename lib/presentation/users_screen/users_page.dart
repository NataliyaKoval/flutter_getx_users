import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_users/presentation/users_screen/users_controller.dart';

class UsersPage extends GetView<UsersController> {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
        init: controller,
        initState: (state) {
          controller.fetchUsers();
        },
        builder: (_) {
          return Scaffold(
            appBar: AppBar(),
            body: ListView.separated(
                itemBuilder: (context, index) =>
                    Text(controller.users[index].firstName),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: controller.users.length),
          );
        });
  }
}
