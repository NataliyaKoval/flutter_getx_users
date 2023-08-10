import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        },
        didUpdateWidget: (old, newState) {
          _scrollController.addListener(_scrollListener);
        },
        dispose: (state) {
          _scrollController.removeListener(_scrollListener);
        },
        builder: (_) {
          return Scaffold(
            appBar: AppBar(),
            body: ListView.separated(
                controller: _scrollController,
                itemBuilder: (context, index) => SizedBox(
                      height: 200,
                      child: Card(
                        child: Text(controller.users[index].firstName, style: TextStyle(fontSize: 30),),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: controller.users.length),
          );
        });
  }

  _scrollListener() {
    if (_scrollController.position.pixels >
            _scrollController.position.maxScrollExtent - 200 &&
        controller.isLastPage == false) {
      controller.fetchUsers();
    }
  }
}
