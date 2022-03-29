import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FieldConstraint {
  int index;
  String value;

  FieldConstraint({
    required this.index,
    required this.value,
  });
}

class SQLiteOperation {
  final String table;
  static const _sqliteTypes = {"String": "TEXT", "int": "INTEGER"};

  SQLiteOperation({
    required this.table,
  });

  Future<String> _splicePath() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, '$table.db');
    return path;
  }

  Future<Database> connectSQLite() async {
    return await openDatabase(await _splicePath());
  }

  Future<bool> existence() async {
    return await databaseExists(await _splicePath());
  }

  Future _executeSql(String sql) async {
    await openDatabase(
      await _splicePath(),
      onCreate: (db, version) async {
        await db.execute(sql);
      },
      version: 1,
    );
  }

  String _appendConstraint(List<FieldConstraint>? constraints, {required int index, required String filed}) {
    if (constraints != null) {
      if (index < constraints.length) {
        FieldConstraint constraint = constraints[index];
        if (constraint.index == index) {
          filed += ' ${constraints[index].value}';
        }
      }
    }
    return filed;
  }

  String _toSQLiteType(Iterable<dynamic> fields, int index) {
    String runtimeType = fields.elementAt(index).runtimeType.toString();
    if (runtimeType == 'Null') {
      return runtimeType = 'TEXT';
    } else {
      return _sqliteTypes[runtimeType].toString();
    }
  }

  String _mergeSql(Map<String, dynamic> model, List<FieldConstraint>? constraints) {
    String sql = 'CREATE TABLE $table(';
    for (int i = 0; i < model.length; i++) {
      String filedName = model.keys.elementAt(i);
      String filedType = _appendConstraint(constraints, index: i, filed: _toSQLiteType(model.values, i));
      String slice = '$filedName $filedType';
      if (i == model.length - 1) {
        sql += slice;
      } else {
        sql += slice + ',';
      }
    }
    return sql += ')';
  }

  Future createTable({required Map<String, dynamic> model, List<FieldConstraint>? constraints}) async {
    await _executeSql(_mergeSql(model, constraints));
  }
}
