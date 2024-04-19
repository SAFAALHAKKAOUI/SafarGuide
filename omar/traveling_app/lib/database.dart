import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/rating.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
    }
    return _db; // Ajoutez cette ligne pour renvoyer la valeur de _db dans la clause else.
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'rating.db');

    Database mydb = await openDatabase(path, onCreate: _onCreate);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE ratings ("id" INTEGER PRIMARY KEY, "score" REAL, "review" TEXT)

''');
    print("Create database");
  }

  Future insertRating(double score, String review) async {
    await _db?.insert(
      'ratings',
      {
        'score': score,
        'review': review,
      },
    );
  }

  Future<List<Map<String, Object?>>?> fetchRatings() async {
    return await _db?.query('ratings');
  }

  Future closeDatabase() async {
    await _db?.close();
  }
}
