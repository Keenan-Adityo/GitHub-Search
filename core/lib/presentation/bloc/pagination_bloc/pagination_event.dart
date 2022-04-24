part of 'pagination_bloc.dart';

@immutable
abstract class PaginationEvent extends Equatable {
  const PaginationEvent();

  @override
  List<Object?> get props => [];
}

class OnChangeLazy extends PaginationEvent {}

class OnChangeIndex extends PaginationEvent {}