import 'dart:async';

import 'package:floor/floor.dart';
import 'package:trip_demo/src/core/local/dao/trip_model_dao.dart';
import 'package:trip_demo/src/core/model/trip_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [TripModel])
abstract class AppDatabase extends FloorDatabase {
  AppDatabase();

  TripModelDao get tripModelDao;

  Future<void> deleteAllTable() async {
    await database.execute('DELETE FROM TripModel');
  }

  static Future<AppDatabase> build() =>
      $FloorAppDatabase.databaseBuilder("2.db").build();
}
