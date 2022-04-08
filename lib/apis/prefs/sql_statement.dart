class FieldConstraint {
  int index;
  String value;

  FieldConstraint({
    required this.index,
    required this.value,
  });
}

class SqlStatement {
  final String tableName;
  static const _sqlTypes = {"String": "TEXT", "int": "INTEGER"};

  SqlStatement({
    required this.tableName,
  });

  /// 添加字段约束
  String _addConstraint(List<FieldConstraint>? constraints, int index, String filed) {
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

  String _primeval2SqlType(Iterable<dynamic> fields, int index) {
    String runtimeType = fields.elementAt(index).runtimeType.toString();
    if (runtimeType == 'Null') {
      return runtimeType = 'TEXT';
    } else {
      return _sqlTypes[runtimeType].toString();
    }
  }

  /// 创建表格的SQL
  /// [model] 实体类，传入实体类，自动创建关于这个实体类的表格字段
  /// [constraints] 字段约束，对字段的约束，字段不全都有，可以有 0 个，可以没有。对第一个字段约束时，index 为 0。
  String sqlOfCreatingTable(Map<String, dynamic> model, List<FieldConstraint>? constraints) {
    String sql = 'CREATE TABLE $tableName(';
    for (int index = 0; index < model.length; index++) {
      String filedName = model.keys.elementAt(index);
      String filedType = _addConstraint(constraints, index, _primeval2SqlType(model.values, index));
      String slice = '$filedName $filedType';
      if (index == model.length - 1) {
        sql += slice;
      } else {
        sql += slice + ',';
      }
    }
    return sql += ')';
  }
}
