part of 'search_issues_bloc.dart';

@immutable
abstract class SearchIssuesState extends Equatable {
  const SearchIssuesState();

  @override
  List<Object?> get props => [];
}

class IssuesEmpty extends SearchIssuesState {}

class IssuesLoading extends SearchIssuesState {}

class IssuesHasData extends SearchIssuesState {
  final List<Issues> result;

  const IssuesHasData(this.result);

  @override
  List<Object?> get props => [result];
}

class IssuesError extends SearchIssuesState {
  final String message;

  const IssuesError(this.message);

  @override
  List<Object> get props => [message];
}
