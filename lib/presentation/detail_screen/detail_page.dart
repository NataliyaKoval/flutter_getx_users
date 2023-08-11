import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_users/presentation/detail_screen/detail_controller.dart';

class DetailPage extends StatelessWidget {
  DetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;
  final DetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<DetailController>(
          init: controller,
          initState: (state) {
            controller.getDetail(id);
          },
          builder: (controller) => controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Text(controller.user.firstName),
        ),
      ),
    );
  }
}
