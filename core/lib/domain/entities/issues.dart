import 'package:core/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class Issues extends Equatable {
  const Issues({
    required this.title,
    required this.updatedAt,
    // required this.user,
    required this.id,
    required this.state,
  });

  final String state;
  final int id;
  final String title;
  // final User user;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        title,
        updatedAt,
        // required this.user,
        id,
        state,
      ];
}
