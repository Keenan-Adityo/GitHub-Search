import 'package:core/data/models/issues_search_model.dart';
import 'package:core/data/models/repo_search_model.dart';
import 'package:core/data/models/user_model.dart';
import 'package:core/utils/encrypt.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblUserCache = 'cacheUser';
  static const String _tblIssuesCache = 'cacheIssues';
  static const String _tblRepoCache = 'cacheRepo';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/github_search.db';

    var db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreate,
      password: encrypt('password'),
    );
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblUserCache (
        id INTEGER,
        avatarUrl TEXT,
        url TEXT,
        login TEXT
        idUserCache INTEGER PRIMARY KEY AUTOINCREMENT
      );
    ''');
    await db.execute('''
      CREATE TABLE  $_tblIssuesCache (
        id INTEGER,
        title TEXT,
        user TEXT,
        state TEXT,
        updatedAt TEXT,
        idIssuesCache INTEGER PRIMARY KEY AUTOINCREMENT
      );
    ''');

    await db.execute('''
      CREATE TABLE  $_tblRepoCache (
        id INTEGER,
        name TEXT,
        owner TEXT,
        createdAt TEXT,
        stargazersCount INTEGER,
        watchersCount INTEGER,
        forksCount INTEGER,
        idRepoCache INTEGER PRIMARY KEY AUTOINCREMENT
      );
    ''');
  }

  Future<void> insertUserCacheTransaction(List<UserModel> users) async {
    final db = await database;
    db!.transaction((txn) async {
      for (final user in users) {
        final userJson = user.toJson();
        txn.insert(_tblUserCache, userJson);
      }
    });
  }

  Future<void> insertIssuesCacheTransaction(List<IssuesModel> issues) async {
    final db = await database;
    db!.transaction((txn) async {
      for (final issue in issues) {
        final issueJson = issue.toJson();
        txn.insert(_tblIssuesCache, issueJson);
      }
    });
  }

  Future<void> insertRepoCacheTransaction(List<RepoModel> repos) async {
    final db = await database;
    db!.transaction((txn) async {
      for (final repo in repos) {
        final repoJson = repo.toJson();
        txn.insert(_tblRepoCache, repoJson);
      }
    });
  }

  Future<List<Map<String, dynamic>>> getUserCache() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblUserCache);

    return results;
  }

  Future<List<Map<String, dynamic>>> getIssuesCache() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblIssuesCache);

    return results;
  }

  Future<List<Map<String, dynamic>>> getRepoCache() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblRepoCache);

    return results;
  }

  Future<int> clearUserCache() async {
    final db = await database;
    return await db!.delete(
      _tblUserCache,
    );
  }

  Future<int> clearIssuesCache() async {
    final db = await database;
    return await db!.delete(
      _tblUserCache,
    );
  }

  Future<int> clearRepoCache() async {
    final db = await database;
    return await db!.delete(
      _tblUserCache,
    );
  }
}
