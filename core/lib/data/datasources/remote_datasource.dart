import 'dart:convert';

import 'package:core/data/models/issues_search_model.dart';
import 'package:core/data/models/repo_search_model.dart';
import 'package:core/data/models/user_model.dart';
import 'package:core/data/models/user_search_response.dart';
import 'package:core/utils/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<UserModel>> getUserSearch(String query, int page);
  Future<List<IssuesModel>> getIssuesSearch(String query, int page);
  Future<List<RepoModel>> getRepoSearch(String query, int page);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  static const String _baseURL = 'https://api.github.com/search';

  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserModel>> getUserSearch(String query, int page) async {
    final http.Response response = await http.get(
      Uri.parse(_baseURL + '/users?q=$query&page=$page&per_page=10'),
    );

    if (response.statusCode == 200) {
      return UserSearchResponse.fromJson(json.decode(response.body)).items;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<IssuesModel>> getIssuesSearch(String query, int page) async {
    final http.Response response = await http.get(
      Uri.parse(_baseURL + '/issues?q=$query&page=$page&per_page=10'),
    );

    if (response.statusCode == 200) {
      return IssuesSearchResponse.fromJson(json.decode(response.body)).items;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<RepoModel>> getRepoSearch(String query, int page) async {
    final http.Response response = await http.get(
      Uri.parse(_baseURL + '/repositories?q=$query&page=$page&per_page=10'),
    );

    if (response.statusCode == 200) {
      return RepoSearchResponse.fromJson(json.decode(response.body)).items;
    } else {
      throw ServerException();
    }
  }
}
