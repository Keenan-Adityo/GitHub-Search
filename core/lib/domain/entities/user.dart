import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.avatarUrl,
    required this.url,
    required this.login,
    required this.id,
  });

  final String login;
  final int id;
  final String avatarUrl;
  final String url;

  @override
  List<Object?> get props => [
    avatarUrl,
    url,
    login,
    id,
  ];
}
