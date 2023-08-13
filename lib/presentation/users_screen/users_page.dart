import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_users/consts/app_strings.dart';
import 'package:getx_users/presentation/users_screen/widgets/user_list_tile.dart';
import 'package:getx_users/presentation/users_screen/users_controller.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final UsersController controller = Get.find();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
        init: controller,
        initState: (state) {
          controller.fetchUsers();
          _scrollController.addListener(_scrollListener);
        },
        dispose: (state) {
          _scrollController.removeListener(_scrollListener);
        },
        builder: (_) {
          if (controller.isLoading && controller.users.isEmpty) {
            return Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (controller.users.isEmpty) {
            return Scaffold(
              body: Center(
                child: Text(AppStrings.nothingToShow),
              ),
            );
          } else if (controller.isError) {
            return Scaffold(
              body: Center(
                child: Text(AppStrings.errorMessage),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.usersTitle),
                centerTitle: true,
              ),
              body: ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) => UserListTile(
                        user: controller.users[index],
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: controller.users.length),
            );
          }
        });
  }

  _scrollListener() {
    if (_scrollController.position.extentAfter < 200 &&
        controller.isLastPage == false) {
      controller.fetchUsers();
    }
  }
}
