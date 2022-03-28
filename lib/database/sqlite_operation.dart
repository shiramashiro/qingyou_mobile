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

  Future<Database> open() async {
    return await openDatabase(join(await getDatabasesPath(), table));
  }

  Future<bool> existence() async {
    return await databaseExists(table);
  }

  void _executeSql(
    String sql,
  ) async {
    await openDatabase(
      join(await getDatabasesPath(), table),
      onCreate: (db, version) => db.execute(sql),
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

  String _mergeSql(Map<String, dynamic> model, List<FieldConstraint> constraints) {
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

  void createTable({required Map<String, dynamic> model, required List<FieldConstraint> constraints}) {
    _executeSql(_mergeSql(model, constraints));
  }
}
