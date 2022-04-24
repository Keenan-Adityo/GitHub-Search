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

  const UserHasData(this.result);

  @override
  List<Object?> get props => [result];
}

class UserError extends SearchUserState {
  final String message;
 
  const UserError(this.message);
 
  @override
  List<Object> get props => [message];
}
