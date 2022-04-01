import 'dart:convert';

import 'package:qingyuo_mobile/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileSliceService {
  Future<Map<String, Object?>> getUser({List<String>? where}) async {
    var prefs = await SharedPreferences.getInstance();
    var jsonString = prefs.getString('user_info');
    var userObject = User.fromJson(jsonDecode(jsonString!));
    if (where != null) {
      return _matchesWithWhere(userObject, where);
    } else {
      return userObject.toJson();
    }
  }

  Map<String, Object?> _matchesWithWhere(User sourceObject, List<String> where) {
    Map<String, Object?> resultMap = {};
    var sourceMap = sourceObject.toJson();
    for (int i = 0; i < where.length; i++) {
      for (int j = 0; j < sourceMap.keys.length; j++) {
        var key = sourceMap.keys.elementAt(j);
        if (where[i] == key) {
          var value = sourceMap.values.elementAt(j);
          resultMap[key] = value;
        }
      }
    }
    return resultMap;
  }
}
