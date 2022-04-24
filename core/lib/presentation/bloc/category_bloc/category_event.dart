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