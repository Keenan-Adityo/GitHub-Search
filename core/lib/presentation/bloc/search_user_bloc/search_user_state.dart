part of 'search_user_bloc.dart';

@immutable
abstract class SearchUserState extends Equatable {
  const SearchUserState();

  @override
  List<Object?> get props => [];
}

class UserEmpty extends SearchUserState {}

class UserLoading extends SearchUserState {}

class UserHasData extends SearchUserState {
  final List<User> result;
  final int page;
  final bool hasReachedMax;

  const UserHasData({required this.result, required this.hasReachedMax, required this.page});

  UserHasData copywith({List<User>? result, bool? hasReachedMax, int? page}) {
    return UserHasData(
      result: result ?? this.result,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [result];
}

class UserError extends SearchUserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object> get props => [message];
}
