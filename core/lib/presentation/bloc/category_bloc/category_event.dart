part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class OnChangeUser extends CategoryEvent {}

class OnChangeIssues extends CategoryEvent {}

class OnChangeRepo extends CategoryEvent {}

class OnSubmittedUser extends CategoryEvent {
  final String query;
  final int page;

  const OnSubmittedUser(this.query, this.page);

  @override
  List<Object> get props => [query, page];
}

class OnScrollUser extends CategoryEvent {
  final String query;

  const OnScrollUser(this.query);

  @override
  List<Object> get props => [query];
}

class OnSubmittedIssues extends CategoryEvent {
  final String query;
  final int page;

  const OnSubmittedIssues(this.query, this.page);

  @override
  List<Object> get props => [query];
}

class OnScrollIssues extends CategoryEvent {
  final String query;

  const OnScrollIssues(this.query);

  @override
  List<Object> get props => [query];
}

class OnSubmittedRepo extends CategoryEvent {
  final String query;
  final int page;

  const OnSubmittedRepo(this.query, this.page);

  @override
  List<Object> get props => [query];
}

class OnScrollRepo extends CategoryEvent {
  final String query;

  const OnScrollRepo(this.query);

  @override
  List<Object> get props => [query];
}
