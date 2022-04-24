import 'package:core/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:core/presentation/bloc/pagination_bloc/pagination_bloc.dart';
import 'package:core/presentation/widgets/paginations.dart';
import 'package:core/presentation/widgets/search_category.dart';
import 'package:core/presentation/widgets/sliver_delegate.dart';
import 'package:core/styles/colors.dart';
import 'package:core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSearchPage extends StatelessWidget {
  const UserSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return const UserSearchList();
          } else if (constraints.maxWidth <= 1200) {
            return const UserSearchGrid();
          } else {
            return const UserSearchGrid();
          }
        },
      ),
    );
  }
}

class UserSearchList extends StatelessWidget {
  const UserSearchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // TODO: sliver appbar bentuknya dibenerin
            SliverAppBar(
              floating: true,
              expandedHeight: 100,
              backgroundColor: mainColor,
              flexibleSpace: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
                child: TextField(
                  onChanged: (query) {},
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
                ),
              ),
            ),
            const SliverHeader(),
          ],
        ),
      ),
    );
  }
}

class UserSearchGrid extends StatelessWidget {
  const UserSearchGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SliverHeader extends StatelessWidget {
  const SliverHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverDelegate(
        minHeight: 120,
        maxHeight: 120,
        child: Container(
          color: mainColor,
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                height: 16,
              ),
              Row(
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