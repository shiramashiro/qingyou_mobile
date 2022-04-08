import 'package:qingyuo_mobile/apis/prefs/user_prefs.dart';

class HomePageService {
  final UserPrefs _prefs = UserPrefs();

  Future<Map<String, Object?>> getUser({List<String>? where}) {
    return _prefs.getUser(where);
  }
}