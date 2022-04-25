import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/data/models/issues_search_model.dart';
import 'package:core/data/models/repo_search_model.dart';
import 'package:core/data/models/user_model.dart';
import 'package:core/utils/exceptions.dart';

abstract class LocalDataSource {
  Future<void> cacheUser(List<UserModel> user);
  Future<List<UserModel>> getCachedUser();
  Future<void> cacheIssues(List<IssuesModel> issues);
  Future<List<IssuesModel>> getCachedIssues();
  Future<void> cacheRepo(List<RepoModel> repo);
  Future<List<RepoModel>> getCachedRepo();
}

class LocalDataSourceImpl implements LocalDataSource {
  final DatabaseHelper databaseHelper;

  LocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<void> cacheUser(List<UserModel> user) async {
    await databaseHelper.clearUserCache();
    await databaseHelper.insertUserCacheTransaction(user);
  }

  @override
  Future<List<UserModel>> getCachedUser() async {
    final result = await databaseHelper.getUserCache();
    if (result.isNotEmpty) {
      return result.map((data) => UserModel.fromJson(data)).toList();
    } else {
      throw CacheException("Can't get the data :(");
    }
  }

  @override
  Future<void> cacheIssues(List<IssuesModel> issues) async {
    await databaseHelper.clearIssuesCache();
    await databaseHelper.insertIssuesCacheTransaction(issues);
  }

  @override
  Future<List<IssuesModel>> getCachedIssues() async {
    final result = await databaseHelper.getIssuesCache();
    if (result.isNotEmpty) {
      return result.map((data) => IssuesModel.fromJson(data)).toList();
    } else {
      throw CacheException("Can't get the data :(");
    }
  }

  @override
  Future<void> cacheRepo(List<RepoModel> repo) async {
    await databaseHelper.clearRepoCache();
    await databaseHelper.insertRepoCacheTransaction(repo);
  }

  @override
  Future<List<RepoModel>> getCachedRepo() async {
    final result = await databaseHelper.getRepoCache();
    if (result.isNotEmpty) {
      return result.map((data) => RepoModel.fromJson(data)).toList();
    } else {
      throw CacheException("Can't get the data :(");
    }
  }
}