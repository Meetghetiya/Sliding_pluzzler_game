import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../Board.dart';

class MyDatabase {
  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'slidegame.db');
    return await openDatabase(databasePath);
  }

  Future<bool> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "slidegame.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data =
          await rootBundle.load(join('assets/mydatabase2', 'slidegame.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
      return true;
    }
    return false;
  }

  Future<List<Map<String, Object?>>> getStudentinfo() async {
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
        await db.rawQuery('select id,wingame, besttime,bestmoves from Grid2');
    return data;
  }

  Future<int> insert() async {
    Database db = await initDatabase();
    // final db = await instance.database;
    return await db.insert(
        'Grid2', {'id': 2, 'wingame': 0, 'besttime': 0, 'bestmoves': 0});
  }

  Future<Game?> getGame(int id) async {
    Database db = await initDatabase();
    Database dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient.query('Grid2',
        columns: ['id', 'wingame', 'besttime', 'bestmoves'],
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Game.fromMap(maps.first);
    }
    return null;
  }

  Future<Game2?> getGame2(int id) async {
    Database db = await initDatabase();
    Database dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient.query('total',
        columns: ['id', 'total'], where: 'id = ?', whereArgs: [id]);
    if (maps.length > 0) {
      return Game2.fromMap(maps.first);
    }
    return null;
  }

  // Future<Map<String, dynamic>?> getById(int id) async {
  //   Database db = await initDatabase();
  //   final result = await db.query('Grid2', where: 'id = ?', whereArgs: [id]);
  //   return result.isNotEmpty ? result.first : null;
  // }

  Future<void> delete(int id) async {
    final db = await initDatabase();
    await db.delete('Grid2', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateGame(Game game) async {
    final db = await initDatabase();
    Database dbClient = await db;
    return await dbClient
        .update('Grid2', game.toMap(), where: 'id = ?', whereArgs: [game.id]);
  }

  Future<int> updateGame2(Game2 game2) async {
    final db = await initDatabase();
    Database dbClient = await db;
    return await dbClient
        .update('total', game2.toMap(), where: 'id = ?', whereArgs: [game2.id]);
  }

  Future<void> update(int id, updatedItem) async {
    final db = await initDatabase();
    await db.update(
      'Grid2',
      updatedItem,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
