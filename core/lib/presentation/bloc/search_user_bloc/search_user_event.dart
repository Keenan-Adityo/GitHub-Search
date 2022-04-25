part of 'search_user_bloc.dart';

@immutable
abstract class SearchUserEvent extends Equatable {
  const SearchUserEvent();

  @override
  List<Object?> get props => [];
}

class OnSubmittedUser extends SearchUserEvent {
  final String query;

  const OnSubmittedUser(this.query);

  @override
  List<Object> get props => [query];
}

class OnScrollUser extends SearchUserEvent {
  final String query;

  const OnScrollUser(this.query);

  @override
  List<Object> get props => [query];
}
