import 'package:core/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:core/presentation/bloc/pagination_bloc/pagination_bloc.dart';
import 'package:core/presentation/widgets/index_footer.dart';
import 'package:core/presentation/widgets/list.dart';
import 'package:core/presentation/widgets/paginations.dart';
import 'package:core/presentation/widgets/search_category.dart';
import 'package:core/presentation/widgets/sliver_delegate.dart';
import 'package:core/presentation/widgets/grid.dart';
import 'package:core/styles/colors.dart';
import 'package:core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return const UserSearchList();
          } else if (constraints.maxWidth <= 1200) {
            return const UserSearchGrid(gridCount: 4);
          } else {
            return const UserSearchGrid(gridCount: 6);
          }
        },
      ),
    );
  }
}

class UserSearchList extends StatefulWidget {
  const UserSearchList({Key? key}) : super(key: key);

  @override
  State<UserSearchList> createState() => _UserSearchListState();
}

class _UserSearchListState extends State<UserSearchList> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<PaginationBloc, PaginationState>(
          builder: (context, pageState) {
        return BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, categoryState) {
            if (pageState is LazyState) {
              return Scaffold(
                body: LazyLoadScrollView(
                  onEndOfPage: () {
                    if (categoryState.category == 'User' &&
                        categoryState.userResult.isNotEmpty) {
                      context
                          .read<CategoryBloc>()
                          .add(OnScrollUser(_textController.text));
                    } else if (categoryState.category == 'Issues' &&
                        categoryState.issuesResult.isNotEmpty) {
                      context
                          .read<CategoryBloc>()
                          .add(OnScrollIssues(_textController.text));
                    } else if (categoryState.category == 'Repositories' &&
                        categoryState.repoResult.isNotEmpty) {
                      context
                          .read<CategoryBloc>()
                          .add(OnScrollRepo(_textController.text));
                    }
                  },
                  child: ListCustomScrollView(textController: _textController),
                ),
              );
            } else {
              return Scaffold(
                body: ListCustomScrollView(textController: _textController),
                persistentFooterButtons: [
                  IndexFooter(
                    textController: _textController,
                  ),
                ],
              );
            }
          },
        );
      }),
    );
  }
}

class ListCustomScrollView extends StatelessWidget {
  const ListCustomScrollView({
    Key? key,
    required TextEditingController textController,
  })  : _textController = textController,
        super(key: key);

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          expandedHeight: 100,
          backgroundColor: mainColor,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                return TextField(
                  controller: _textController,
                  onSubmitted: (query) {
                    if (state.category == 'User') {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedUser(query, 1));
                    } else if (state.category == 'Issues') {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedIssues(query, 1));
                    } else {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedRepo(query, 1));
                    }
                  },
                  style: kHeading6.copyWith(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: 'Search Here',
                    hintStyle: kSubtitle.copyWith(color: Colors.grey[300]),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SliverHeader(),
        BlocBuilder<PaginationBloc, PaginationState>(
          builder: (context, state) {
            if (state is LazyState) {
              return const LazyLoadingList();
            } else {
              return const WithIndexList();
            }
          },
        ),
      ],
    );
  }
}

class UserSearchGrid extends StatefulWidget {
  final int gridCount;

  const UserSearchGrid({required this.gridCount, Key? key}) : super(key: key);

  @override
  State<UserSearchGrid> createState() => _UserSearchGridState();
}

class _UserSearchGridState extends State<UserSearchGrid> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<PaginationBloc, PaginationState>(
          builder: (context, pageState) {
        return BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, categoryState) {
            if (pageState is LazyState) {
              return Scaffold(
                body: LazyLoadScrollView(
                  onEndOfPage: () {
                    if (categoryState.category == 'User' &&
                        categoryState.userResult.isNotEmpty) {
                      context
                          .read<CategoryBloc>()
                          .add(OnScrollUser(_textController.text));
                    } else if (categoryState.category == 'Issues' &&
                        categoryState.issuesResult.isNotEmpty) {
                      context
                          .read<CategoryBloc>()
                          .add(OnScrollIssues(_textController.text));
                    } else if (categoryState.category == 'Repositories' &&
                        categoryState.repoResult.isNotEmpty) {
                      context
                          .read<CategoryBloc>()
                          .add(OnScrollRepo(_textController.text));
                    }
                  },
                  child: GridCustomScrollView(
                    textController: _textController,
                    gridCount: widget.gridCount,
                  ),
                ),
              );
            } else {
              return Scaffold(
                body: GridCustomScrollView(
                    textController: _textController,
                    gridCount: widget.gridCount),
                persistentFooterButtons: [
                  IndexFooter(
                    textController: _textController,
                  ),
                ],
              );
            }
          },
        );
      }),
    );
  }
}

class GridCustomScrollView extends StatelessWidget {
  final int gridCount;
  const GridCustomScrollView({
    required this.gridCount,
    Key? key,
    required TextEditingController textController,
  })  : _textController = textController,
        super(key: key);

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          expandedHeight: 100,
          backgroundColor: mainColor,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                return TextField(
                  controller: _textController,
                  onSubmitted: (query) {
                    if (state.category == 'User') {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedUser(query, 1));
                    } else if (state.category == 'Issues') {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedIssues(query, 1));
                    } else {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedRepo(query, 1));
                    }
                  },
                  style: kHeading6.copyWith(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: 'Search Here',
                    hintStyle: kSubtitle.copyWith(color: Colors.grey[300]),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SliverHeader(),
        Grid(
          gridCount: gridCount,
        ),
      ],
    );
  }
}

class SliverHeader extends StatelessWidget {
  const SliverHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverDelegate(
        minHeight: 130,
        maxHeight: 130,
        child: Container(
          color: mainColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<CategoryBloc>().add(OnChangeUser());
                    },
                    child: const SearchCategory(category: 'User'),
                  ),
                  InkWell(
                    onTap: (() {
                      context.read<CategoryBloc>().add(OnChangeIssues());
                    }),
                    child: const SearchCategory(category: 'Issues'),
                  ),
                  InkWell(
                    onTap: (() {
                      context.read<CategoryBloc>().add(OnChangeRepo());
                    }),
                    child: const SearchCategory(category: 'Repositories'),
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<PaginationBloc>().add(OnChangeLazy());
                    },
                    child: const Paginations(
                      pagination: 'Lazy Loading',
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  InkWell(
                    onTap: () {
                      context.read<PaginationBloc>().add(OnChangeIndex());
                    },
                    child: const Paginations(
                      pagination: 'With Index',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
