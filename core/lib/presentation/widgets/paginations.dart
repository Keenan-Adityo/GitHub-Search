import 'package:core/presentation/bloc/pagination_bloc/pagination_bloc.dart';
import 'package:core/styles/colors.dart';
import 'package:core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Paginations extends StatelessWidget {
  final String pagination;

  const Paginations({required this.pagination, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: BlocBuilder<PaginationBloc, PaginationState>(
          builder: (context, state) {
            if (pagination == state.pagination) {
              return Container(
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    pagination,
                    style: kHeading6.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: mainColor,
                ),
              );
            } else {
              return Container(
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    pagination,
                    style: kHeading6.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
