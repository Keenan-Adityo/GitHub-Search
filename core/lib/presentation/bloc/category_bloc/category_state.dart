part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  final String category;
  const CategoryState({required this.category});

  @override
  List<Object?> get props => [category];
}

class UserState extends CategoryState {
  const UserState({required String category}) : super(category: category);
}

class IssuesState extends CategoryState {
  const IssuesState({required String category}) : super(category: category);
}

class RepoState extends CategoryState {
  const RepoState({required String category}) : super(category: category);
}