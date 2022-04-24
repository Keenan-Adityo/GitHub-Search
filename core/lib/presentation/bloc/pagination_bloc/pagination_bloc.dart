import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'pagination_event.dart';
part 'pagination_state.dart';

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  PaginationBloc() : super(const LazyState(pagination: 'Lazy Loading')) {
    on<OnChangeLazy>((event, emit) {
      emit(const LazyState(pagination: 'Lazy Loading'));
    });

    on<OnChangeIndex>((event, emit) {
      emit(const IndexState(pagination: 'With Index'));
    });
  }
}
