import 'package:core/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:core/presentation/bloc/pagination_bloc/pagination_bloc.dart';
import 'package:core/presentation/bloc/search_issues_bloc/search_issues_bloc.dart';
import 'package:core/presentation/bloc/search_repo_bloc/search_repo_bloc.dart';
import 'package:core/presentation/bloc/search_user_bloc/search_user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/presentation/pages/search_page.dart';
import 'package:sejutacita_github_search/injection.dart' as inject;
import 'package:flutter/material.dart';

void main() {
  inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => inject.locator<CategoryBloc>(),
        ),
        BlocProvider(
          create: (_) => inject.locator<PaginationBloc>(),
        ),
        BlocProvider(
          create: (_) => inject.locator<SearchUserBloc>(),
        ),
        BlocProvider(
          create: (_) => inject.locator<SearchIssuesBloc>(),
        ),
        BlocProvider(
          create: (_) => inject.locator<SearchRepoBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SejutaCita Github Search',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SearchPage(),
      ),
    );
  }
}
