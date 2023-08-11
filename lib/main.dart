import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_users/main_binding.dart';
import 'package:getx_users/presentation/users_screen/users_binding.dart';
import 'package:getx_users/presentation/users_screen/users_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MainBinding mainBinding = MainBinding();
  await mainBinding.dependencies();
  runApp(GetMaterialApp(
    initialRoute: '/',
    initialBinding: UsersBinding(),
    home: const UsersPage(),
  ));
}
