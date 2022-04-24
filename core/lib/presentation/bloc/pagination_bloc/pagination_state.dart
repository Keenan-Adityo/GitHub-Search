part of 'pagination_bloc.dart';

@immutable
abstract class PaginationState extends Equatable {
  final String pagination;

  const PaginationState({required this.pagination});

  @override
  List<Object?> get props => [pagination];
}

class LazyState extends PaginationState {
  const LazyState({required String pagination}) : super(pagination: pagination);
}

class IndexState extends PaginationState {
  const IndexState({required String pagination}) : super(pagination: pagination);
}
