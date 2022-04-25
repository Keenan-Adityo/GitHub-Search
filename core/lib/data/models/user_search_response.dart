import 'dart:convert';

import 'package:core/data/models/user_model.dart';

UserSearchResponse userSearchModelFromJson(String str) =>
    UserSearchResponse.fromJson(json.decode(str));

String userSearchModelToJson(UserSearchResponse data) =>
    json.encode(data.toJson());

class UserSearchResponse {
  UserSearchResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  int totalCount;
  bool incompleteResults;
  List<UserModel> items;

  factory UserSearchResponse.fromJson(Map<String, dynamic> json) =>
      UserSearchResponse(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        items: List<UserModel>.from(
            json["items"].map((x) => UserModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "incomplete_results": incompleteResults,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}


