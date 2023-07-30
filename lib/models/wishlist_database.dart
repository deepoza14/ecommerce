import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class WishlistDatabase {
  static Database? _database;
  static const _tableName = 'wishlist';
  static const _columnId = 'id';
  static const _columnTitle = 'title';
  static const _columnImage = 'image';
  static const _columnPrice = 'price';

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'wishlist.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $_tableName (
          $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
          $_columnTitle TEXT,
          $_columnImage TEXT,
          $_columnPrice REAL
        )
        ''');
      },
    );
  }

  static Future<void> addToWishlist({
    required String title,
    required String image,
    required String price,
  }) async {
    final db = await database;
    await db.insert(
      _tableName,
      {
        _columnTitle: title,
        _columnImage: image,
        _columnPrice: price,
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  static Future<void> removeFromWishlist(String title) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: '$_columnTitle = ?',
      whereArgs: [title],
    );
  }

  static Future<List<Map<String, dynamic>>> getWishlistItems() async {
    final db = await database;
    return db.query(_tableName);
  }
}
