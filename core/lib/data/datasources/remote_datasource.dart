import 'dart:convert';

import 'package:core/data/models/issues_search_model.dart';
import 'package:core/data/models/repo_search_model.dart';
import 'package:core/data/models/user_model.dart';
import 'package:core/data/models/user_search_response.dart';
import 'package:core/utils/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<UserModel>> getUserSearch(String query);
  Future<List<IssueModel>> getIssuesSearch(String query);
  Future<List<RepoModel>> getRepoSearch(String query);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  static const String _baseURL = 'https://api.github.com/search';

  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserModel>> getUserSearch(String query) async {
    final http.Response response = await http.get(
      Uri.parse(_baseURL + '/users?q=$query&per_page=20'),
    );

    final result = UserSearchResponse.fromJson(json.decode(response.body));
    print(result);

    if (response.statusCode == 200) {
      return userSearchResponseFromJson(response.body).user;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<IssueModel>> getIssuesSearch(String query) async {
    final http.Response response = await http.get(
      Uri.parse(_baseURL + '/issues?q=$query&per_page=10'),
    );

    print('nabrak');
    final result = IssuesSearchResponse.fromJson(json.decode(response.body));
    print(result);
    print('leawt');

    if (response.statusCode == 200) {
      return IssuesSearchResponse.fromJson(json.decode(response.body)).issue;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<RepoModel>> getRepoSearch(String query) async {
    final http.Response response = await http.get(
      Uri.parse(_baseURL + '/repositories?q=$query&per_page=100'),
    );

    if (response.statusCode == 200) {
      return RepoSearchResponse.fromJson(json.decode(response.body)).repo;
    } else {
      throw ServerException();
    }
  }
}
