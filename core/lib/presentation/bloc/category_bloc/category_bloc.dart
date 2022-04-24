import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const UserState(category: 'User')) {
    on<OnChangeUser>((event, emit) {
      emit(const UserState(category: 'User'));
    });

    on<OnChangeIssues>((event, emit) {
      emit(const IssuesState(category: 'Issues'));
    });

    on<OnChangeRepo>((event, emit) {
      emit(const RepoState(category: 'Repositories'));
    });
  }
}
