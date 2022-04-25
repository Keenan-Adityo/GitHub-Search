import 'dart:convert';

import 'package:core/data/models/user_model.dart';

// class UserSearchResponse extends Equatable {
//   const UserSearchResponse({
//     required this.totalCount,
//     required this.incompleteResults,
//     required this.user,
//   });

//   final int totalCount;
//   final bool incompleteResults;
//   final List<UserModel> user;

//   factory UserSearchResponse.fromJson(Map<String, dynamic> json) =>
//       UserSearchResponse(
//         totalCount: json["total_count"],
//         incompleteResults: json["incomplete_results"],
//         user: List<UserModel>.from(
//             (json["items"] as List).map((x) => UserModel.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "total_count": totalCount,
//         "incomplete_results": incompleteResults,
//         "items": List<dynamic>.from(user.map((x) => x.toJson())),
//       };

//   @override
//   List<Object?> get props => [totalCount, incompleteResults, user];
// }
// To parse this JSON data, do
//
//     final userSearchResponse = userSearchResponseFromJson(jsonString);

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


