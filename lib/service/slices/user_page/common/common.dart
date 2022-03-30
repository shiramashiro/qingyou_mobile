import 'package:qingyuo_mobile/database/sqlite_operation.dart';
import 'package:qingyuo_mobile/utils/callbacks.dart';

class Common {
  getDbService(String table, AfterConnectedSQLiteSuccess connected) async {
    var sqlOp = SQLiteOperation(table: table);
    var sqlDb = await sqlOp.connectSQLite();
    connected(sqlDb);
  }
}
