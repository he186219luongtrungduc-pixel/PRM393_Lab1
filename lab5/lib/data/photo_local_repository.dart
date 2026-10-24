import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import '../models/photo.dart';

class PhotoLocalRepository {
  Future<Database>? _openFuture;

  Future<Database> get _database => _openFuture ??= _open();

  Future<Database> _open() async {
    final root = await getDatabasesPath();
    return openDatabase(
      p.join(root, 'lab5_photo_wishlist.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE PhoTo (
            id INTEGER PRIMARY KEY,
            albumId INTEGER NOT NULL,
            title TEXT NOT NULL,
            url TEXT NOT NULL,
            thumbnailUrl TEXT NOT NULL,
            savedAt INTEGER NOT NULL
          )
        ''');
      },
    );
  }

  Future<List<Photo>> getWishlist() async {
    final db = await _database;
    final rows = await db.query(
      'PhoTo',
      orderBy: 'savedAt DESC, id DESC',
    );
    return rows.map(Photo.fromDatabase).toList(growable: false);
  }

  Future<bool> contains(int photoId) async {
    final db = await _database;
    final rows = await db.query(
      'PhoTo',
      columns: ['id'],
      where: 'id = ?',
      whereArgs: [photoId],
      limit: 1,
    );
    return rows.isNotEmpty;
  }

  Future<void> save(Photo photo) async {
    final db = await _database;
    await db.insert(
      'PhoTo',
      {
        ...photo.toDatabase(),
        'savedAt': DateTime.now().millisecondsSinceEpoch,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> remove(int photoId) async {
    final db = await _database;
    await db.delete(
      'PhoTo',
      where: 'id = ?',
      whereArgs: [photoId],
    );
  }
}
