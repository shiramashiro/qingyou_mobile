import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

typedef OnTap = void Function();

typedef CreateActionableListContent = Widget Function(dynamic e);

typedef OnFutureBefore = void Function();

typedef OnFutureSuccess = void Function(Map<String, dynamic> e);

/// 在查询用户信息成功之后
typedef AfterQueryUserInfoSuccess = void Function(dynamic e);

/// 在连接 sqlite 成功之后
typedef AfterConnectedSQLiteSuccess = void Function(Database e);