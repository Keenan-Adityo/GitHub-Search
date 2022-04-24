part of 'search_issues_bloc.dart';

@immutable
abstract class SearchIssuesEvent extends Equatable {
  const SearchIssuesEvent();

  @override
  List<Object?> get props => [];
}

class OnSubmittedIssues extends SearchIssuesEvent {
  final String query;

  const OnSubmittedIssues(this.query);

  @override
  List<Object> get props => [query];
}