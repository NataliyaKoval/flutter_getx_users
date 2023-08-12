import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_users/consts/app_strings.dart';
import 'package:getx_users/presentation/detail_screen/detail_controller.dart';
import 'package:getx_users/presentation/detail_screen/widgets/info_row.dart';

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
              : Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: controller.user.avatar,
                      width: 250,
                      fit: BoxFit.fitWidth,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InfoRow(
                      subtitle: AppStrings.userId,
                      text: controller.user.id.toString(),
                    ),
                    InfoRow(
                      subtitle: AppStrings.firstName,
                      text: controller.user.firstName,
                    ),
                    InfoRow(
                      subtitle: AppStrings.lastName,
                      text: controller.user.lastName,
                    ),
                    InfoRow(
                      subtitle: AppStrings.email,
                      text: controller.user.email,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
