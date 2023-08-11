import 'dart:convert';

import 'package:getx_users/data/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase {

  void saveUsers(List<UserEntity> responseData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> usrList =
        responseData.map((item) => jsonEncode(item.toMap())).toList();

    prefs.setStringList("usersList", usrList);
  }

  Future<List<UserEntity>> readUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? listString = prefs.getStringList('list');
    List<UserEntity> list = [];
    if (listString != null) {
      list = listString
          .map((item) => UserEntity.fromMap(json.decode(item)))
          .toList();
    }
    return list;
  }
}
