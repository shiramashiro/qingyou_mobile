import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserProfileSliceService {

  static const String databaseName = 'user_database';
  static const String tableName = 'user_info';

  Future<String> _getPath() async {
    return join(await getDatabasesPath(), '$databaseName.db');
  }

  Future<Database> _getDb() async {
    return openDatabase(await _getPath());
  }

  // 1. 增
  insertUserInfo() {

  }

  // 2. 删
  deleteUserInfo() {

  }

  // 3. 改
  updateUserInfo() {

  }

  // 4. 查
  queryUserInfo() {}

}
