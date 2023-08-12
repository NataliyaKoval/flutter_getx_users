import 'dart:convert';

import 'package:getx_users/data/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase {
  void saveUsers(List<UserEntity> responseData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Set<UserEntity> allUsers = {};
    List<String>? oldListString = prefs.getStringList('usersList');
    if (oldListString != null) {
      allUsers = oldListString
          .map((item) => UserEntity.fromMap(json.decode(item)))
          .toSet();
    }
    allUsers.addAll(responseData);

    List<String> usersListString =
        allUsers.map((item) => jsonEncode(item.toMap())).toList();

    prefs.setStringList("usersList", usersListString);
  }

  Future<List<UserEntity>> readUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? listString = prefs.getStringList('usersList');
    List<UserEntity> list = [];
    if (listString != null) {
      list = listString
          .map((item) => UserEntity.fromMap(json.decode(item)))
          .toList();
    }
    return list;
  }
}
